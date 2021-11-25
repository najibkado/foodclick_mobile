import 'dart:convert';

Freefood freefoodFromJson(String str) => Freefood.fromJson(json.decode(str));

String freefoodToJson(Freefood data) => json.encode(data.toJson());

class Freefood {
  Freefood({
    this.id,
    this.nin,
    this.listing,
    this.date,
  });

  int id;
  String nin;
  int listing;
  DateTime date;

  factory Freefood.fromJson(Map<String, dynamic> json) => Freefood(
        id: json["id"],
        nin: json["nin"],
        listing: json["listing"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nin": nin,
        "listing": listing,
        "date": date.toIso8601String(),
      };
}
