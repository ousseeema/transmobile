import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class InfoCenter extends StatelessWidget {
  const InfoCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [ 
           SizedBox(
          
            height: Dimenssions.height20*12,

            child: const GoogleMap(
              
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: LatLng(36.746562, 10.305588))),
          )
        ,SizedBox(
          height: Dimenssions.height20*2,
        ),
        Row(
          children: [ 
            const Icon(Icons.email, color : AppColors.iconColor),
            SizedBox(width: Dimenssions.width20,),
            CostumeAnimatedText(text: "E-Mail : westudy.tn@gmail.com " )

          ],
        ),
        SizedBox(height: Dimenssions.height20,),
        Row(
          children: [ 
            const Icon(Icons.phone_iphone_rounded, color : AppColors.iconColor),
            SizedBox(width: Dimenssions.width20,),
            CostumeAnimatedText(text: "Téléphone: 56 329 392" )

          ],
        ),
        SizedBox(height: Dimenssions.height20,),
         Row(
          children: [ 
            const Icon(Icons.phone_iphone_rounded, color : AppColors.iconColor),
            SizedBox(width: Dimenssions.width20,),
            CostumeAnimatedText(text: " Adresse: 7 Av Farhat Hached, Ezzahra,\n Ben Arous, 2034, Tunis" )

          ],
        ),
        SizedBox(height: Dimenssions.height20*2,),
        Row( 
          children: [ 
            Container(
              height: Dimenssions.height20*2,
              decoration: const BoxDecoration( 
                color: AppColors.iconColor
              ),
              child:const  Center(
                child: Icon(BoxIcons.bxl_facebook, color: AppColors.iconColor,),
              ),
            ),
            SizedBox(width: Dimenssions.width20,),
             Container(
              height: Dimenssions.height20*2,
              decoration: const BoxDecoration( 
                color: AppColors.iconColor
              ),
              child:const  Center(
                child: Icon(  BoxIcons.bxl_instagram, color: AppColors.iconColor,),
              ),
            ),
            SizedBox(width: Dimenssions.width20,),
             Container(
              height: Dimenssions.height20*2,
              decoration: const BoxDecoration( 
                color: AppColors.iconColor
              ),
              child:const  Center(
                child: Icon(  BoxIcons.bxl_tiktok, color: AppColors.iconColor,),
              ),
            )
          ],
        ),
        SizedBox(height: Dimenssions.height20*4,),
        CostumeAnimatedText(text: 'Copyright © 2024 WeStudy')
         


        

             
             
        ],),
      ),
    );
  }
}