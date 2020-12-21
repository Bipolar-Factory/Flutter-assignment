import 'package:auto_route/auto_route_annotations.dart';
import 'package:mimichat/ui/views/chat/chat_view.dart';
import 'package:mimichat/ui/views/feed/feed_view.dart';
import 'package:mimichat/ui/views/intro/intro_view.dart';
import 'package:mimichat/ui/views/settings/settings_view.dart';
import 'package:mimichat/ui/views/splash/splash_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: SplashView,
      name: 'splash',
      path: '/',
    ),
    MaterialRoute(
      page: IntroView,
      name: 'intro',
      path: '/intro',
    ),
    MaterialRoute(
      page: FeedView,
      name: 'feed',
      path: '/feed',
    ),
    MaterialRoute(
      page: ChatView,
      name: 'chat',
      path: '/chat',
    ),
    MaterialRoute(
      page: SettingsView,
      name: 'settings',
      path: '/settings',
    ),
  ],
)
class $MainRouter {}
