
import 'package:transmobile/model/trans/transporteruModel.dart';

class TripModel {
    String id;
    TransporterModel transporter;
    List<City> citys;
    bool homePickUp;
    bool homeDelivery;
    List<dynamic> packages;
    bool isDone;
    String createdAt;

    TripModel({
        required this.id,
        required this.transporter,
        required this.citys,
        required this.homePickUp,
        required this.homeDelivery,
        required this.packages,
        required this.isDone,
        required this.createdAt,
    });

    factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        id:  json["_id"].toString(),
        transporter:TransporterModel.fromJson(json["transporter"]),
        citys: List<City>.from(json["Citys"].map((x) => City.fromJson(x))),
        homePickUp: json["Home_pick_up"],
        homeDelivery: json["Home_delivery"],
        packages: List<dynamic>.from(json["packages"].map((x) => x)),
        isDone: json["isDone"],
        createdAt: json["createdAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "transporter": transporter,
        "Citys": List<dynamic>.from(citys.map((x) => x.toJson())),
        "Home_pick_up": homePickUp,
        "Home_delivery": homeDelivery,
        "packages": List<dynamic>.from(packages.map((x) => x)),
        "isDone": isDone,
        "createdAt": createdAt,
    };
}

class City {
     String id;
    String city;
    String dateofpassage;
    bool done;

    City({
        required this.id,
        required this.city,
        required this.dateofpassage,
        required this.done,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
      id: json["_id"].toString(),
        city: json["city"],
        dateofpassage: json["dateofpassage"],
        done: json["Done"],
    );

    Map<String, dynamic> toJson() => {
        "_id" : id,
        "city": city,
        "dateofpassage": dateofpassage,
        "Done": done,
    };
}