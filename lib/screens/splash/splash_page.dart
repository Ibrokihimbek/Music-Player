import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music/screens/router.dart';
import 'package:music/utils/color/app_colors.dart';
import 'package:music/utils/fonts/font_style.dart';
import 'package:music/utils/icons/app_icons.dart';
import 'package:music/widgets/circular_container.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    goNext();
  }

  void goNext() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacementNamed(context, RouteName.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularContainer(
              isPlay: false,
              sizeHeight: 60.h,
              sizeWidth: 60.w,
              icon: AppIcons.splash_icon,
              iconSizeWidth: 32.w,
              iconSizeHeight: 32.h,
            ),
            Text(
              'My music',
              style: fontUrbanistW700(appcolor: AppColors.black).copyWith(
                fontSize: 48.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
