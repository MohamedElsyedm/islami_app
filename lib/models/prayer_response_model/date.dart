import 'gregorian.dart';
import 'hijri.dart';

class Date {
  String? readable;
  String? timestamp;
  Hijri? hijri;
  Gregorian? gregorian;

  Date({this.readable, this.timestamp, this.hijri, this.gregorian});

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    readable: json['readable'] as String?,
    timestamp: json['timestamp'] as String?,
    hijri: json['hijri'] == null
        ? null
        : Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
    gregorian: json['gregorian'] == null
        ? null
        : Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'readable': readable,
    'timestamp': timestamp,
    'hijri': hijri?.toJson(),
    'gregorian': gregorian?.toJson(),
  };
}
