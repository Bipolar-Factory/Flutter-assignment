// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/chat/chat_view.dart';
import '../ui/views/feed/feed_view.dart';
import '../ui/views/intro/intro_view.dart';
import '../ui/views/settings/settings_view.dart';
import '../ui/views/splash/splash_view.dart';

class Routes {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String feed = '/feed';
  static const String chat = '/chat';
  static const String settings = '/settings';
  static const all = <String>{
    splash,
    intro,
    feed,
    chat,
    settings,
  };
}

class MainRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splash, page: SplashView),
    RouteDef(Routes.intro, page: IntroView),
    RouteDef(Routes.feed, page: FeedView),
    RouteDef(Routes.chat, page: ChatView),
    RouteDef(Routes.settings, page: SettingsView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashView(),
        settings: data,
      );
    },
    IntroView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => IntroView(),
        settings: data,
      );
    },
    FeedView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FeedView(),
        settings: data,
      );
    },
    ChatView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChatView(),
        settings: data,
      );
    },
    SettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingsView(),
        settings: data,
      );
    },
  };
}
