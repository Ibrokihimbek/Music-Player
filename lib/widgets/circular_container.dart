import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music/utils/color/app_colors.dart';

class CircularContainer extends StatelessWidget {
  final bool isPlay;
  final double sizeWidth;
  final double sizeHeight;
  final String icon;
  final double iconSizeWidth;
  final double iconSizeHeight;

  const CircularContainer({
    super.key,
    required this.isPlay,
    required this.iconSizeHeight,
    required this.iconSizeWidth,
    required this.sizeHeight,
    required this.sizeWidth,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient:
            LinearGradient(colors: [AppColors.C_06C149, AppColors.C_33EB75]),
      ),
      width: sizeWidth,
      height: sizeHeight,
      child: Center(
        child: SizedBox(
          width: iconSizeWidth,
          height: iconSizeHeight,
          child: Padding(
            padding: EdgeInsets.only(left: isPlay == true ? 4 : 0).r,
            child: SvgPicture.asset(icon),
          ),
        ),
      ),
    );
  }
}
