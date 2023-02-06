import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music/data/models/music_model.dart';
import 'package:music/screens/router.dart';
import 'package:music/utils/color/app_colors.dart';
import 'package:music/utils/fonts/font_style.dart';
import 'package:music/utils/icons/app_icons.dart';
import 'package:music/widgets/circular_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        physics: const BouncingScrollPhysics(),
        children: List.generate(
          MusicsModel.musics.length,
          (index) => InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteName.music,
                arguments: {
                  'music': index,
                },
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 8).r,
              child: SizedBox(
                width: double.infinity,
                height: 80.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 80.w,
                      height: 80.h,
                      child: Center(
                        child: Image.asset(
                          MusicsModel.musics[index].musicImage,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          MusicsModel.musics[index].musicName,
                          style: fontUrbanistW700(appcolor: AppColors.black),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          MusicsModel.musics[index].musicDescription,
                          style: fontUrbanistW500(appcolor: AppColors.black)
                              .copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircularContainer(
                      isPlay: true,
                      iconSizeHeight: 14.h,
                      iconSizeWidth: 14.w,
                      sizeHeight: 32.h,
                      sizeWidth: 32.w,
                      icon: AppIcons.play_music_icon,
                    ),
                    SizedBox(width: 12.w),
                    const Icon(Icons.menu)
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
