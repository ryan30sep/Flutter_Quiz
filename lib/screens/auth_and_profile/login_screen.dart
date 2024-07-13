import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/onboding/components/animated_btn.dart';
import 'package:flutter_quiz_app/screens/onboding/components/custom_sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz_app/configs/configs.dart';
import 'package:flutter_quiz_app/controllers/auth_controller.dart';
import 'package:flutter_quiz_app/widgets/widgets.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
      static const String routeName='/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
        )),
        const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
          child: const SizedBox(),
        )),
        AnimatedPositioned(
          duration: Duration(milliseconds: 240),
          top: isSignInDialogShown ? -50 : 0,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    const SizedBox(
                      width: 260,
                      child: Column(children: [
                        Text(
                          "Selamat Datang Di Edquiz",
                          style: TextStyle(
                              fontSize: 56, fontFamily: "Poppins", height: 1.2),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                            "Masuk untuk menguji pengetahuan Anda dan bersenang-senang! Belum punya akun? Daftar di sini")
                      ]),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                        Future.delayed(Duration(milliseconds: 800), () {
                          setState(() {
                            isSignInDialogShown = true;
                          });
                          customSigninDialog(context, onClosed: (_) {
                            setState(() {
                              isSignInDialogShown = false;
                            });
                          });
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                      "",
                        style: TextStyle(),
                      ),
                    )
                  ]),
            ),
          ),
        )
      ],
    ));
  }
}
