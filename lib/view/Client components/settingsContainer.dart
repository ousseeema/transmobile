// ignore_for_file: must_be_immutable

import 'package:flutter/widgets.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class SettingsContainer extends StatelessWidget {
  String text;
  IconData iconData;
  
   SettingsContainer({super.key, required this.iconData, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: Dimenssions.width20,),
        Icon(iconData),
        SizedBox(width: Dimenssions.width10,),
       Text(text),
    
      ],
    );
  }
}