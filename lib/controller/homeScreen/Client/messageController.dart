import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/model/messages/messageModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/shared.dart';

class MessageController extends GetxController {
  late ClientModel client;
  void getuser() async {
    shared.getuser().then((value) {
      client = ClientModel.fromJson(jsonDecode(value!));
    });
  }

  List<Message> ListOfMessage = [
    Message(
        id: "lqkcssckcqscqs",
        userId: "662960884fd5711489e1ad1c",
        messages: [
          {
            'user': "660ed383a68c5c38446f4bce",
            "message": "heeelo there from here",
            'CreatedAt': '2024-04-04T16:19:32.990Z'
          }
        ],
        transporterId: TransporterModel(
            id: "660ed383a68c5c38446f4bce",
            fullName: 'ihsdusdfsdf',
            email: 'fdsfsdfsdfsdff',
            phoneNumberA: 'phoneNumberA',
            phoneNumberB: 'phoneNumberB',
            DestinationAddress: 'DestinationAddress',
            localAddress: 'localAddress',
            carBrand: 'carBrand',
            carSerieNumber: 'carSerieNumber',
            listCountry1: 'listCountry1',
            listCountry2: 'listCountry2',
            homePickUps: true,
            homeDelivery: false,
            priceKg: 14,
            parsols: true,
            parsolsSite: ['qsfqsfqsfqsfqsf'],
            Adresse_Parsols: "Adresse_Parsols",
            numberofTrips: 14,
            numberofClients: 10,
            numberofPackages: 11,
            role: "transporteur",
            totalRevenue: 1000,
            verified: false,
            profilePicture: "transporteurs_660ed383a68c5c38446f4bce.jpg",
            pro: true,
            createdAt:"2024-04-04T16:19:32.990Z",
            comments: []),
        createdAt: "2024-04-04T16:19:32.990Z"),
    Message(
        id: "lqkcssckcqscqs",
        userId: "662960884fd5711489e1ad1c",
        messages: [
          {
            'user': "660ed383a68c5c38446f4bce",
            "message": "heeelo there from here",
            'CreatedAt': '2024-04-04T16:19:32.990Z'
          }
        ],
        transporterId: TransporterModel(
            id: "660ed383a68c5c38446f4bce",
            fullName: 'ihsdusdfsdf',
            email: 'fdsfsdfsdfsdff',
            phoneNumberA: 'phoneNumberA',
            phoneNumberB: 'phoneNumberB',
            DestinationAddress: 'DestinationAddress',
            localAddress: 'localAddress',
            carBrand: 'carBrand',
            carSerieNumber: 'carSerieNumber',
            listCountry1: 'listCountry1',
            listCountry2: 'listCountry2',
            homePickUps: true,
            homeDelivery: false,
            priceKg: 14,
            parsols: true,
            parsolsSite: ['qsfqsfqsfqsfqsf'],
            Adresse_Parsols: "Adresse_Parsols",
            numberofTrips: 14,
            numberofClients: 10,
            numberofPackages: 11,
            role: "transporteur",
            totalRevenue: 1000,
            verified: false,
            profilePicture: "transporteurs_660ed383a68c5c38446f4bce.jpg",
            pro: true,
            createdAt: "2024-04-04T16:19:32.990Z",
            comments: []),
        createdAt: "2024-04-04T16:19:32.990Z")
  ];
  bool messageLoader = true;
  void GetAllMessages() async {
    Response allMessage =
        await Get.find<UserApi>().GetRequest(AppConstant.getListOfMessage);
   

    if (allMessage.body['success'] == true) {
      allMessage.body['data'].forEach((message) {
        ListOfMessage.add(Message.fromJson(message));
      });
      messageLoader = false;
      update();
    } else {
      messageLoader = false;
      update();
      Get.snackbar('Error', 'Error loading data', backgroundColor: Colors.red);
    }
  }
}
