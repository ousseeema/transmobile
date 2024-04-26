import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class HistoryDetails extends StatelessWidget {
  const HistoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GetBuilder<SettingController>(builder:(controller){
      return  SingleChildScrollView(
        child: Column(
          children: [ 

                //! display the package image
                Container( 
                  margin: EdgeInsets.only(left: Dimenssions.LRpadmarg20, right: Dimenssions.LRpadmarg20),
                  height: Dimenssions.height20*7,
                 decoration: BoxDecoration( 
                  image: DecorationImage(
                    image:NetworkImage("${AppConstant.Packagesimage}${controller.selectedDemande!.message.packagephoto}"))
                 ),
                )
          ],
        ),
      );
    }),
    );
  }
}