// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class CostumeInfoDetails extends StatelessWidget {
  Icon icon ;
  
  CostumeAnimatedText text;
  String text1;
   CostumeInfoDetails({
    super.key,
    
    required this.text1,  required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: Dimenssions.width30*12,
      child: Wrap(
         children: [
           icon,
           SizedBox(
            width: Dimenssions.width10,
           ), 
            Text(text1, style: const TextStyle(
            color: AppColors.insidetextcolor,
            overflow: TextOverflow.ellipsis
                     ),  ),
           SizedBox(
            width: Dimenssions.width10,
           ), 
           SizedBox(
            width: Dimenssions.width30*5.5,
            child: text),
          ],
      ),
    );
  }
}