import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music/data/models/music_model.dart';
import 'package:music/screens/music/widgets/icon_button.dart';
import 'package:music/utils/color/app_colors.dart';
import 'package:music/utils/date_firmater/date_formater.dart';
import 'package:music/utils/fonts/font_style.dart';
import 'package:music/utils/icons/app_icons.dart';
import 'package:music/widgets/circular_container.dart';

class MusicPage extends StatefulWidget {
  final MusicsModel musicsModel;
  const MusicPage({super.key, required this.musicsModel});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final AudioPlayer player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration currentDuration = Duration.zero;
  double currentSliderValue = 0;
  bool isPlaying = false;

  Future<bool> _onWillPop() async {
    if (!isPlaying) {
      isPlaying = false;
      await player.stop();
      return true;
    } else {
      isPlaying = false;
      await player.stop();
      return true;
    }
  }

  @override
  void initState() {
    _init();
  }

  _init() async {
    await player.setSource(AssetSource(widget.musicsModel.music));
    player.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });
    player.onPositionChanged.listen((Duration d) {
      setState(() {
        currentDuration = d;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            SizedBox(
              width: 380.w,
              height: 380.w,
              child: Image.asset(widget.musicsModel.musicImage),
            ),
            SizedBox(height: 20.h),
            Text(
              widget.musicsModel.musicName,
              style: fontUrbanistW700(appcolor: AppColors.black)
                  .copyWith(fontSize: 32.sp),
            ),
            SizedBox(height: 12.h),
            Text(
              widget.musicsModel.musicDescription,
              style: fontUrbanistW600(appcolor: AppColors.black),
            ),
            SizedBox(height: 40.h),
            Slider(
              thumbColor: AppColors.C_06C149,
              activeColor: AppColors.C_33EB75,
              inactiveColor: AppColors.C_E0E0E0,
              max: double.parse(duration.inSeconds.toString()),
              value: double.parse(currentDuration.inSeconds.toString()),
              onChanged: (double value) {
                setState(
                  () {
                    currentSliderValue = value;
                  },
                );
              },
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TimeUtils.printDuration(
                      currentDuration,
                    ),
                  ),
                  Text(
                    TimeUtils.printDuration(
                      duration,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(icon: AppIcons.back_icon, onTap: () {}),
                  CustomIconButton(
                      icon: AppIcons.backward_icon,
                      onTap: () async {
                        player.seek(
                            Duration(seconds: currentDuration.inSeconds - 10));
                        setState(() {});
                      }),
                  GestureDetector(
                    onTap: () async {
                      if (isPlaying) {
                        await player.pause();
                      } else {
                        await player
                            .play(AssetSource(widget.musicsModel.music));
                      }
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                    child: CircularContainer(
                      isPlay: isPlaying ? false : true,
                      iconSizeHeight: 26.h,
                      iconSizeWidth: 26.w,
                      sizeHeight: 66.h,
                      sizeWidth: 66.w,
                      icon: isPlaying
                          ? AppIcons.pause_song_icon
                          : AppIcons.play_music_icon,
                    ),
                  ),
                  CustomIconButton(
                      icon: AppIcons.forward_icon,
                      onTap: () async {
                        player.seek(
                            Duration(seconds: currentDuration.inSeconds + 10));
                        setState(() {});
                      }),
                  CustomIconButton(icon: AppIcons.next_icon, onTap: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
