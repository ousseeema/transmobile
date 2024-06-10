import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';

class Discussion {
 String? id;
  ClientModel? userId;
  TransporterModel? transporterId;
  List<dynamic>? messages;
  String? createdAt;

  Discussion({
    this.id,
    this.userId,
    this.transporterId,
    this.messages,
    this.createdAt,
  });

  factory Discussion.fromJson(Map<String, dynamic> json) => Discussion(
        id: json["_id"].toString(),
        userId: ClientModel.fromJson(json["clientId"]),
        transporterId: TransporterModel.fromJson(json["transporteur"]),
        messages: json["messages"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "transporterId": transporterId!.toJson(),
        "message": messages,
        "createdAt": createdAt,
      };
}
