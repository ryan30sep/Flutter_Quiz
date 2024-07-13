import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz_app/configs/themes/app_colors.dart';
import 'package:flutter_quiz_app/screens/home/home_screen.dart';
import 'package:flutter_quiz_app/widgets/common/circle_button.dart';
import 'package:intro_slider/intro_slider.dart';

 class AppIntroductionScreen extends StatefulWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);
  static const String routeName = '/introduction';

  @override
  State<AppIntroductionScreen> createState() => _AppIntroductionScreen();
}

class _AppIntroductionScreen extends State<AppIntroductionScreen> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        title: "Selamat Datang!",
        description: "Selamat datang di kuis pembelajaran interaktif! Siapkan dirimu untuk petualangan seru dalam belajar. Mari kita mulai dengan penuh semangat dan rasa ingin tahu!",
        pathImage: "images/saturn.png",
        backgroundColor: Color.fromARGB(255, 130, 21, 232),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Cara Bermain?",
        description: "Caranya sangat mudah! Kamu akan mendapatkan berbagai pertanyaan menarik. Pilih jawaban yang menurutmu paling tepat, dan jangan khawatir jika salah. Setiap kesalahan adalah kesempatan untuk belajar!",
        pathImage: "images/earth.png",
        backgroundColor: Color.fromARGB(255, 56, 84, 141),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Siap Mulai?",
        description:
            "Apakah kamu sudah siap? Ayo, tunjukkan pengetahuanmu dan nikmati setiap tantangan yang ada! Klik tombol 'Mulai' untuk memulai kuis. Selamat mencoba dan semoga sukses!",
        backgroundColor: Color.fromARGB(255, 122, 30, 168),
        pathImage: "images/mars.png",
      ),
    );
  }

  void onDonePress() {
    Get.offAndToNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      onDonePress: onDonePress,
    );
  }
}