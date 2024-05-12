import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Client%20components/demandeLivContainer.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/historydetails.dart';
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
          child: controller.historypage_loader? 
          const Center( child:CircularProgressIndicator(),):
            SingleChildScrollView(
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
                SizedBox(height: Dimenssions.height20,),
              controller.demandesLiv.isEmpty?

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                 
                  children: [ 
                    SizedBox(height: Dimenssions.height20*10,),
                    Icon(Icons.sentiment_dissatisfied_outlined, size: Dimenssions.icon24*2,color: AppColors.iconColor,),
                    SizedBox(height: Dimenssions.height20),
                    Text("you don't have any history", style: TextStyle(
                      color: AppColors.hintTextColor,
                      fontSize: Dimenssions.font20
                    ),),
                  ],
                 )
                 : SizedBox(
                    height: Dimenssions.height-40,
                    child: ListView.builder(
                    itemCount: controller.demandesLiv.length,
                    itemBuilder: (context, index){
                     
                      return GestureDetector(
                        onTap: () {
                          // adding the selected package and go to the page to display it
                        controller.selectedDemande = controller.demandesLiv[index];
                         Get.to(()=>const HistoryDetails());
                        },
                        child: DemandeLivContainer(
                          transporterImage:controller.demandesLiv[index].transporter.profilePicture ,
                          TransporterName: controller.demandesLiv[index].transporter.fullName,
                          dateofSend:  controller.demandesLiv[index].transporter.createdAt,
                          accepted: controller.demandesLiv[index].accepted,
                          refused: controller.demandesLiv[index].refused,
                                            
                                            
                        ),
                      );
                    }),
                  )
                
            
              ],
            ),
          ),
        );
      }),
    );
  }
}