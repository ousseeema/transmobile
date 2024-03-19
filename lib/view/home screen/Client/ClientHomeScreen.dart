import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/clientHomeController.dart';

class ClientMainScreens extends StatefulWidget {
  const ClientMainScreens({super.key});

  @override
  State<ClientMainScreens> createState() => _ClientMainScreensState();
}

class _ClientMainScreensState extends State<ClientMainScreens> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GetBuilder<ClienntHomeController>(builder: (controller){
        return const Center(
        child: Text("user client"),
      );
      }),
    );
  }
}