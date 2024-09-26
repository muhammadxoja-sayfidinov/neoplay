import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/screens/main_pages/SettingsScreen/balance_topup.dart';
import 'package:neoplay/presentation/screens/main_pages/SettingsScreen/subscription_pay.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';
import 'package:neoplay/presentation/widgets/custom_text_field.dart';

class BuysSubscription extends StatefulWidget {
  const BuysSubscription({super.key});

  @override
  State<BuysSubscription> createState() => _BuysSubscriptionState();
}

class _BuysSubscriptionState extends State<BuysSubscription> {
  bool isChecked = false;
  FocusNode btnFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "O’zingizga mos obunani tanlang",
            style: CustomTextStyle.style600
                .copyWith(fontSize: 66.sp, color: Colors.white),
          ),
          48.verticalSpace,
          Row(
            children: [
              SubscriptionCard(
                  "1 oylik obuna",
                  "Filmlar, seriallar va boshqa ko‘p narsalarni cheklovlarsiz tomosha qiling. Yangilangan kontent bazasiga bitta obuna bilan ulaning",
                  "32,150 so’m",
                  "21,890 so’m ",
                  isChecked, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubscriptionPay()),
                );
              }, (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              }, btnFocus),
              32.horizontalSpace,
              SubscriptionCard(
                  "1 oylik obuna",
                  "Filmlar, seriallar va boshqa ko‘p narsalarni cheklovlarsiz tomosha qiling. Yangilangan kontent bazasiga bitta obuna bilan ulaning",
                  "32,150 so’m",
                  "21,890 so’m ",
                  isChecked, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubscriptionPay()),
                );
              }, (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              }, btnFocus),
              32.horizontalSpace,
              SubscriptionCard(
                  "1 oylik obuna",
                  "Filmlar, seriallar va boshqa ko‘p narsalarni cheklovlarsiz tomosha qiling. Yangilangan kontent bazasiga bitta obuna bilan ulaning",
                  "32,150 so’m",
                  "21,890 so’m ",
                  isChecked, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubscriptionPay()),
                );
              }, (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              }, btnFocus),
            ],
          ),
          48.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 764.w,
                padding: EdgeInsets.all(48.sp),
                decoration: BoxDecoration(
                  color: GilosNeutral800,
                  // Add background color similar to the image
                  borderRadius: BorderRadius.circular(50.r), // Rounded corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To’lov va balans",
                      style: CustomTextStyle.style600
                          .copyWith(fontSize: 40.sp, color: Colors.white),
                    ),
                    32.verticalSpace,
                    Text(
                      "Kashelok raqami:",
                      style: CustomTextStyle.style400
                          .copyWith(fontSize: 24.sp, color: gilosNeutral),
                    ),
                    20.verticalSpace,
                    CustomTextField(hintText: "022299", focusNode: btnFocus),
                    32.verticalSpace,
                    Text(
                      "Sizning balansingizda bor:",
                      style: CustomTextStyle.style400
                          .copyWith(fontSize: 24.sp, color: gilosNeutral),
                    ),
                    20.verticalSpace,
                    CustomTextField(
                        hintText: "30,000 so'm", focusNode: btnFocus),
                    32.verticalSpace,
                    CustomButton(
                      color: gilosNeutral600,
                      width: double.infinity,
                      name: "Balansni to'ldirish",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BalanceTopUp()),
                        );
                      },
                      focusNode: btnFocus,
                    ),
                  ],
                ),
              ),
              50.horizontalSpace,
              Container(
                width: 764.w,
                padding: EdgeInsets.all(48.sp),
                decoration: BoxDecoration(
                  color: GilosNeutral800,
                  // Add background color similar to the image
                  borderRadius: BorderRadius.circular(50.r), // Rounded corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To'lovlar tarixi",
                      style: CustomTextStyle.style600
                          .copyWith(fontSize: 40.sp, color: Colors.white),
                    ),
                    32.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "To’lov sanas",
                          style: CustomTextStyle.style400
                              .copyWith(fontSize: 24.sp, color: gilosNeutral),
                        ),
                        275.horizontalSpace,
                        Text(
                          "To’lov summasi",
                          style: CustomTextStyle.style400
                              .copyWith(fontSize: 24.sp, color: gilosNeutral),
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    PaymentHistoryRow("22-yan. 2024, 23:09", "35,000 so'm"),
                    Divider(
                      color: gilosNeutral400,
                      height: 0.5.h,
                    ),
                    PaymentHistoryRow("22-yan. 2024, 23:09", "35,000 so'm"),
                    Divider(
                      color: gilosNeutral400,
                      height: 0.5.h,
                    ),
                    PaymentHistoryRow("22-yan. 2024, 23:09", "32,000 so'm"),
                    Divider(
                      color: gilosNeutral400,
                      height: 0.5.h,
                    ),
                    PaymentHistoryRow("22-fev.  2024, 23:09", "32,000 so'm"),
                    Divider(
                      color: gilosNeutral400,
                      height: 0.5.h,
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: CustomButton(
                        color: gilosNeutral600,
                        width: double.infinity,
                        name: "Batafil tarixini ko‘rish",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget SubscriptionCard(
    String title,
    String description,
    String price,
    String discountPrice,
    bool isChecked,
    VoidCallback onTap,
    Function(bool?) onChanged,
    FocusNode focusNode) {
  return Container(
    padding: EdgeInsets.all(48.sp),
    width: 505.w,
    decoration: BoxDecoration(
      color: GilosNeutral800,
      borderRadius: BorderRadius.circular(50.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyle.style600
              .copyWith(fontSize: 36.sp, color: Colors.white),
        ),
        32.verticalSpace,
        Text(
          description,
          style: CustomTextStyle.style400
              .copyWith(fontSize: 24.sp, color: Colors.white),
        ),
        32.verticalSpace,
        RichText(
            text: TextSpan(
          text: "Obuna narxi oyiga:",
          style: CustomTextStyle.style400
              .copyWith(fontSize: 24.sp, color: Colors.white),
          children: <TextSpan>[
            TextSpan(
              text: price,
              style: CustomTextStyle.style400.copyWith(
                fontSize: 24.sp,
                color: errrorcolorV2,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        )),
        6.verticalSpace,
        Text(
          discountPrice,
          style: CustomTextStyle.style600
              .copyWith(fontSize: 36.sp, color: Colors.white),
        ),
        32.verticalSpace,
        Container(
          padding: EdgeInsets.all(5.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              border: Border.all(width: 4.w, color: red)),
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: onChanged,
              ),
              Text(
                "Shartnoma shartlariga\nroziman",
                style: CustomTextStyle.style400
                    .copyWith(fontSize: 28.sp, color: lightGrey),
              ),
            ],
          ),
        ),
        32.verticalSpace,
        CustomButton(
            color: red,
            width: double.infinity,
            name: "Obunani sotib olish",
            onPressed: onTap,
            focusNode: focusNode)
      ],
    ),
  );
}

// Widget for Payment History similar to the image

Widget PaymentHistoryRow(String date, String amount) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          date,
          style: CustomTextStyle.style400
              .copyWith(fontSize: 24.sp, color: Colors.white),
        ),
        200.horizontalSpace,
        Text(
          amount,
          style: CustomTextStyle.style400
              .copyWith(fontSize: 24.sp, color: Colors.white),
        ),
      ],
    ),
  );
}
