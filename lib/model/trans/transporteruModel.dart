
// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:transmobile/model/client/ClientModel.dart';

TransporterModel transporterModelFromJson(String str) => TransporterModel.fromJson(json.decode(str));

String transporterModelToJson(TransporterModel data) => json.encode(data.toJson());

class TransporterModel {
     String id ;
    String fullName;
    String email;
    String phoneNumberA;
    String phoneNumberB;
    String DestinationAddress;
    String localAddress;
    String carBrand;
    String carSerieNumber;
    String listCountry1;
    String listCountry2;
    bool homePickUps;
    bool homeDelivery;
    var priceKg;
    bool parsols;
    List<String> parsolsSite;
    String Adresse_Parsols;
    var numberofTrips;
    var numberofClients;
    var numberofPackages;
    String role;
    var totalRevenue;
    bool verified;
    String profilePicture;
    bool pro;
    String createdAt;
    List<Comment> comments;
    String ? pushNotificationId;
    
    TransporterModel({
         required this.id,
        required this.fullName,
        required this.email,
        required this.phoneNumberA,
        required this.phoneNumberB,
        required this.DestinationAddress,
        required this.localAddress,
        required this.carBrand,
        required this.carSerieNumber,
        required this.listCountry1,
        required this.listCountry2,
        required this.homePickUps,
        required this.homeDelivery,
        required this.priceKg,
        required this.parsols,
        required this.parsolsSite,
        required this.Adresse_Parsols,
        required this.numberofTrips,
        required this.numberofClients,
        required this.numberofPackages,
        required this.role,
        required this.totalRevenue,
        required this.verified,
        required this.profilePicture,
        required this.pro,
        required this.createdAt,
        required this.comments,
        this.pushNotificationId
    });

    factory TransporterModel.fromJson(Map<String, dynamic> json) => TransporterModel(
        id: json["_id"].toString(),
        fullName: json["fullName"],
        email: json["email"],
        pushNotificationId:json["pushNotificationId"],
        phoneNumberA: json["PhoneNumber_A"],
        phoneNumberB: json["PhoneNumber_B"],
        localAddress: json["localAddress"]??'',
        DestinationAddress: json["DestinationAddress"]??'',
        carBrand: json["Car_Brand"]??'',
        carSerieNumber: json["Car_SerieNumber"]??'',
        listCountry1: json["ListCountry_1"]??'',
        listCountry2: json["ListCountry_2"],
        homePickUps: json["HomePickUps"],
        homeDelivery: json["HomeDelivery"],
        priceKg: json["price_kg"],
        parsols: json["Parsols"],
        parsolsSite: List<String>.from(json["Parsols_Site"].map((x) => x)),
        Adresse_Parsols : json["Adresse_Parsols"]??'',
        numberofTrips: json["numberofTrips"],
        numberofClients: json["numberofClients"],
        numberofPackages: json["numberofPackages"],
        role: json["Role"],
        totalRevenue: json["totalRevenue"],
        verified: json["verified"],
        profilePicture: json["profilePicture"],
        pro: json["pro"],
        createdAt: json["createdAt"],
        comments:List<Comment>.from(json["comments"].map((commentJson) => Comment.fromJson(commentJson))));

        Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "pushNotificationId":pushNotificationId,
        "PhoneNumber_A": phoneNumberA,
        "PhoneNumber_B": phoneNumberB,
        "localAddress": localAddress,
        "DestinationAddress": DestinationAddress,
        "Car_Brand": carBrand,
        "Car_SerieNumber": carSerieNumber,
        "ListCountry_1": listCountry1,
        "ListCountry_2": listCountry2,
        "HomePickUps": homePickUps,
        "HomeDelivery": homeDelivery,
        "price_kg": priceKg,
        "Parsols": parsols,
        "Parsols_Site": List<dynamic>.from(parsolsSite.map((x) => x)),
        "Adresse_Parsols":Adresse_Parsols,
        "numberofTrips": numberofTrips,
        "numberofClients": numberofClients,
        "numberofPackages": numberofPackages,
        "Role": role,
        "totalRevenue": totalRevenue,
        "verified": verified,
        "profilePicture": profilePicture,
        "pro": pro,
        "createdAt": createdAt,
        "comments": List<Comment>.from(comments.map((x) => x.toJson())),
    };
}

class Comment {
    String id;
   ClientModel user;
    String comment;
    int rating;
    String createdAt;

    Comment({
     required this.id,
       required this.user,
        required this.comment,
        required this.rating,
        required this.createdAt,
    });

     factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json["_id"].toString(),
      user: json['user'] != null ? ClientModel.fromJson(json['user']) : ClientModel(), // Handle null user
      comment: json["comment"] ?? '',
      rating: json["rating"] ?? 0, // Provide default value for rating if null
      createdAt: json["createdAt"] ?? '',
    );
  }

    Map<String, dynamic> toJson() => {
      "_id" : id,
        "user": user.toJson(),
        "comment": comment,
        "rating": rating,
        "createdAt": createdAt,
    };
}
