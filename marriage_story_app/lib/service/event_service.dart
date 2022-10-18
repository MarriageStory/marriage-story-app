import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:marriage_story_app/const/strings.dart';
import 'package:marriage_story_app/model/event_model.dart';
import 'package:http/http.dart' as http;

class EventService {
  static Future<EventsModel> getAllEvent() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http.get(Uri.parse(baseURLAPI + "events1"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return EventsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }

  static Future<bool> createNewEvent(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var event = <String, dynamic>{
      "name_client": data["name_client"],
      "date": data["date"],
      "time": data["time"],
      "tempat": data["tempat"],
      "total_pembayaran": data["total_pembayaran"],
      "status_pembayaran": data["status_pembayaran"],
      "jumlah_terbayar": data["jumlah_terbayar"],
      "note": data["note"],
      "paket1": data["paket1"],
      "paket2": data["paket2"],
      "paket3": data["paket3"],
      "paket4": data["paket4"],
      "paket5": data["paket5"],
    };

    var response = await http.post(Uri.parse(baseURLAPI + "events1"),
        body: jsonEncode(event),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }

  static Future<bool> updateEvent(int id, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var event = <String, dynamic>{
      "name_client": data["name_client"],
      "date": data["date"],
      "time": data["time"],
      "tempat": data["tempat"],
      "total_pembayaran": data["total_pembayaran"],
      "status_pembayaran": data["status_pembayaran"],
      "jumlah_terbayar": data["jumlah_terbayar"],
      "note": data["note"],
      "paket1": data["paket1"],
      "paket2": data["paket2"],
      "paket3": data["paket3"],
      "paket4": data["paket4"],
      "paket5": data["paket5"],
    };

    var response = await http.put(
        Uri.parse(baseURLAPI + "events1/" + id.toString()),
        body: jsonEncode(event),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }

  static Future<bool> deleteEvent(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http
        .delete(Uri.parse(baseURLAPI + "events1/" + id.toString()), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }
}
