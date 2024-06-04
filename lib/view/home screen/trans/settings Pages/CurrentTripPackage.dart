import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransSettingsController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Trans%20components/costumePackage.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class CurrentTripPackage extends StatefulWidget {
  const CurrentTripPackage({super.key});

  @override
  State<CurrentTripPackage> createState() => _CurrentTripPackageState();
}

class _CurrentTripPackageState extends State<CurrentTripPackage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
       Get.find<TransSettingsController>().GetCurrentTripPackage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<TransSettingsController>(builder: (controller) {
      return controller.CurrentTripPackage_loader
          ? const Center(child: CircularProgressIndicator())
          : controller.CurrentTripPackage.isEmpty
              ? Center(
                child: SizedBox(
                height: Dimenssions.height20*13,
                width: Dimenssions.width30*8,
                child: LottieBuilder.asset("assets/animations/nodatafound.json")),
              )
              : SafeArea(
                child: Column(
                    children: [
                      CostumeAnimatedText(
                        text: "Current Trip Packages",fontSize: Dimenssions.font20-3,
                        
                      ),
                      SizedBox(
                        height: Dimenssions.height20 * 2,
                      ),
                     CostumePackageList(packageList:controller.CurrentTripPackage, heightscreen: Dimenssions.height-Dimenssions.height20*4.5,),
                    ],
                  ),
              );
    }));
  }
}
