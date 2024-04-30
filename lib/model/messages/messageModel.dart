class Message {
  String id;
  String userId;
  String transporterId;
  List<Map<String, dynamic>> messages;
  String createdAt;

  Message({
    required this.id,
    required this.userId,
    required this.messages,
    required this.transporterId,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => VerificationDemmnades(
        id: json["_id"].toString(),
        userId: json["userId"].toString(),
        messages: json["messages"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "message": messages,
        "createdAt": createdAt,
      };
}
