// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  final String? uid;
  final String? title;
  final String? description;
  final String? date;

  TaskModel({
    this.uid,
    this.title,
    this.description,
    this.date,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        uid: json["uid"],
        title: json["title"],
        description: json["description"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "title": title,
        "description": description,
        "date": date,
      };
}
