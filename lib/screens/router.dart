import 'package:flutter/material.dart';
import 'package:music/screens/home/home_page.dart';
import 'package:music/screens/music/music_page.dart';
import 'package:music/screens/splash/splash_page.dart';

abstract class RouteName {
  static const home = 'home';
  static const splash = 'splash';
  static const music = 'music';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RouteName.music:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => MusicPage(
            musicsModel: args['music'],
          ),
        );
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => HomePage());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
