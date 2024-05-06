// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;
import 'package:transmobile/api/api.dart';
import 'package:transmobile/model/client/ClientModel.dart';

import 'package:transmobile/model/messages/messageModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/shared.dart';

class MessageController extends GetxController {
  late ClientModel client;
  late Io.Socket socket;

  void getuser() async {
    shared.getuser().then((value) {
      client = ClientModel.fromJson(jsonDecode(value!));
    });
  }

  List<Discussion> ListOfMessage = [
    Discussion(
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
        createdAt: "2024-04-04T16:19:32.990Z"),
    Discussion(
        id: "lqkcssckcqscqs",
        userId: "662960884fd5711489e1ad1c",
        messages: [
          {
            'user': "660ed383a68c5c38446f4bce",
            "message": "heeelo there from here",
            'CreatedAt': '2024-04-04T16:19:32.990Z'
          },
          {
            'user': "660ed383a68c5c38446f4bce",
            "message": "heeelo there from here",
            'CreatedAt': '2024-04-04T16:19:32.990Z'
          },
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
      //ListOfMessage=[];
      allMessage.body['data'].forEach((message) {
        ListOfMessage.add(Discussion.fromJson(message));
      });
      messageLoader = false;
      update();
    } else {
      messageLoader = false;
      update();
      Get.snackbar('Error', 'Error loading data', backgroundColor: Colors.red);
    }
  }

// chatmessage page

  //init socket io
  void socketInit() {
    socket = Io.io(
        "http://192.168.1.38:3000",
        Io.OptionBuilder()
            .setTransports(["websocket"])
            .disableAutoConnect()
            .build());
            socket.connect();
  }

  TextEditingController messagecontroller = TextEditingController();

  late Discussion SelectedDiscussion;

  void selectDiscussion(Discussion discussion) {
    SelectedDiscussion = discussion;
  }

  void sendMessage() {}
}
