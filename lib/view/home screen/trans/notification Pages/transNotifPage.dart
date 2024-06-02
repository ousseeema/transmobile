import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/transporteur/notificationController.dart';

class TransNotificationScreen extends StatefulWidget {
  const TransNotificationScreen({super.key});

  @override
  State<TransNotificationScreen> createState() => _TransNotificationScreenState();
}

class _TransNotificationScreenState extends State<TransNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: GetBuilder<TransnotificationController>(builder: (controller){
      return Container();
    }),
    );
  }
}