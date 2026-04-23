import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/font_weight_helper.dart';
import '../../../core/helper/spacing.dart';

class MohamedScreen extends StatefulWidget {
  const MohamedScreen({super.key});

  @override
  State<MohamedScreen> createState() => _MohamedScreenState();
}

class _MohamedScreenState extends State<MohamedScreen> {
  int _selectedPayment = 0; // 0 = Cash on Delivery, 1 = Debit card
  bool _saveCard = false;

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
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacing.vertical(8),
                  _buildOrderSummarySection(),
                  Spacing.vertical(24),
                  _buildPaymentMethodsSection(),
                  Spacing.vertical(16),
                ],
              ),
            ),
          ),
          // _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildOrderSummarySection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order summary',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.semiBold,
              color: Colors.black,
            ),
          ),
          Spacing.vertical(12),
          _buildSummaryRow('Order', '\$16.48'),
          Spacing.vertical(8),
          _buildSummaryRow('Taxes', '\$0.3'),
          Spacing.vertical(8),
          _buildSummaryRow('Delivery fees', '\$1.5'),
          Spacing.vertical(12),
          const Divider(color: Color(0xFFEEEEEE), thickness: 1),
          Spacing.vertical(12),
          _buildSummaryRow('Total:', '\$18.19', isBold: true),
          Spacing.vertical(10),
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 14.sp,
                color: const Color(0xFF888888),
              ),
              SizedBox(width: 4.w),
              Text(
                'Estimated delivery time:  ',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF888888),
                ),
              ),
              Text(
                '15 - 30 mins',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF888888),
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 15.sp : 13.sp,
            fontWeight: isBold ? FontWeightHelper.bold : FontWeightHelper.regular,
            color: isBold ? Colors.black : const Color(0xFF666666),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 15.sp : 13.sp,
            fontWeight: isBold ? FontWeightHelper.bold : FontWeightHelper.regular,
            color: isBold ? Colors.black : const Color(0xFF666666),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment methods',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeightHelper.semiBold,
            color: Colors.black,
          ),
        ),
        Spacing.vertical(12),
        _buildCashOnDeliveryOption(),
        Spacing.vertical(10),
        _buildDebitCardOption(),
      ],
    );
  }

  Widget _buildCashOnDeliveryOption() {
    final isSelected = _selectedPayment == 0;
    return GestureDetector(
      onTap: () => setState(() => _selectedPayment = 0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1E2923) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF1E2923) : const Color(0xFFEEEEEE),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: ColorsManager.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text(
                  '\$',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                'Cash on Delivery',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.medium,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.white : const Color(0xFFCCCCCC),
                  width: 2,
                ),
                color: Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDebitCardOption() {
    final isSelected = _selectedPayment == 1;
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => _selectedPayment = 1),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected ? ColorsManager.primary : const Color(0xFFEEEEEE),
              ),
            ),
            child: Row(
              children: [
                // VISA logo
                Container(
                  width: 48.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: const Color(0xFFEEEEEE)),
                  ),
                  child: Center(
                    child: Text(
                      'VISA',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeightHelper.extraBold,
                        color: const Color(0xFF1A1F71),
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Debit card',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeightHelper.medium,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '3166 **** **** 0505',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: const Color(0xFF888888),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? ColorsManager.primary : const Color(0xFFCCCCCC),
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsManager.primary,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
        Spacing.vertical(10),
        // Save card checkbox
        GestureDetector(
          onTap: () => setState(() => _saveCard = !_saveCard),
          child: Row(
            children: [
              Container(
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                  color: _saveCard ? Colors.red : Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: _saveCard ? Colors.red : const Color(0xFFCCCCCC),
                  ),
                ),
                child: _saveCard
                    ? Icon(Icons.check, color: Colors.white, size: 12.sp)
                    : null,
              ),
              SizedBox(width: 8.w),
              Text(
                'Save card details for future payments',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF666666),
                ),
              ),
            ],
          ),
        ),
      ],
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
                'Total price',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF888888),
                ),
              ),
              Text(
                '\$18.19',
                style: TextStyle(
                  fontSize: 18.sp,
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
                // Handle Pay Now
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
              child: Text(
                'Pay Now',
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