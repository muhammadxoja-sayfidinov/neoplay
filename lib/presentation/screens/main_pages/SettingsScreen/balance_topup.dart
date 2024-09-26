import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';

import '../../../../core/constants/style.dart';
import '../../../widgets/custom_text_field.dart';

class BalanceTopUp extends StatefulWidget {
  const BalanceTopUp({super.key});

  @override
  State<BalanceTopUp> createState() => _BalanceTopUpState();
}

class _BalanceTopUpState extends State<BalanceTopUp> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 1078.w,
          height: 725.h,
          padding: EdgeInsets.all(48.sp),
          decoration: BoxDecoration(
            color: GilosNeutral800,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Balansni to'ldirish",
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
                                "Kashelok raqamingiz:",
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
        padding: EdgeInsets.all(isSelected ? 20.sp : 20.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.r),
          border:
              Border.all(width: 2.w, color: isSelected ? red : Colors.white),
        ),
        child: isSelected
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 430.w,
                      padding: EdgeInsets.all(24.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(width: 2.w, color: red),
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 41.h,
                        child: Image.asset(
                          imgPath,
                        ),
                      )),
                  24.verticalSpace,
                  Text(
                    "Summa kiriting:",
                    style: CustomTextStyle.style400
                        .copyWith(fontSize: 24.sp, color: gilosNeutral),
                  ),
                  20.verticalSpace,
                  CustomTextField(
                    hintText: "32,000 so'm",
                  )
                ],
              )
            : Container(
                alignment: Alignment.centerLeft,
                height: 41.h,
                child: Image.asset(
                  imgPath,
                ),
              ));
  }
}
