import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class detailsResult extends StatefulWidget {
  const detailsResult({super.key});

  @override
  State<detailsResult> createState() => _detailsResultState();
}

class _detailsResultState extends State<detailsResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: Dimenssions.height20*5,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300, 
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimenssions.width20*2), topRight: Radius.circular(Dimenssions.width20*2))
              ),
              child: Column(
                children: [ 
                  SizedBox(height: Dimenssions.height20*3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CostumeAnimatedText(text: "helkjqshfdqsjqsdjqkhsds", fontSize: Dimenssions.font20,weight: FontWeight.bold,),
                      SizedBox(width: Dimenssions.width10,),
                    // test if verified or not if true then show the verified icon else dont show nothing
                     const Icon(Icons.verified, 
                     color: Colors.blue,)

                    ],
                  ), 
                  SizedBox(height: Dimenssions.height20,),

                  // message button to lance the coonversation
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(Dimenssions.radius30))
                    ),
                    height: Dimenssions.height20*3,
                    width: Dimenssions.width30*7,
                    child: Center(
                      child: CostumeAnimatedText(text: "Message Now !", color: AppColors.insidetextcolor,weight: FontWeight.bold, fontSize: Dimenssions.font20-2,),
                    ),
                  ),


              ],),
            )
            ),
            // account transporteur images  
            Positioned(
               top: Dimenssions.height20-4,
               left: Dimenssions.width30,
               right: Dimenssions.width30,
              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                    20),
                                                     // Adjust the radius to match the container's borderRadius
                                                child: Image.asset(
                                                  "assets/images/default.png",
                                                  height:
                                                      Dimenssions.height20 * 7,
                                                  width:
                                                      Dimenssions.height20 * 7,
                                                )),
            )
            ],
      )),
    );
  }
}
