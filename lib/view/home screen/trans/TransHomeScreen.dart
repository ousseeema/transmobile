// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:transmobile/controller/homeScreen/TransHomeController.dart';
import 'package:transmobile/view/utils/shared.dart';

class TransHomeScreen extends StatefulWidget {
  const TransHomeScreen({super.key});

  @override
  State<TransHomeScreen> createState() => _TransHomeScreenState();
}

class _TransHomeScreenState extends State<TransHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    
  }
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
body: GetBuilder<transHomeController>(builder: (controller){
        return const Center(
        child: Text("user transporter"),
      );
      }),
    );
  }
}