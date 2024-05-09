// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_common/src/util/event_emitter.dart';

import 'package:transmobile/api/api.dart';
import 'package:transmobile/controller/homeScreen/Client/homeController.dart';
import 'package:transmobile/model/client/ClientModel.dart';

import 'package:transmobile/model/messages/messageModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/shared.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;


class MessageController extends GetxController {
  late ClientModel client;
   late Io.Socket socket;


  void getuser() async {
    shared.getuser().then((value) {
      client = ClientModel.fromJson(jsonDecode(value!));
    });
  }

  List<Discussion> ListOfMessage = [
  
  ];
  bool messageLoader = true;
  void GetAllMessages() async {
   
    Response allMessage =
        await Get.find<UserApi>().GetRequest(AppConstant.getListOfMessage);

    if (allMessage.body['success'] == true) {
      ListOfMessage=[];
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

  late Discussion SelectedDiscussion;

  void selectDiscussion(Discussion discussion) {
    SelectedDiscussion = discussion;
     update();
  }
late ClientModel me;
  void sendMessage() async{
  await shared.getuser().then((value) {
    me= ClientModel.fromJson(jsonDecode(value!));
  });
    Map<String, dynamic> message ={
      "message": messagecontroller.text, 
      "user": me.id,
      "transporteur": SelectedDiscussion.transporterId.id



    };
    socket.emit('sendMessage', message );
    messagecontroller.text='';
  }
  void setUpsSocketListener() {
  socket.on('message-received',(message){
    SelectedDiscussion = Discussion.fromJson(message);
    
    ListOfMessage.forEach((element) {
      
     if (element.id == SelectedDiscussion.id ){
      ListOfMessage.remove(element);
      ListOfMessage.add(SelectedDiscussion);
      update();
     }
    },);
    update();


  });
  
}
}


