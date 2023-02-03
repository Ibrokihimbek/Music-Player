import 'package:music/utils/images/app_images.dart';
import 'package:music/utils/music/musics.dart';

class MusicsModel {
  String musicDescription;
  String musicName;
  String musicImage;
  String music;

  MusicsModel({
    required this.musicDescription,
    required this.musicName,
    required this.musicImage,
    required this.music,
  });

  static List<MusicsModel> musics = [
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 1',
        musicImage: AppImages.music_image,
        music: Musics.music_1),
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 2',
        musicImage: AppImages.music_image,
        music: Musics.music_2),
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 3',
        musicImage: AppImages.music_image,
        music: Musics.music_3),
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 4',
        musicImage: AppImages.music_image,
        music: Musics.music_4),
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 5',
        musicImage: AppImages.music_image,
        music: Musics.music_5),
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 6',
        musicImage: AppImages.music_image,
        music: Musics.music_6),
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 7',
        musicImage: AppImages.music_image,
        music: Musics.music_7),
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 8',
        musicImage: AppImages.music_image,
        music: Musics.music_8),
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 9',
        musicImage: AppImages.music_image,
        music: Musics.music_9),
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 10',
        musicImage: AppImages.music_image,
        music: Musics.music_10),
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 12',
        musicImage: AppImages.music_image,
        music: Musics.music_11),
    MusicsModel(
        musicDescription:'The Weeknd',
        musicName: 'Music 13',
        musicImage: AppImages.music_image,
        music: Musics.music_12),
  ];
}
