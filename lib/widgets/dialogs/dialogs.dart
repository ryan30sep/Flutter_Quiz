import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  Dialogs._internal();

  static Widget quizStartDialog({required VoidCallback onTap}) {
    return AlertDialog(
     // title: const Text("Hi.."),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
        
          Text("Hi..", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Text("SIlahkan Login Sebelum Memulai Quiz..."),
        ],
      ),
      actions: <Widget>[
        TextButton(onPressed: onTap, child: const Text('Confirm'))
      ],
    );
  }

  static Future<bool> quizEndDialog() async{
     return (await showDialog(
      context: Get.overlayContext!,
      builder: (context) =>  AlertDialog(
        title:  const Text('Apakah Anda Sudah Yakin ?'),
        content:  const Text('Apakah Anda Ingin Keluar Sebelum Menyelesaikan Quiz ?'),
        actions: <Widget>[
          TextButton(
            onPressed: () =>  Get.back(result: false),
            child:  const Text('Tidak'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child:  const Text('Ya'),
          ),
        ],
      ),
    )) ?? false;

  }
}
