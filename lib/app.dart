import 'package:flutter/material.dart';
import 'package:mimichat/app/app_theme.dart';
import 'package:mimichat/app/locator.dart';
import 'package:mimichat/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class Mimichat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<_MimichatViewModel>.reactive(
      builder: (context, model, child){
        return MaterialApp(
          title: 'Mimichat',
          theme: lightTheme,
          initialRoute: Routes.splash,
          navigatorKey: model.navigatorKey,
          onGenerateRoute: MainRouter().onGenerateRoute,
        );
      },
      viewModelBuilder: () => _MimichatViewModel(),
    );
  }
}

class _MimichatViewModel extends BaseViewModel {
  NavigationService _navigator = locator<NavigationService>();

  get navigatorKey => _navigator.navigatorKey;
}
