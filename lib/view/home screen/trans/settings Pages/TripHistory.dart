import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransSettingsController.dart';
import 'package:transmobile/view/Trans%20components/trip%20History%20container.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransTripHistory extends StatefulWidget {
  const TransTripHistory({super.key});

  @override
  State<TransTripHistory> createState() => _TransTripHistoryState();
}

class _TransTripHistoryState extends State<TransTripHistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<TransSettingsController>().getAllTrips();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: GetBuilder<TransSettingsController>(builder: (controller){
        return Center(
          child: Column(
            
            children: [
              SizedBox(height: Dimenssions.height20,),
               Row(
                 children: [
                  SizedBox(width: Dimenssions.width30,),
                  GestureDetector
                  (
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back_rounded)),
                   SizedBox(width: Dimenssions.width30*3,),
                   Text("Trip History", style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: Dimenssions.font20
                                 
                             
                               ),),
                 ],
               ), 
           controller.TripHistoryList.isEmpty? SizedBox(height: Dimenssions.height20*7,):SizedBox(height: Dimenssions.height20,),
                 // ! listview builder to display the history list if its more then 0 else display no data 
              controller.TripHistoryList.isEmpty? SizedBox(
                height: Dimenssions.height20*13,
                width: Dimenssions.width30*8,
                child: LottieBuilder.asset("assets/animations/nodatafound.json")): 
               SizedBox(
                height: Dimenssions.height-Dimenssions.height20*5,
                width: Dimenssions.width,
                 child: ListView.builder(
                  itemCount: controller.TripHistoryList.length,
                  itemBuilder: (_, index){
                    return HistoryTripContainer(Trip:controller.TripHistoryList[index],);
                  }),
               ),
          
          
          
            ],
          ),
        );

      })),
    );
  }
}