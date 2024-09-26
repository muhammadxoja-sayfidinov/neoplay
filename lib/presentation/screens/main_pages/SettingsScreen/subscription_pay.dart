import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';

import '../../../../core/constants/style.dart';

class SubscriptionPay extends StatefulWidget {
  const SubscriptionPay({super.key});

  @override
  State<SubscriptionPay> createState() => _SubscriptionPayState();
}

class _SubscriptionPayState extends State<SubscriptionPay> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 1078.w,
          height: 580.h,
          padding: EdgeInsets.all(48.sp),
          decoration: BoxDecoration(
            color: GilosNeutral800,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Obunaga 21,890 so’m to’lov qilish",
                style: CustomTextStyle.style600
                    .copyWith(fontSize: 40.sp, color: Colors.white),
              ),
              SizedBox(height: 48.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PaymentOption(
                          imgPath: "assets/peyment_images/click.png",
                          isSelected: true,
                        ),
                        SizedBox(height: 32.sp),
                        PaymentOption(
                          imgPath: "assets/peyment_images/peyme.png",
                        ),
                        SizedBox(height: 32.sp),
                        PaymentOption(
                          imgPath:
                              "assets/peyment_images/uzcard_humo_master_visa.png",
                        ),
                        SizedBox(height: 32.sp),
                        Container(
                          width: 470.w,
                          padding: EdgeInsets.symmetric(
                              vertical: 24.h, horizontal: 32.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: GilosNeutral700,
                              border: Border.all(
                                  width: 2.w, color: gilosNeutral400)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Balasndan to’lash:",
                                style: CustomTextStyle.style400.copyWith(
                                    fontSize: 24.sp, color: gilosNeutral),
                              ),
                              SizedBox(height: 20.sp),
                              Text(
                                "32,000 so’m",
                                style: CustomTextStyle.style600.copyWith(
                                    fontSize: 28.sp, color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 16.sp), // Add spacing between columns
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 470.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Image.asset(
                            "assets/peyment_images/qr_pay.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Click ilovasini ochib QR-kod orqali to'lang",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Payment option widget
class PaymentOption extends StatelessWidget {
  final String imgPath;
  final String? textFieldHint;
  final bool isSelected;

  const PaymentOption({
    required this.imgPath,
    this.textFieldHint,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 470.w,
        padding: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.r),
          border:
              Border.all(width: 2.w, color: isSelected ? red : Colors.white),
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 41.h,
          child: Image.asset(
            imgPath,
          ),
        ));
  }
}
