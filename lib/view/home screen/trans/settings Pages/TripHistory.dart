import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransSettingsController.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TripHistory extends StatefulWidget {
  const TripHistory({super.key});

  @override
  State<TripHistory> createState() => _TripHistoryState();
}

class _TripHistoryState extends State<TripHistory> {
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
        return Column(
          children: [
             Text("Trip History", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Dimenssions.font20
            

          ),), 
               // ! listview builder to display the history list if its more then 0 else display no data 
            controller.TripHistoryList.isEmpty? LottieBuilder.asset("assets/animations/nodatafound.json"): 
             ListView.builder(
              itemCount: controller.TripHistoryList.length,
              itemBuilder: (_, index){
                return Container();
              }),



          ],
        );

      })),
    );
  }
}