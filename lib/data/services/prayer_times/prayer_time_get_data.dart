import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:assalam/data/models/prayer_time_models/prayer_time_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';


class PrayerTimeGetData {

  static double ? pLat;
  static double ? pLong;

  Data ? list;

  Future getPrayerTime() async {

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    pLat = position.latitude;
    pLong = position.longitude;

    String date = DateTime.now().toIso8601String();
    int method = 4;

    final url = "http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method";

    http.Response res = await http.get(Uri.parse(url), headers: {
      "Accept":
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });

    final data = json.decode(res.body);


    list = new Data.fromJson(data);

    return list;
  }
}