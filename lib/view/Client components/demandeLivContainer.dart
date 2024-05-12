// ignore_for_file: non_constant_identifier_names, must_be_immutable, unnecessary_brace_in_string_interps

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/utils/appConstant.dart';
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
        color:accepted? Colors.green:  refused? Colors.red: Colors.grey[300], 
        borderRadius: BorderRadius.circular(Dimenssions.radius10),
      ),
      margin: EdgeInsets.only(
          left: Dimenssions.LRpadmarg10,
          right: Dimenssions.LRpadmarg20,
          top: Dimenssions.LRpadmarg10,
         ),
      height: Dimenssions.height20 *4,
      width: Dimenssions.width,
      child: Padding(
        padding:  EdgeInsets.only(left: Dimenssions.LRpadmarg10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // Adjust the radius to match the container's borderRadius
                  child: Image.network(
                    "${AppConstant.Transimage}/${transporterImage}",
                    height: Dimenssions.height20 * 3,
                    width: Dimenssions.height20 * 3,
                  )),
            ),
              Expanded(
                flex: 4,
                child: Wrap(
                  children: [
                   
                  
                  CostumeAnimatedText(text: TransporterName),
                  SizedBox(width: Dimenssions.width20,),
                  Text(dateofSend.substring(0,10)),
                  SizedBox(width: Dimenssions.width10),
                  accepted? CostumeAnimatedText(text: "Accepted", color: Colors.green,): refused? CostumeAnimatedText(text: "Rejected", color: Colors.red,):CostumeAnimatedText(text: "Waiting", color: Colors.grey,)
                  
                  ],
                ),
              )
        
        
          ],
        ),
      ),
    );
  }
}
