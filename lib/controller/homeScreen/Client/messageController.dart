// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;
import 'package:transmobile/api/api.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/model/messages/messageModel.dart';
import 'package:transmobile/view/home%20screen/Client/messages%20Pages/chatPage.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/shared.dart';

class MessageController extends GetxController {
  late ClientModel client;
  late Io.Socket socket;

  void getuser() async {
    await shared.getuser().then((value) {
      client = ClientModel.fromJson(jsonDecode(value!));
      me =ClientModel.fromJson(jsonDecode(value));
    });
  }

  List<Discussion> ListOfMessage = [];
  bool messageLoader = true;
  void GetAllMessages() async {
    Response allMessage =
        await Get.find<UserApi>().GetRequest(AppConstant.getListOfMessage);

    if (allMessage.body['success'] == true) {
      ListOfMessage = [];
      
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
        AppConstant.socekturl,
        Io.OptionBuilder()
            .setTransports(["websocket"])
            .disableAutoConnect()
            .build());

    socket.connect();
    setUpsSocketListener();
  }

  TextEditingController messagecontroller = TextEditingController();

  Discussion? SelectedDiscussion;

  void selectDiscussion(Discussion discussion) {
    SelectedDiscussion = discussion;
    update();
  }

  late ClientModel me;
  void sendMessage() async {
    await shared.getuser().then((value) {
      me = ClientModel.fromJson(jsonDecode(value!));
    });
    Map<String, dynamic> message = {
      "message": messagecontroller.text,
      "user": me.id,
      "client": me.id,
      "transporteur": SelectedDiscussion!.transporterId!.id
    };
    socket.emit('sendMessage', message);
    messagecontroller.text = '';
     String messagenotfi = "New message from ${me.fullName}";
        String title = "Message : " ; 
        List <String>userIds = [SelectedDiscussion!.transporterId!.pushNotificationId??""];
        Response send_Notification = await Get.find<UserApi>().sendNotification(userIds, AppConstant.ClientsendNotification, messagenotfi, title);

  }

  void setUpsSocketListener() {
    socket.on('message-received', (message) {
      SelectedDiscussion = Discussion.fromJson(message);

      ListOfMessage.forEach(
        (element) {
          if (element.id == SelectedDiscussion!.id) {
            ListOfMessage.remove(element);
            ListOfMessage.add(SelectedDiscussion!);
            update();
          }
        },
      );
      update();
    });
  }

   bool Loader = false ;
   // gettting message when the user contact for the transporteur for  the first time
GetSpecifiqueMessage() async {
   Loader = true;
    update();

    Response lanuchMessage = await Get.find<UserApi>().GetRequest(
        "${AppConstant.UserGetSpecifiqueMessage}${Get.find<DetailsResult>().SelectedTrip!.transporter.id}");
   
    if (lanuchMessage.body["success"]) {
     
  
   SelectedDiscussion = Discussion.fromJson(lanuchMessage.body['data']);
    getuser();
      Future.delayed(const Duration(seconds: 2),(){
        Loader = false;
      update();
      });
      Get.off(()=> const chatPage());
       
    } else {
      getuser();
      Future.delayed(const Duration(seconds: 2),(){
        Loader = false;
      update();
      });
      SelectedDiscussion = Discussion(transporterId: Get.find<DetailsResult>().SelectedTrip!.transporter,messages: [],userId: me);
      
      Get.off(()=> const chatPage());
       
      
    }
  }
  
}
