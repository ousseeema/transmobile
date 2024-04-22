



// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:html';

import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';

class DemandeLiv {
    String id;
    ClientModel client ;
    TransporterModel transporter;
    Message message;
    bool  accepted;
    bool refused;
    String createdAt;
   

    DemandeLiv({
        required this.id,
        required this.client ,
        required this.transporter,
        required this.message,
        required this.accepted,
        required this.refused,
        required this.createdAt,
       
    });

    factory DemandeLiv.fromJson(Map<String, dynamic> json) => DemandeLiv(
        id: json["_id"].toString(),
        client: ClientModel.fromJson(json["Client"]),
        transporter: TransporterModel.fromJson(json["transporter"]),
        message: json["message"],
        accepted: json["accepted"],
        refused: json["refused"],
        createdAt: json["createdAt"],
        
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Client": client.toJson,
        "transporter": transporter.toJson,
        "message": message.toJson(),
        "accepted": accepted,
        "refused": refused,
        "createdAt": createdAt,
       
    };
}

class Message{
  double numberofkg;
  String phoneNumberof_the_sender;
  String phoneNumberof_the_receiver;
  String Pickupaddress;
  String receivedAdress;
  bool homepickup;
  bool homedelivery;
  Message({
    required this.Pickupaddress,
    required this.homedelivery,
    required this.homepickup,
    required this.numberofkg,
    required this.phoneNumberof_the_receiver,
    required this.phoneNumberof_the_sender,
    required this.receivedAdress
    
  });

  factory Message.fromJson(Map<String, dynamic>json){
    return Message(
      Pickupaddress:json["Pickupaddress"],
      homedelivery: json["homedelivery"],
      homepickup: json["homepickup"],
      numberofkg: json["numberofkg"],
      phoneNumberof_the_receiver: json["phoneNumberof_the_receiver"],
      phoneNumberof_the_sender: json["phoneNumberof_the_sender"],
      receivedAdress: json["receivedAdress"]
    
       );
  }
   Map<String, dynamic> toJson() => {
        
        "Pickupaddress": Pickupaddress,
        "homedelivery": homedelivery,
        "homepickup": homepickup,
        "numberofkg": numberofkg,
        "phoneNumberof_the_receiver": phoneNumberof_the_receiver,
        "phoneNumberof_the_sender": phoneNumberof_the_sender,
        "receivedAdress":receivedAdress
       
    };

}
