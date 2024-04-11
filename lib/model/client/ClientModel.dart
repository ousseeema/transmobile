
import 'dart:convert';



class ClientModel {
    String id;
    String fullName;
    String email;
    String phoneNumber;
    String phoneNumber2;
    String role;
    String fulladdress;
    int numberofPackagesSended;
    int numberofPackagesDelivred;
    String country;
    String profilePicture;
    String createdAt;
    List<dynamic> historique;

    ClientModel({
        required this.id,
        required this.fullName,
        required this.email,
        required this.phoneNumber,
        required this.phoneNumber2,
        required this.role,
        required this.fulladdress,
        required this.numberofPackagesSended,
        required this.numberofPackagesDelivred,
        required this.country,
        required this.profilePicture,
        required this.createdAt,
        required this.historique,
    });

    factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["_id"].toString(),
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["Phone_Number"],
        phoneNumber2: json["Phone_Number2"],
        role: json["Role"],
        fulladdress: json["fulladdress"],
        numberofPackagesSended: json["numberofPackagesSended"],
        numberofPackagesDelivred: json["numberofPackagesDelivred"],
        country: json["country"],
        profilePicture: json["profilePicture"],
        createdAt: json["createdAt"],
        historique: List<dynamic>.from(json["Historique"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "Phone_Number": phoneNumber,
        "Phone_Number2": phoneNumber2,
        "Role": role,
        "fulladdress": fulladdress,
        "numberofPackagesSended": numberofPackagesSended,
        "numberofPackagesDelivred": numberofPackagesDelivred,
        "country": country,
        "profilePicture": profilePicture,
        "createdAt": createdAt,
        "Historique": List<dynamic>.from(historique.map((x) => x)),
    };
}
