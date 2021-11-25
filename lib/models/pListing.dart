// To parse this JSON data, do
//
//     final pListing = pListingFromJson(jsonString);

import 'dart:convert';

PListing pListingFromJson(String str) => PListing.fromJson(json.decode(str));

String pListingToJson(PListing data) => json.encode(data.toJson());

class PListing {
  PListing({
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
  int entity;
  String desc;
  String name;
  String pickupAddress;
  String url;
  String quantity;
  bool isActive;
  DateTime date;

  factory PListing.fromJson(Map<String, dynamic> json) => PListing(
        id: json["id"],
        entity: json["entity"],
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
        "entity": entity,
        "desc": desc,
        "name": name,
        "pickup_address": pickupAddress,
        "url": url,
        "quantity": quantity,
        "is_active": isActive,
        "date": date.toIso8601String(),
      };
}
