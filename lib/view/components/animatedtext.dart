// ignore_for_file: must_be_immutable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CostumeAnimatedText extends StatelessWidget {
  String text;
  double? fontSize ;
  Color? color ;
  FontWeight? weight ;
  Color? decorationColor;
  TextDecorationStyle? decorationStyle;
  TextDecoration? textDecoration ;
  CostumeAnimatedText({super.key, required this.text ,  this.fontSize,  this.color,  this.weight,this.textDecoration, this.decorationColor, this.decorationStyle}){
     fontSize;
     color ;
     weight ;
     textDecoration;
     decorationColor;
     decorationStyle ;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      totalRepeatCount: 1,
      animatedTexts: [ 

      TyperAnimatedText(
    
      speed:const Duration(milliseconds: 100),
      " $text",
      textStyle: TextStyle(
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      color: color,
      fontSize: fontSize,
      fontWeight: weight,
      decoration: textDecoration
      ),
      ),
      
      ]);
  }
}
