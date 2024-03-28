import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transmobile/view/home%20screen/Client/home%20Pages/tripDetails.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class Maps extends StatelessWidget {
  const Maps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: Dimenssions.height,
            width: Dimenssions.width,
            child: const GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(42.83333333, 12.83333333), zoom: 4.5)),
          ),
        ),
        Positioned(
            bottom: Dimenssions.height20,
          left: Dimenssions.width20*4,
            right: Dimenssions.width20*4,

            child: GestureDetector(
              onTap: () {
                // going to the trip details
                Get.to(()=> TripDetails() );
                
              },
              child: Container(
                height: Dimenssions.height10 * 5,
                width: Dimenssions.width30 * 9,
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)),
                child:const  Center(
                  child: Text("See More Details",
                  style: TextStyle(color: AppColors.insidetextcolor))),
              ),
            ))
      ],
    ));
  }
}
