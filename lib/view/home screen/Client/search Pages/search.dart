// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/components/autoplaces.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  TextEditingController googlecontroller  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [ 
          SizedBox(height: Dimenssions.height20,),
          Row(
            children: [ 
              // search title 
             Padding(
              padding:  const EdgeInsets.all(8.0),
              child:  Icon(Icons.arrow_back, color: AppColors.mainTextColor,size: Dimenssions.icon24,),
            ),
            SizedBox(width: Dimenssions.width/2-Dimenssions.width30*2),
            CostumeAnimatedText(text: "Search", color: AppColors.mainTextColor,fontSize: Dimenssions.font20,
              weight: FontWeight.bold,
             )
          ],),
          SizedBox(height: Dimenssions.height20*4,),
          // search input for the current country 
           autoPlaces(icon: const Icon(BoxIcons.bx_world, color: AppColors.iconColor,), hintText: "Current Country", labelText: "Country A"),
         SizedBox(height: Dimenssions.height20*2,),
         // search input for destination country
          autoPlaces(icon: const Icon(BoxIcons.bx_world, color: AppColors.iconColor,), hintText: "Destination Country", labelText: "Country B"),

           SizedBox(height: Dimenssions.height20*2,),
           // date picker 
           
      
      
      
        ],),
      
      ),
    );
  }
}