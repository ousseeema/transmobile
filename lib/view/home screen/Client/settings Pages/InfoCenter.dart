import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class InfoCenter extends StatelessWidget {
  const InfoCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [ 
           SizedBox(
          
            height: Dimenssions.height20*12,

            child: const GoogleMap(
              
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: LatLng(36.746562, 10.305588))),
          )
        ,SizedBox(
          height: Dimenssions.height20,
        ),
        
        

             
             
        ],),
      ),
    );
  }
}