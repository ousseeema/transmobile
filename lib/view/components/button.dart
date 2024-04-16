import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class CostumeButton extends StatelessWidget {
  double height;
  double width;
  String text;

   CostumeButton({super.key, required this.height, required this.width, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius:
              BorderRadius.circular(Dimenssions.radius10)),
      child:  Center(
        child: Text(text
          ,
          style:const  TextStyle(color: AppColors.insidetextcolor),
        ),
      ),
    ) ;
  }
}