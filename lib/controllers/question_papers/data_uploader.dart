import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz_app/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/question_paper_model.dart';

class DataUploader extends GetxController {
  @override 
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future <void> uploadData() async {
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final papersInAssets = manifestMap.keys
        .where((path)=>
            path.startsWith("assets/DB/paper")&&path.contains(".json"))
        .toList();
      List<QuestionPaperModel> questionPapers = [];
      for (var paper in papersInAssets) {
        String stringPaperContent = await rootBundle.loadString(paper);
        questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
      }
      //print ('items number ${questionPapers[0].description}');
      var batch = fireStore.batch();
  }
}