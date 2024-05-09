import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';

class Discussion {
  String id;
  String userId;
   TransporterModel transporterId;
 List<dynamic> messages;
  String createdAt;

  Discussion({
    required this.id,
    required this.userId,
    required this.messages,
   required this.transporterId,
    required this.createdAt,
  });

  factory Discussion.fromJson(Map<String, dynamic> json) => Discussion(
        id: json["_id"].toString(),
        userId: json["clientId"].toString(),
        transporterId: TransporterModel.fromJson(json["transporteur"]),
        messages: json["messages"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "transporterId": transporterId.toJson(),
        "message": messages,
        "createdAt": createdAt,
      };
}
