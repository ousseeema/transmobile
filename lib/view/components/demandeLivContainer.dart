// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class DemandeLivContainer extends StatelessWidget {
  String TransporterName;
  String dateofSend;
  bool accepted;
  bool refused;
   String transporterImage;

  DemandeLivContainer(
      {super.key,
      required this.TransporterName,
      required this.transporterImage,
      required this.dateofSend,
      required this.accepted,
      required this.refused});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[100], 
        borderRadius: BorderRadius.circular(Dimenssions.radius10),
      ),
      margin: EdgeInsets.fromLTRB(
          Dimenssions.LRpadmarg10,
          Dimenssions.LRpadmarg20,
          Dimenssions.LRpadmarg10,
          Dimenssions.LRpadmarg20),
      height: Dimenssions.height20 * 4,
      width: Dimenssions.width,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(
                  20), // Adjust the radius to match the container's borderRadius
              child: Image.network(
                transporterImage,
                height: Dimenssions.height20 * 3,
                width: Dimenssions.height20 * 3,
              )),
              SizedBox(width: Dimenssions.radius20,),
              CostumeAnimatedText(text: TransporterName),
              SizedBox(width: Dimenssions.width20,),
              Text(dateofSend.substring(0,10)),
              SizedBox(width: Dimenssions.width20),
              accepted? CostumeAnimatedText(text: "Accepted", color: Colors.green,): refused? CostumeAnimatedText(text: "Rejected", color: Colors.red,):CostumeAnimatedText(text: "Waiting", color: Colors.grey,)
              


        ],
      ),
    );
  }
}
