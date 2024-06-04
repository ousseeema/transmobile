// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class MessageContainer  extends StatelessWidget {
  String message ;
  String date;
  Color backgroundColor;
   MessageContainer({super.key, required this.message, required this.date, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return  Row(
     children: [ 
       Container(
         padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
         
       )
     ],
    );
  }
}