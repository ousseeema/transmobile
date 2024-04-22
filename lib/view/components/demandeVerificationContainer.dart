// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class demandeverificationContainer extends StatelessWidget {
 String imageurl;
  String message;
  bool approved;
  String created_at;
   demandeverificationContainer({super.key,
  required this.message,
  required this.imageurl,
  required this.approved,
  required this.created_at});
 
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(Dimenssions.LRpadmarg20),
      height: Dimenssions.height20*9,
      width: Dimenssions.width,
      decoration: BoxDecoration(
        boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(4, 8), // changes position of shadow
                ),
              ],
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(Dimenssions.radius20)),
              child: Row(
                children: [ 
                  
                  SizedBox(
                      width: Dimenssions.width10/2 ,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(Dimenssions.radius20),
                      // Adjust the radius to match the container's borderRadius
                      child: Image.network(
                        
                        "${AppConstant.Passportimage}${imageurl}",
                        fit: BoxFit.cover,
                        height: Dimenssions.height20*8,
                        width: Dimenssions.width30 * 4,
                      ),
                    ),
                    SizedBox(
                      width: Dimenssions.width10,
                    ),
                   Column(
                     children: [
                      SizedBox(height: Dimenssions.height20,),
                       SizedBox(
                        height: Dimenssions.height20*6,
                        width: Dimenssions.width30*4,
                         child: Text(
                          message,
                         softWrap: true,
                         maxLines: 5, 
                         style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.mainTextColor,
                          fontSize:Dimenssions.font20-5
                         ),),
                       ),
                       Text(created_at.substring(0,10),
                       style: const TextStyle(
                        color: Colors.white
                       ),),
                       
                     ],
                   ),
                   SizedBox(width: Dimenssions.width30-5,),
                   
                   approved? const  Text("Approved", style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                   ),):  const  Text("Denied", style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                   ),)



                ],
              ), 
      );
    
  }
}