import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/clientHomeController.dart';

class ClienHomeScreen extends StatefulWidget {
  const ClienHomeScreen({super.key});

  @override
  State<ClienHomeScreen> createState() => _ClienHomeScreenState();
}

class _ClienHomeScreenState extends State<ClienHomeScreen> {
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