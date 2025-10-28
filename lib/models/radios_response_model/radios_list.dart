class RadiosList {
  int? id;
  String? name;
  String? url;
  String? recentDate;

  RadiosList({this.id, this.name, this.url, this.recentDate});

  factory RadiosList.fromJson(Map<String, dynamic> json) => RadiosList(
    id: json['id'] as int?,
    name: json['name'] as String?,
    url: json['url'] as String?,
    recentDate: json['recent_date'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'url': url,
    'recent_date': recentDate,
  };
}
