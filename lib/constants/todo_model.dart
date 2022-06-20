// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
    TodoModel({
        this.planning,
        this.date,
        this.note,
        this.category,
        this.done
    });

    String? planning;
    String? date;
    String? note;
    String? category;
    bool? done;

    factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        planning: json["planning"],
        date: json["date"],
        note: json["note"],
        category: json["category"],
        done: json["done"],
    );

    Map<String, dynamic> toJson() => {
        "planning": planning,
        "date": date,
        "note": note,
        "category": category,
        "done": done,
    };
}
