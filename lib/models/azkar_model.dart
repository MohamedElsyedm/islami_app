import 'dart:convert';

import 'package:flutter/services.dart';

class AzkarModel {
  String? category;
  int? count;
  String? description;
  String? reference;
  String? content;

  AzkarModel({
    this.category,
    this.content,
    this.count,
    this.description,
    this.reference,
  });

  AzkarModel.fromJson(dynamic json) {
    category = json['category'];
    count = int.parse(
      json['count'] == "stop" || json['count'] == null ? "0" : json['count'],
    );
    content = json['content'];
    description = json['description'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['category'] = category;
    map['count'] = count;
    map['description'] = description;
    map['reference'] = reference;
    map['content'] = content;
    return map;
  }

  static Future<List<AzkarModel>> loadAzkarContent(String azkarType) async {
    var jsonContent = jsonDecode(
      await rootBundle.loadString("assets/files/azkar/azkar.json"),
    );
    List<AzkarModel> azkar = (jsonContent[azkarType] as List)
        .map((azkarModel) => AzkarModel.fromJson(azkarModel))
        .toList();
    return azkar;
  }
}

class AzkarCategoryModel {
  String azkarName;
  String azkarImage;

  AzkarCategoryModel({required this.azkarName, required this.azkarImage});
}
