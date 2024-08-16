import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/widgets/Custom_background.dart';

class AccesViaQrCode extends StatefulWidget {
  static final String id = "access_via_qr_code";
  const AccesViaQrCode({super.key});

  @override
  State<AccesViaQrCode> createState() => _AccesViaQrCodeState();
}

class _AccesViaQrCodeState extends State<AccesViaQrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomBackground(
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top:35.sp ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("QR-kod orqali kirish" ,style: CustomTextStyle.style600.copyWith(fontSize: 64.sp),),
                        48.h.verticalSpace,
                        Text("1. Mobil qurilmangizdan\nplatformani oching" ,style: CustomTextStyle.style500.copyWith(fontSize: 32.sp,color: Colors.white),),
                        20.h.verticalSpace,
                        Text('2. "Sozlamalar" → "Qurilmalar"\n→ “Smart TV qurilmasini\nulash” tugmasini bosing' ,style: CustomTextStyle.style500.copyWith(fontSize: 32.sp,color: Colors.white),),
                        20.h.verticalSpace,
                        Text("3. QR-kodni skanerlang" ,style: CustomTextStyle.style500.copyWith(fontSize: 32.sp,color: Colors.white),),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top:245.sp ),
                    width: 420.w,
                    height: 420.h,

                    child: Image(image: AssetImage("assets/images/qr_code.png")),
                  ),

                  Container(
                    width: 390.sp,
                    child:  Image(image: AssetImage('assets/images/Logo.png')),
                  )
                ],
            )
        ),
    );
  }
}
