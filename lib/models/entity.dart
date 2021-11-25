import 'dart:convert';

Entities entitiesFromJson(String str) => Entities.fromJson(json.decode(str));

String entitiesToJson(Entities data) => json.encode(data.toJson());

class Entities {
  Entities({
    this.id,
    this.user,
    this.name,
    this.desc,
    this.pickupAddress,
    this.phone,
    this.date,
  });

  int id;
  int user;
  String name;
  String desc;
  String pickupAddress;
  String phone;
  DateTime date;

  factory Entities.fromJson(Map<String, dynamic> json) => Entities(
        id: json["id"],
        user: json["user"],
        name: json["name"],
        desc: json["desc"],
        pickupAddress: json["pickup_address"],
        phone: json["phone"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "name": name,
        "desc": desc,
        "pickup_address": pickupAddress,
        "phone": phone,
        "date": date.toIso8601String(),
      };
}
