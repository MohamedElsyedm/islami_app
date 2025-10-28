import 'moshaf.dart';

class Reciter {
  int? id;
  String? name;
  String? letter;
  DateTime? date;
  List<Moshaf>? moshaf;

  Reciter({this.id, this.name, this.letter, this.date, this.moshaf});

  factory Reciter.fromJson(Map<String, dynamic> json) => Reciter(
    id: json['id'] as int?,
    name: json['name'] as String?,
    letter: json['letter'] as String?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    moshaf: (json['moshaf'] as List<dynamic>?)
        ?.map((e) => Moshaf.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'letter': letter,
    'date': date?.toIso8601String(),
    'moshaf': moshaf?.map((e) => e.toJson()).toList(),
  };
}
