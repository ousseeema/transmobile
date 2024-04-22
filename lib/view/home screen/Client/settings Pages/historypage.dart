import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: GetBuilder<SettingController>(builder: (controller){
        return SafeArea(
          child: Column(
            children: [ 
              CostumeAnimatedText(text: "History page"),

              SizedBox(height: Dimenssions.height20*2,),
              Expanded(child: 
              ListView.builder(
                itemCount: controller.demandesLiv.length,
                itemBuilder: (context, index){
                  return Container();
                }))
              
          
            ],
          ),
        );
      }),
    );
  }
}