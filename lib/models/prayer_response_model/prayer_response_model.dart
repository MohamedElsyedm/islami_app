import 'data.dart';

class PrayerResponseModel {
  int code;
  String status;
  Data data;

  PrayerResponseModel({
    required this.code,
    required this.status,
    required this.data,
  });

  factory PrayerResponseModel.fromJson(Map<String, dynamic> json) {
    return PrayerResponseModel(
      code: json['code'] as int,
      status: json['status'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
