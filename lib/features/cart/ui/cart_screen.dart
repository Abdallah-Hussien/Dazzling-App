import 'dart:developer';

import 'package:dazzling/features/cart/logic/cart_states.dart';
import 'package:dazzling/features/home/data/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes_names.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/font_weight_helper.dart';
import '../../../core/helper/spacing.dart';
import '../logic/cart_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 22.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (context.read<CartCubit>().cartItems.isEmpty) {
            return Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xFF888888),
                ),
              ),
            );
          } else {
            var cartlist = context.watch<CartCubit>().cartItems;
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    itemCount: cartlist.length,
                    separatorBuilder: (_, __) => Spacing.vertical(12),
                    itemBuilder: (context, index) =>
                        _buildCartItem(cartlist[index].meal!, index),
                  ),
                ),
                _buildBottomBar(),
                // _buildBottomNavBar(),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildCartItem(MealModel item, int index) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Food image placeholder
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                item.imageUrl ?? '',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Icon(Icons.fastfood, color: Colors.grey, size: 36.sp),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.semiBold,
                    color: Colors.black,
                  ),
                ),
                Spacing.vertical(2),
                Text(
                  item.description ?? ' ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF888888),
                  ),
                ),
                Spacing.vertical(10),
                Row(
                  children: [
                    // Quantity controls
                    _buildQuantityButton(Icons.remove, () {
                      context.read<CartCubit>().decrement(index);
                    }),
                    SizedBox(width: 12.w),
                    Text(
                      '${context.read<CartCubit>().cartItems[index].meal!.quantity}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeightHelper.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    _buildQuantityButton(
                      Icons.add,
                      () => context.read<CartCubit>().increment(index),
                    ),
                    SizedBox(width: 10.w),
                    // Remove button
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context.read<CartCubit>().remove(index),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                            color: ColorsManager.primary,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Remove',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeightHelper.medium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: ColorsManager.primary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: Colors.white, size: 16.sp),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: const Color(0xFFEEEEEE), width: 1),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF888888),
                ),
              ),
              Text(
                '\$${context.read<CartCubit>().total.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesNames.checkout);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
