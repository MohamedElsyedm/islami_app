import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:islami_app/models/prayer_response_model/prayer_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/models/radios_response_model/radios_list.dart';
import 'package:islami_app/models/radios_response_model/radios_response_model.dart';
import 'package:islami_app/models/reciters_response_model/reciters_model.dart';

class ApiManager {
  static String city = 'cairo';
  static String country = 'egypt';

  static Future<PrayerResponseModel> getPrayerData() async {
    try {
      String date = DateFormat("dd-MM-yyy").format(DateTime.now());
      Uri uri = Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity/$date?city=$city&country=$country',
      );
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return PrayerResponseModel.fromJson(jsonResponse);
    } catch (e) {
      rethrow;
    }
  }

  static Future<RecitersModel> getRecitersData() async {
    try {
      Uri uri = Uri.parse(
        'https://www.mp3quran.net/api/v3/reciters?language=ar',
      );
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RecitersModel.fromJson(jsonResponse);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<RadiosList>> getRadiosData() async {
    try {
      Uri uri = Uri.parse('https://www.mp3quran.net/api/v3/radios?language=ar');
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);

      return RadiosResponseModel.fromJson(jsonResponse).radios!;
    } catch (e) {
      rethrow;
    }
  }

  static String getMoshafSuraUrl(String serverLink, String suraNumber) {
    final suraLink = suraNumber.padLeft(3, '0');
    return '$serverLink$suraLink.mp3';
  }
}
