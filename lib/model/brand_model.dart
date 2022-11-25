// To parse this JSON data, do
//
//     final brand = brandFromJson(jsonString);

import 'dart:convert';

List<Brand> brandFromJson(String str) => List<Brand>.from(json.decode(str).map((x) => Brand.fromJson(x)));

String brandToJson(List<Brand> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Brand {
  Brand({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
