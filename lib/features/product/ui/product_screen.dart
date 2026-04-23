import 'dart:developer';

import 'package:dazzling/features/home/data/models/meal_model.dart';
import 'package:dazzling/features/product/ui/widgets/items_row.dart';
import 'package:dazzling/features/product/ui/widgets/product_bottom_bar.dart';
import 'package:dazzling/features/product/ui/widgets/product_header.dart';
import 'package:dazzling/features/product/ui/widgets/product_top_section.dart';
import 'package:dazzling/features/product/ui/widgets/spicy_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/logic/cart_cubit.dart';
import '../logic/models/topping_item.dart';

// ─── Order data sent on Add To Cart ──────────────────────────────────────────

class ProductOrder {
  final List<ToppingItem> selectedToppings;
  final List<ToppingItem> selectedSides;
  final SpicyLevel spicyLevel;
  final double totalPrice;
  final MealModel? meal;

  const ProductOrder({
    required this.selectedToppings,
    required this.selectedSides,
    required this.spicyLevel,
    required this.totalPrice,
    this.meal ,
  });
}

// ─── Screen ───────────────────────────────────────────────────────────────────

class ProductScreen extends StatefulWidget {
  final double basePrice;
  final ValueChanged<ProductOrder>? onOrderPlaced;
  final MealModel product;

  const ProductScreen({
    super.key,
    this.basePrice = 18.19,
    this.onOrderPlaced,
    required this.product,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  SpicyLevel _spicyLevel = SpicyLevel.medium;

  final List<ToppingItem> _toppings = [
    ToppingItem(
      name: 'Tomato',
      imagePath: 'assets/images/tomato.png',
      price: 0.50,
    ),
    ToppingItem(
      name: 'Onions',
      imagePath: 'assets/images/onion.png',
      price: 0.30,
    ),
    ToppingItem(
      name: 'Pickles',
      imagePath: 'assets/images/cucumber.png',
      price: 0.30,
    ),
    ToppingItem(
      name: 'Bacons',
      imagePath: 'assets/images/bacon.png',
      price: 1.00,
    ),
  ];

  final List<ToppingItem> _sideOptions = [
    ToppingItem(
      name: 'Fries',
      imagePath: 'assets/images/fries.png',
      price: 2.50,
    ),
    ToppingItem(
      name: 'Coleslaw',
      imagePath: 'assets/images/colslow.png',
      price: 1.50,
    ),
    ToppingItem(
      name: 'Salad',
      imagePath: 'assets/images/lattes.png',
      price: 1.20,
    ),
    ToppingItem(
      name: 'Onion',
      imagePath: 'assets/images/onionrings.png',
      price: 1.80,
    ),
  ];

  double get _totalPrice {
    final toppingSum = _toppings
        .where((t) => t.selected)
        .fold(0.0, (sum, t) => sum + t.price);
    final sideSum = _sideOptions
        .where((s) => s.selected)
        .fold(0.0, (sum, s) => sum + s.price);
    return widget.product.price! + toppingSum + sideSum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductHeader(),
                    ProductTopSection(
                      spicyLevel: _spicyLevel,
                      onSpicyChanged: (level) =>
                          setState(() => _spicyLevel = level),
                      product: widget.product,
                    ),
                    const SizedBox(height: 8),
                    ItemsRow(
                      title: 'Toppings',
                      items: _toppings,
                      onItemToggled: (index) => setState(
                        () => _toppings[index].selected =
                            !_toppings[index].selected,
                      ),
                    ),
                    ItemsRow(
                      title: 'Side options',
                      items: _sideOptions,
                      onItemToggled: (index) => setState(
                        () => _sideOptions[index].selected =
                            !_sideOptions[index].selected,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            ProductBottomBar(
              totalPrice: _totalPrice,
              onAddToCart: _handleAddToCart,
            ),
          ],
        ),
      ),
    );
  }
  void _handleAddToCart() {
    final order = ProductOrder(
      selectedToppings: _toppings.where((t) => t.selected).toList(),
      selectedSides: _sideOptions.where((s) => s.selected).toList(),
      spicyLevel: _spicyLevel,
      totalPrice: _totalPrice,
      meal: widget.product,
    );
    context.read<CartCubit>().addToCart(order);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Added to Card Successfully')));
    log(
      "Order placed: Toppings: ${order.selectedToppings.map((t) => t.name).join(', ')}, Sides: ${order.selectedSides.map((s) => s.name).join(', ')}, Spicy Level: ${order.spicyLevel}, Total Price: \$${order.totalPrice.toStringAsFixed(2)}",
    );
  }
}
