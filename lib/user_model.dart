// To parse this JSON data, do
//
//     final userclass = userclassFromJson(jsonString);

import 'dart:convert';

List<Userclass> userclassFromJson(String str) => List<Userclass>.from(json.decode(str).map((x) => Userclass.fromJson(x)));

String userclassToJson(List<Userclass> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Userclass {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  Userclass({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory Userclass.fromJson(Map<String, dynamic> json) => Userclass(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    address: Address.fromJson(json["address"]),
    phone: json["phone"],
    website: json["website"],
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address.toJson(),
    "phone": phone,
    "website": website,
    "company": company.toJson(),
  };
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: Geo.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo.toJson(),
  };
}

class Geo {
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}