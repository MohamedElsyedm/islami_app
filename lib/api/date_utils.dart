import 'package:intl/intl.dart';
import 'package:islami_app/models/prayer_response_model/gregorian.dart';
import 'package:islami_app/models/prayer_response_model/hijri.dart';

class TimeConverter {
  static String to12Hour(String time) {
    DateTime dateTime = DateFormat("HH:mm").parse(time);
    String time12Hour = DateFormat("hh:mm\n a").format(dateTime);
    return time12Hour;
  }
}

class DateFormatter {
  static String fromGregorianDate(Gregorian gregorianDate) {
    return "${gregorianDate.day} ${gregorianDate.month!.en!.substring(0, 3).toUpperCase()},\n${gregorianDate.year}";
  }

  static String fromHijriDate(Hijri higriDate) {
    return "${higriDate.day} ${higriDate.month!.en!.substring(0, 3).toUpperCase()},\n${higriDate.year}";
  }
}

class PrayerTime {
  static Map<String, dynamic> sortPrayerTimes(
    Map<String, dynamic> prayerTimes,
  ) {
    DateTime now = DateTime.now();

    /*
    [
      MapEntry("fajr" : "05:00"),
      MapEntry("fajr" : "05:00"),
      MapEntry("fajr" : "05:00"),
      MapEntry("fajr" : "05:00"),
    ]
     */
    var sortedEntries = prayerTimes.entries.toList()
      ..sort((a, b) {
        DateTime timeA = DateFormat("HH:mm").parse(a.value);
        DateTime timeB = DateFormat("HH:mm").parse(b.value);

        DateTime dateTimeA = DateTime(
          now.year,
          now.month,
          now.day,
          timeA.hour,
          timeA.minute,
        );
        DateTime dateTimeB = DateTime(
          now.year,
          now.month,
          now.day,
          timeB.hour,
          timeB.minute,
        );

        if (dateTimeA.isBefore(now) || dateTimeA.isAtSameMomentAs(now)) {
          dateTimeA = dateTimeA.add(const Duration(days: 1));
        }
        if (dateTimeB.isBefore(now) || dateTimeB.isAtSameMomentAs(now)) {
          dateTimeB = dateTimeB.add(const Duration(days: 1));
        }

        return dateTimeA.compareTo(dateTimeB);
      });

    return Map<String, dynamic>.fromEntries(sortedEntries);
    /*
    [
     "fajr" : "05:00",
     "fajr" : "05:00",
     "fajr" : "05:00",
     "fajr" : "05:00",
    ]
     */
  }

  static Map<String, Duration> getNextPrayerCountDown(
    Map<String, dynamic> prayerTimes,
  ) {
    DateTime now = DateTime.now();
    Map<String, Duration> timeDifference = {};

    prayerTimes.forEach((prayerName, timeString) {
      DateTime prayerTime = DateFormat("HH:mm").parse(timeString);
      DateTime prayerDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        prayerTime.hour,
        prayerTime.minute,
      );
      if (prayerDateTime.isBefore(now) ||
          prayerDateTime.isAtSameMomentAs(now)) {
        prayerDateTime = prayerDateTime.add(const Duration(days: 1));
      }
      Duration difference = prayerDateTime.difference(now);

      timeDifference[prayerName] = difference;
    });

    return timeDifference;
  }
}
