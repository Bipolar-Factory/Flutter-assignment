import 'package:bipolartest/model/MessageModel.dart';
import 'package:bipolartest/views/HomePage.dart';
import 'package:bipolartest/views/Messages/MessagesHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class StartUpView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController();
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/splash.json',
            controller: animationController, onLoaded: (composition) {
          animationController.addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MessagesTab()));
            }
          });

          animationController
            ..duration = composition.duration
            ..forward();
        }),
      ),
    );
  }
}
