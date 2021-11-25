// To parse this JSON data, do
//
//     final listings = listingsFromJson(jsonString);

import 'dart:convert';

List<Listings> listingsFromJson(String str) =>
    List<Listings>.from(json.decode(str).map((x) => Listings.fromJson(x)));

String listingsToJson(List<Listings> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Listings {
  Listings({
    this.id,
    this.entity,
    this.desc,
    this.name,
    this.pickupAddress,
    this.url,
    this.quantity,
    this.isActive,
    this.date,
  });

  int id;
  Entity entity;
  String desc;
  String name;
  String pickupAddress;
  String url;
  String quantity;
  bool isActive;
  DateTime date;

  factory Listings.fromJson(Map<String, dynamic> json) => Listings(
        id: json["id"],
        entity: Entity.fromJson(json["entity"]),
        desc: json["desc"],
        name: json["name"],
        pickupAddress: json["pickup_address"],
        url: json["url"],
        quantity: json["quantity"],
        isActive: json["is_active"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entity": entity.toJson(),
        "desc": desc,
        "name": name,
        "pickup_address": pickupAddress,
        "url": url,
        "quantity": quantity,
        "is_active": isActive,
        "date": date.toIso8601String(),
      };
}

class Entity {
  Entity({
    this.user,
    this.name,
    this.desc,
    this.pickupAddress,
    this.phone,
    this.date,
  });

  String user;
  String name;
  String desc;
  String pickupAddress;
  String phone;
  DateTime date;

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        user: json["user"],
        name: json["name"],
        desc: json["desc"],
        pickupAddress: json["pickup_address"],
        phone: json["phone"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "desc": desc,
        "pickup_address": pickupAddress,
        "phone": phone,
        "date": date.toIso8601String(),
      };
}
