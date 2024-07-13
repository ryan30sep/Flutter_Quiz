import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/configs/configs.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Image.asset('assets/images/app_splash_logo.png'),
      ),
    );
  }
}
