



// ignore_for_file: file_names

class ClientModel {
    String? id;
    String? fullName;
    String? email;
    String? phoneNumber;
    String? phoneNumber2;
    String? role;
    String? fulladdress;
    int? numberofPackagesSended;
    int? numberofPackagesDelivred;
    String? country;
    String? profilePicture;
    String? createdAt;
    bool? verified;
    List<dynamic>? historique;

    ClientModel({
        this.id,
         this.verified ,
         this.fullName,
         this.email,
         this.phoneNumber,
        this.phoneNumber2,
        this.role,
         this.fulladdress,
         this.numberofPackagesSended,
         this.numberofPackagesDelivred,
         this.country,
         this.profilePicture,
        this.createdAt,
         this.historique,
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
        verified: json["verified"],
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
        "verified": verified,
        "Historique": List<dynamic>.from(historique!.map((x) => x)),
    };
}
