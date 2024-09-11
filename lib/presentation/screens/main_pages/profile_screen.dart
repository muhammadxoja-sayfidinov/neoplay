import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/style.dart';
import '../../../data/models/models.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  int _focusedIndex = 0;

  final ScrollController _scrollController = ScrollController();
  final List<FocusNode> _focusNodes =
      List<FocusNode>.generate(6, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus) {
          _scrollToIndex(i);
        }
      });
    }
  }

  void _scrollToIndex(int index) {
    final position = index * 320.0; // Har bir elementning balandligi
    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    int currentPage = 0;
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.arrowRight): const NextFocusIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowLeft):
            const PreviousFocusIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          NextFocusIntent: CallbackAction<NextFocusIntent>(
            onInvoke: (intent) => _moveFocus(1),
          ),
          PreviousFocusIntent: CallbackAction<PreviousFocusIntent>(
            onInvoke: (intent) => _moveFocus(-1),
          ),
        },
        child: SingleChildScrollView(
          child: FocusScope(
            node: _focusScopeNode,
            child: Column(
              children: [
                SizedBox(
                  height: 827.sp,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 48.h, horizontal: 70.w),
                      width: 1700.w,
                      height: 827.sp,
                      decoration: BoxDecoration(
                        border: Border.all(color: red),
                        borderRadius: BorderRadius.circular(60.r),
                        image: const DecorationImage(
                          image:
                              ExactAssetImage('assets/film_images/treler.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              _ratingWidget('assets/images/logo_imdb.svg', 7.2,
                                  yellow, 37.w, 22.h, 105.w, 40.h),
                              5.horizontalSpace,
                              _ratingWidget('assets/images/kino poisk icon.svg',
                                  9.2, errorColor, 40.w, 24.h, 94.w, 40.h),
                              5.horizontalSpace,
                              _ratingWidget('assets/images/logo_neoplay.svg',
                                  8.8, red, 72.w, 22.h, 128.w, 40.h),
                            ],
                          ),
                          84.verticalSpace,
                          Text(
                            'Cчастье',
                            style: CustomTextStyle.style600,
                          ),
                          32.verticalSpace,
                          Text(
                            'Shimoliy Koreya chegara qo‘shinlari polkovnigi\nCha Gi Sung armiyaga kontrabanda qurollarini\nyetkazib berish bilan shug‘ullangan, biroq \nkunlarning birida vaziyatdan...',
                            style: CustomTextStyle.style500.copyWith(
                                color: Colors.white,
                                fontSize: 28.sp,
                                height: 3.sp),
                          ),
                          32.verticalSpace,
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.h, horizontal: 32.w),
                                decoration: BoxDecoration(
                                  color: red,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/play.svg',
                                      width: 24.w,
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      'Tomosha qilish',
                                      style: CustomTextStyle.style500.copyWith(
                                          color: Colors.white, fontSize: 20.sp),
                                    )
                                  ],
                                ),
                              ),
                              12.horizontalSpace,
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.h, horizontal: 32.w),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: Text(
                                  'Treyler',
                                  style: CustomTextStyle.style500.copyWith(
                                      color: Colors.white, fontSize: 20.sp),
                                ),
                              ),
                              12.horizontalSpace,
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.h, horizontal: 32.w),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      width: 24.w,
                                      'assets/images/save.svg',
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      'Yoqdi',
                                      style: CustomTextStyle.style500.copyWith(
                                          color: Colors.white, fontSize: 20.sp),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                70.verticalSpace,
                Container(
                  width: 1692.w,
                  height: 60.sp,
                  decoration: BoxDecoration(
                      color: GilosNeutral800,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            width: 432.w,
                            height: 60.sp,
                            decoration: BoxDecoration(
                                color: index == 0 ? red : Colors.transparent,
                                borderRadius: BorderRadius.circular(50.r)),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.sp, horizontal: 140.w),
                            child: const Center(child: Text('Film haqida')));
                      }),
                ),
                70.verticalSpace,
                Container(
                  padding: EdgeInsets.all(48.sp),
                  width: 1700.sp,
                  height: 772.w,
                  decoration: BoxDecoration(
                    color: GilosNeutral800,
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Film haqida',
                        style: CustomTextStyle.style600.copyWith(
                          fontSize: 38.sp,
                        ),
                      ),
                      32.verticalSpace,
                      SizedBox(
                        width: 1640.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/film_images/film4.png',
                              width: 386.w,
                            ),
                            32.horizontalSpace,
                            SizedBox(
                              width: 1100.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Koperatsiya: Maxfiy hamkorlik filmi',
                                    style: CustomTextStyle.style500
                                        .copyWith(color: Colors.white),
                                  ),
                                  24.verticalSpace,
                                  Text(
                                    '''Shimoliy Koreya chegara qo‘shinlari polkovnigi Cha Gi Sung armiyaga kontrabanda qurollarini yetkazib berish bilan shug‘ullangan, biroq kunlarning birida vaziyatdan unumli foydalanishga qaror qilgan va chegaradan ham narkotik moddalarni olib o‘ta boshlagan. U bu bilan qo'lga olindi, lavozimi tushirildi, barcha regaliyalardan mahrum bo'ldi...''',
                                    style: CustomTextStyle.style400,
                                  ),
                                  48.verticalSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Davlati:',
                                            style: CustomTextStyle.style400
                                                .copyWith(),
                                          ),
                                          16.verticalSpace,
                                          Text(
                                            'Janubiy Koreya',
                                            style: CustomTextStyle.style400
                                                .copyWith(
                                              backgroundColor: Colors.grey[800],
                                            ),
                                          ),
                                          8.verticalSpace,
                                          Text(
                                            'Janubiy Koreya',
                                            style: CustomTextStyle.style400
                                                .copyWith(
                                              backgroundColor: Colors.grey[800],
                                            ),
                                          ),
                                        ],
                                      ),
                                      48.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ishlab chiqilgan yili:',
                                            style: CustomTextStyle.style400
                                                .copyWith(),
                                          ),
                                          16.verticalSpace,
                                          Row(
                                            children: [
                                              Text(
                                                '2018',
                                                style: CustomTextStyle.style400
                                                    .copyWith(
                                                  backgroundColor:
                                                      Colors.grey[800],
                                                ),
                                              ),
                                              8.horizontalSpace,
                                              Text(
                                                '2019',
                                                style: CustomTextStyle.style400
                                                    .copyWith(
                                                  backgroundColor:
                                                      Colors.grey[800],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      48.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Davomiyligi:',
                                            style: CustomTextStyle.style400
                                                .copyWith(),
                                          ),
                                          16.verticalSpace,
                                          Row(
                                            children: [
                                              Text(
                                                '180 daqiqa',
                                                style: CustomTextStyle.style400
                                                    .copyWith(
                                                  backgroundColor:
                                                      Colors.grey[800],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      48.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Film janri:',
                                            style: CustomTextStyle.style400
                                                .copyWith(),
                                          ),
                                          16.verticalSpace,
                                          Row(
                                            children: [
                                              Text(
                                                'Detektiv',
                                                style: CustomTextStyle.style400
                                                    .copyWith(
                                                  backgroundColor:
                                                      Colors.grey[800],
                                                ),
                                              ),
                                              8.horizontalSpace,
                                              Text(
                                                'Jangari',
                                                style: CustomTextStyle.style400
                                                    .copyWith(
                                                  backgroundColor:
                                                      Colors.grey[800],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      48.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Yosh chegarasi:',
                                            style: CustomTextStyle.style400
                                                .copyWith(),
                                          ),
                                          16.verticalSpace,
                                          Row(
                                            children: [
                                              Text(
                                                '18+',
                                                style: CustomTextStyle.style400
                                                    .copyWith(
                                                  backgroundColor:
                                                      Colors.grey[800],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  48.verticalSpace,
                                  Text(
                                    'Platformalarda quyidagicha baholangan:',
                                    style: CustomTextStyle.style400,
                                  ),
                                  16.verticalSpace,
                                  Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          _ratingWidget(
                                              'assets/images/logo_imdb.svg',
                                              7.2,
                                              yellow,
                                              37.w,
                                              22.h,
                                              105.w,
                                              40.h),
                                          5.horizontalSpace,
                                          _ratingWidget(
                                              'assets/images/kino poisk icon.svg',
                                              9.2,
                                              errorColor,
                                              40.w,
                                              24.h,
                                              94.w,
                                              40.h),
                                          5.horizontalSpace,
                                          _ratingWidget(
                                              'assets/images/logo_neoplay.svg',
                                              8.8,
                                              red,
                                              72.w,
                                              22.h,
                                              128.w,
                                              40.h),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ratingWidget(
    String logoPath,
    double rating,
    Color color,
    double imgWidth,
    double imgHeight,
    double boxWidth,
    double boxHeight,
  ) {
    return Container(
      width: boxWidth,
      height: boxHeight,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          SizedBox(
              width: imgWidth,
              height: imgHeight,
              child: SvgPicture.asset(
                logoPath,
              )),
          SizedBox(width: 10.w),
          Text(rating.toString(),
              style: CustomTextStyle.style400.copyWith(fontSize: 19.sp)),
        ],
      ),
    );
  }

  void _moveFocus(int direction) {
    int newIndex = _focusedIndex + direction;

    if (newIndex < 0) {
      FocusScope.of(context).previousFocus();
    } else if (newIndex < movies.length) {
      setState(() {
        _focusedIndex = newIndex;
        _focusNodes[newIndex].requestFocus();
      });
    }
  }
}
