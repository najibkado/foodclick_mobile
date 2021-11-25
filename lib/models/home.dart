// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'dart:convert';

Home homeFromJson(String str) => Home.fromJson(json.decode(str));

String homeToJson(Home data) => json.encode(data.toJson());

class Home {
  Home({
    this.entity,
    this.listings,
    this.activeDonations,
    this.totalDonations,
    this.giveaway,
  });

  Entity entity;
  List<Listing> listings;
  int activeDonations;
  int totalDonations;
  List<Giveaway> giveaway;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        entity: Entity.fromJson(json["entity"]),
        listings: List<Listing>.from(
            json["listings"].map((x) => Listing.fromJson(x))),
        activeDonations: json["active_donations"],
        totalDonations: json["total_donations"],
        giveaway: List<Giveaway>.from(
            json["giveaway"].map((x) => Giveaway.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "entity": entity.toJson(),
        "listings": List<dynamic>.from(listings.map((x) => x.toJson())),
        "active_donations": activeDonations,
        "total_donations": totalDonations,
        "giveaway": List<dynamic>.from(giveaway.map((x) => x.toJson())),
      };
}

class Entity {
  Entity({
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

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
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

class Giveaway {
  Giveaway({
    this.nin,
    this.listing,
    this.date,
  });

  String nin;
  Listing listing;
  DateTime date;

  factory Giveaway.fromJson(Map<String, dynamic> json) => Giveaway(
        nin: json["nin"],
        listing: Listing.fromJson(json["listing"]),
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "nin": nin,
        "listing": listing.toJson(),
        "date": date.toIso8601String(),
      };
}

class Listing {
  Listing({
    this.entity,
    this.name,
    this.desc,
    this.address,
    this.url,
    this.quantity,
    this.isActive,
    this.date,
  });

  int entity;
  String name;
  String desc;
  String address;
  String url;
  String quantity;
  bool isActive;
  DateTime date;

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        entity: json["entity"],
        name: json["name"],
        desc: json["desc"],
        address: json["address"],
        url: json["url"],
        quantity: json["quantity"],
        isActive: json["is_active"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "entity": entity,
        "name": name,
        "desc": desc,
        "address": address,
        "url": url,
        "quantity": quantity,
        "is_active": isActive,
        "date": date.toIso8601String(),
      };
}
