// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [ 
        Row(
          children: [ 
          const Icon(Icons.arrow_back, color: AppColors.iconColor,),
          SizedBox(width: Dimenssions.width30*3),
          CostumeAnimatedText(text: "Search", color: AppColors.mainTextColor,fontSize: Dimenssions.font20,
            weight: FontWeight.bold,
           )
        ],),
        SizedBox(height: Dimenssions.height20,),
        




      ],),

    );
  }
}