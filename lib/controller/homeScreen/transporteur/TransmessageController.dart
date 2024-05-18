// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:transmobile/api/api.dart';

import 'package:transmobile/model/messages/messageModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/shared.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;


class TransporterMessageController extends GetxController {
  late TransporterModel Transporter;
   late Io.Socket socket;

 bool messageLoader = true;
void getuser() async {
    
     shared.getuser().then((value) {
      Transporter = TransporterModel.fromJson(jsonDecode(value!));
    });
  }

  List<Discussion> ListOfMessage = [
  
  ];
 
  void GetAllMessages() async {
 
    Response allMessage =
        await Get.find<UserApi>().GetRequest(AppConstant.TransGetListOfMessage);

    if (allMessage.body['success'] == true) {
      ListOfMessage.clear();
      allMessage.body['data'].forEach((message) {
        ListOfMessage.add(Discussion.fromJson(message));
      });
      messageLoader = false;
      update();
    } else {
   
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
late TransporterModel me;
  void sendMessage() async{
  await  shared.getuser().then((value) {
      Transporter = TransporterModel.fromJson(jsonDecode(value!));
  });
    Map<String, dynamic> message ={
      "message": messagecontroller.text, 
      "user": me.id,
      "transporteur": me.id,
      "client": SelectedDiscussion.userId.id



    };
    socket.emit('TransporterSendMessage', message );
    messagecontroller.text='';
  }
  void setUpsSocketListener() {
  socket.on('TransporterMessage-received',(message){
    SelectedDiscussion = Discussion.fromJson(message);
    
    for (var element in ListOfMessage) {
      
     if (element.id == SelectedDiscussion.id ){
      ListOfMessage.remove(element);
      ListOfMessage.add(SelectedDiscussion);
      update();
     }
    }
    update();


  });
  
}
}


