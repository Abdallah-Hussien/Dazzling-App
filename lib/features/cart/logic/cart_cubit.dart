import 'dart:developer';

import 'package:dazzling/features/home/data/models/meal_model.dart';
import 'package:dazzling/features/product/ui/product_screen.dart';
import 'package:dazzling/features/product/ui/widgets/spicy_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartChanged());

  List<ProductOrder> cartItems = [
    ProductOrder(
      selectedToppings: [],
      selectedSides: [],
      spicyLevel: SpicyLevel.medium,
      meal: MealModel(
        id: '1',
        name: 'Hamburger',
        description: 'Veggie Burger',
        price: 33.06,
        imageUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200',
        quantity: 2,
      ),
      totalPrice: 6,
    ),
    ProductOrder(
      selectedToppings: [],
      selectedSides: [],
      spicyLevel: SpicyLevel.medium,
      meal: MealModel(
        id: '2',
        name: 'Hamburger',
        description: 'Veggie Burger',
        price: 33.06,
        imageUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200',
        quantity: 2,
      ),
      totalPrice: 36,
    ),
  ];

  void addToCart(ProductOrder order) {
    cartItems.add(order);
    log(
      "Added to cart: ${order.meal?.name!}, Total Price: \$${order.totalPrice.toStringAsFixed(2)}",
    );
    emit(CartChanged());
  }

  double get total => cartItems.fold(
    0,
    (sum, item) =>
        sum +
        ((item.meal!.price! * item.meal!.quantity) +
            (item.totalPrice - item.meal!.price!)),
  );

  void increment(int index) {
    cartItems[index].meal?.quantity++;
    emit(CartChanged());
  }

  void decrement(int index) {
    if (cartItems[index].meal!.quantity > 1) {
      cartItems[index].meal?.quantity--;
      emit(CartChanged());
    }
  }

  void remove(int index) {
    cartItems.removeAt(index);
    emit(CartChanged());
  }
}
