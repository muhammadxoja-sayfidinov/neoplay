import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/style.dart';

class Parts extends StatefulWidget {
  Parts({super.key});

  @override
  State<Parts> createState() => _PartsState();
}

class _PartsState extends State<Parts> {
  int currentIndex = 0;

  VideoPlayerController? _controller; // Bu yerda _controller nullable bo'ladi
  bool _isPlaying = false;
  double _lastPosition = 0.0; // Saqlangan oxirgi ko'rilgan joy

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _lastPosition = prefs.getDouble('lastPosition') ?? 0.0;

    _controller = VideoPlayerController.network(
      'https://avtshare01.rz.tu-ilmenau.de/avt-vqdb-uhd-1/test_1/segments/bigbuck_bunny_8bit_15000kbps_1080p_60.0fps_h264.mp4', // Videoning URL manzili bilan almashtiring
    )..initialize().then((_) {
        setState(() {
          // Agar avvalgi pozitsiya mavjud bo'lsa, video shu joydan boshlanadi
          if (_lastPosition > 0.0) {
            _controller?.seekTo(Duration(seconds: _lastPosition.toInt()));
          }
        });
      });

    _controller?.addListener(() async {
      if (_controller!.value.isPlaying) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // Hozirgi pozitsiyani har doim yangilab boradi
        prefs.setDouble(
            'lastPosition', _controller!.value.position.inSeconds.toDouble());
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  List<String> _partList = [
    'assets/film_images/film_part2.png',
    'assets/film_images/film_part3.png',
    'assets/film_images/film_part4.png',
    'assets/film_images/film_part5.png',
    'assets/film_images/film_part2.png',
    'assets/film_images/film_part3.png',
    'assets/film_images/film_part4.png',
    'assets/film_images/film_part5.png',
    'assets/film_images/film_part2.png',
    'assets/film_images/film_part3.png',
    'assets/film_images/film_part4.png',
    'assets/film_images/film_part5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(48.sp),
      width: 1700.sp,
      // height: 772.w,
      decoration: BoxDecoration(
        color: GilosNeutral900,
        borderRadius: BorderRadius.circular(60.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mavsum va qismlar',
            style: CustomTextStyle.style600.copyWith(fontSize: 36.sp),
          ),
          24.verticalSpace,
          SizedBox(
            height: 60.sp,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 24.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.sp),
                    width: 191.w,
                    height: 60.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: currentIndex == index ? red : GilosNeutral800),
                    child: Text(
                      '${index + 1} Mavsum',
                      style: CustomTextStyle.style400.copyWith(
                          color: currentIndex == index
                              ? Colors.white
                              : Colors.grey),
                    ),
                  );
                }),
          ),
          30.verticalSpace,
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.7,
            ),
            itemCount: _partList.length,
            itemBuilder: (context, index) {
              return Container(
                  alignment: Alignment(0, 1),
                  width: 334.w,
                  height: 189.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                      image: AssetImage(_partList[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: _controller != null && _controller!.value.isInitialized
                      ? VideoProgressIndicator(
                          _controller!,
                          allowScrubbing: true,
                          colors: const VideoProgressColors(
                            playedColor: Colors.red,
                            bufferedColor: Colors.white54,
                            backgroundColor: Colors.grey,
                          ),
                        )
                      : null);
            },
          )
        ],
      ),
    );
  }
}

// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// // if (_controller != null && _controller!.value.isInitialized)
// //   AspectRatio(
// //     aspectRatio: _controller!.value.aspectRatio,
// //     child: VideoPlayer(_controller!),
// //   )
// // else
// //   const Center(
// //     child:
// //         CircularProgressIndicator(), // Yuklanish indikatorini ko'rsatish
// //   ),
// // if (_controller != null && _controller!.value.isInitialized)
// VideoProgressIndicator(
// _controller!,
// allowScrubbing: true,
// colors: const VideoProgressColors(
// playedColor: Colors.red,
// bufferedColor: Colors.white54,
// backgroundColor: Colors.grey,
// ),
// ),
// // if (_controller != null && _controller!.value.isInitialized)
// // Row(
// //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //   children: [
// //     Text(
// //       formatDuration(_controller!.value.position),
// //       style: const TextStyle(color: Colors.white),
// //     ),
// //     Text(
// //       formatDuration(_controller!.value.duration),
// //       style: const TextStyle(color: Colors.white),
// //     ),
// //   ],
// // ),
// // IconButton(
// //   icon: Icon(
// //     _controller != null && _controller!.value.isPlaying
// //         ? Icons.pause
// //         : Icons.play_arrow,
// //     color: Colors.white,
// //   ),
// //   onPressed: () {
// //     setState(() {
// //       if (_controller != null) {
// //         _controller!.value.isPlaying
// //             ? _controller!.pause()
// //             : _controller!.play();
// //       }
// //     });
// //   },
// // ),
// ],
// ),
