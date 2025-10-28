import 'reciter.dart';

class RecitersModel {
  List<Reciter>? reciters;

  RecitersModel({this.reciters});

  factory RecitersModel.fromJson(Map<String, dynamic> json) => RecitersModel(
    reciters: (json['reciters'] as List<dynamic>?)
        ?.map((e) => Reciter.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'reciters': reciters?.map((e) => e.toJson()).toList(),
  };
}
