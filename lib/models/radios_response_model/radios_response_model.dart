import 'radios_list.dart';

class RadiosResponseModel {
  List<RadiosList>? radios;

  RadiosResponseModel({this.radios});

  factory RadiosResponseModel.fromJson(Map<String, dynamic> json) {
    return RadiosResponseModel(
      radios: (json['radios'] as List<dynamic>?)
          ?.map((e) => RadiosList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'radios': radios?.map((e) => e.toJson()).toList(),
  };
}
