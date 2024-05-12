// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/notificationController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Client%20components/notifcationsContainer.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class notificationScreen extends StatefulWidget {
  const notificationScreen({super.key});

  @override
  State<notificationScreen> createState() => _notificationScreenState();
}

class _notificationScreenState extends State<notificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [ 
            SizedBox(height: Dimenssions.height20,),
            CostumeAnimatedText(text: 'Notification'),
            SizedBox(
              height: Dimenssions.height20*2,
            ),
            GetBuilder<notificationsController>(builder: (controller){
              return SizedBox(
              height: Dimenssions.height-Dimenssions.height20*10,
              width: Dimenssions.width,
              child: ListView.builder(
                itemCount: controller.notifications.length ,
                itemBuilder: ((context, index) {
                  return  notificationsContainer(Data: controller.notifications[index]['data'], Name: controller.notifications[index]['sender'], date: controller.notifications[index]['date']);
                })),
              );
            })


        
          ],
        ),
      ),
    );
  }
}