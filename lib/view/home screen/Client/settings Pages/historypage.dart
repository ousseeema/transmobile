import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/components/demandeLivContainer.dart';
import 'package:transmobile/view/utils/colors.dart';
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
              SizedBox(height: Dimenssions.height20,),
              Row(
                children: [
                  SizedBox(width: Dimenssions.width20,),
                  GestureDetector(
                    onTap: () {
                      
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_rounded)),
                       SizedBox(width: Dimenssions.width20*6,),
                  CostumeAnimatedText(text: "History page", fontSize: Dimenssions.font20,),
                ],
              ),
              SizedBox(height: Dimenssions.height20*15,),

              SizedBox(height: Dimenssions.height20*2,),
              controller.demandesLiv.length == 0? Center(
                child: Column(
               
                  children: [
                  Icon(Icons.sentiment_dissatisfied_sharp, size: Dimenssions.icon24*2,color: AppColors.iconColor,),
                 SizedBox(height: Dimenssions.height20,),
                  const Text("No data foound for you")
                ],) ,):  
                Expanded(
                  child: 
                ListView.builder(
                itemCount: controller.demandesLiv.length,
                itemBuilder: (context, index){
                  print(controller.demandesLiv[index]);
                  return DemandeLivContainer(
                    transporterImage:controller.demandesLiv[index].transporter.profilePicture ,
                    TransporterName: controller.demandesLiv[index].transporter.fullName,
                    dateofSend:  controller.demandesLiv[index].transporter.createdAt,
                    accepted: controller.demandesLiv[index].accepted,
                    refused: controller.demandesLiv[index].refused,


                  );
                }))
              
          
            ],
          ),
        );
      }),
    );
  }
}