// To parse this JSON data, do
//
//     final EventsModel = EventsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EventsModel eventsModelFromJson(String str) =>
    EventsModel.fromJson(json.decode(str));

String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
  EventsModel({
    required this.data,
  });

  List<EventModel> data;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        data: List<EventModel>.from(
            json["data"].map((x) => EventModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EventModel {
  EventModel({
    required this.id,
    required this.nameClient,
    required this.date,
    required this.time,
    required this.tempat,
    required this.totalPembayaran,
    required this.note,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String nameClient;
  DateTime date;
  String time;
  String tempat;
  int totalPembayaran;
  String note;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        nameClient: json["name_client"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        tempat: json["tempat"],
        totalPembayaran: json["total_pembayaran"],
        note: json["note"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_client": nameClient,
        "date": date.toIso8601String(),
        "time": time,
        "tempat": tempat,
        "total_pembayaran": totalPembayaran,
        "note": note,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
