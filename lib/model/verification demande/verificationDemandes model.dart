class VerificationDemmnades {
  String id;
    String userId;
    String message;
    String  passport_image;
    String createdAt;
    bool approved;
  

    VerificationDemmnades({
      required this.id,
        required this.userId,
        required this.message ,
        required this.passport_image,
        required this.createdAt,
        required this.approved,
        
    });

    factory VerificationDemmnades.fromJson(Map<String, dynamic> json) => VerificationDemmnades(
        id: json["_id"].toString(),
        userId: json["userId"].toString(),
        message: json["message"],
        passport_image: json["passport_image"],
        createdAt: json["createdAt"],
        approved: json["approved"],
       
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "message": message,
        "passport_image": passport_image,
        "createdAt": createdAt,
        "approved": approved,
      
    };
}