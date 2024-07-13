import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/controllers/auth_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';


 class SignInForm extends GetView<AuthController> {
  const SignInForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        controller.siginInWithGoogle();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF77D8E),
                          minimumSize: const Size(double.infinity, 56),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)))),
                      icon: const Icon(
                        CupertinoIcons.arrow_right,
                        color: Color(0xFFFE0037),
                      ),
                      label: const Text("Sign In With Google")),
                )
              ],
            )),
      
  ]);
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});
  final Widget child;
  final size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
