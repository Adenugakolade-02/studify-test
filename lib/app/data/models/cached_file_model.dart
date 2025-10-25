import 'package:flutter/foundation.dart';

class CachedFileModel {
  final String name;
  final Uint8List file;
  final DateTime date;

  CachedFileModel({required this.name, required this.file, required this.date});

  factory CachedFileModel.fromJson(Map<dynamic, dynamic> json){
    return CachedFileModel(
      name: json['name'] as String, 
      file: json['file'] as Uint8List, 
      date: DateTime.parse(json['date'] as String)
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "name": name,
      'file': file,
      'date': date.toIso8601String()
    };
  }
}