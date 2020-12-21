import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:mimichat/app/constants.dart';
import 'package:mimichat/ui/views/splash/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.nonReactive(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child){
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: FlareActor(
                    loadingFlare,
                    animation: 'loading',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 24),
                  child: Text("Loading . . .",
                  style: Theme.of(context).textTheme.subtitle2),
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
