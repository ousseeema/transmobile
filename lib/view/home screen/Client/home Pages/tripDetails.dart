import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/homeController.dart';
import 'package:transmobile/view/Client%20components/constumeListeView.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TripDetails extends StatefulWidget {
  const TripDetails({super.key});

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Dimenssions.height,
          child: PageView.builder(
            itemCount: Get.find<HomeController>().trips.length,
            itemBuilder: (_, index){
                      
                return CostumeListView(trip: Get.find<HomeController>().trips[index], index: index,);
            }),
        ),
      ),
    );
  }
}