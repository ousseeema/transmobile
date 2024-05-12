// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransHomeController.dart';
import 'package:transmobile/controller/homeScreen/transporteur/transMainScreenController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';
import 'package:transmobile/view/utils/shared.dart';

class TransHomeScreen extends StatefulWidget {
  const TransHomeScreen({super.key});

  @override
  State<TransHomeScreen> createState() => _TransHomeScreenState();
}

class _TransHomeScreenState extends State<TransHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    
  }
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
body:  SafeArea(
      child: GetBuilder<TransmainScreenController>(builder: (Controller){
        return Scaffold(
          body: Controller.Pages[Controller.currentIndex],
        bottomNavigationBar:  CurvedNavigationBar(
        
          backgroundColor: Colors.white,
          
          height: Dimenssions.height20*3,
         onTap: (value) {
           Controller.changePages(value);
         },
         index: Controller.currentIndex,
          items: [
             Icon(BoxIcons.bx_home, color: Controller.currentIndex==0?Colors.black : AppColors.iconColor ),
             Icon(BoxIcons.bx_message, color: Controller.currentIndex==1?Colors.black:AppColors.iconColor),
              Icon(Icons.add_circle_outline_rounded, color:Controller.currentIndex==2? Colors.black:AppColors.iconColor),
             Icon(EvaIcons.bell_outline, color: Controller.currentIndex==3?Colors.black:AppColors.iconColor),
             Icon(BoxIcons.bx_user, color: Controller.currentIndex==4? Colors.black:AppColors.iconColor),
            
          ]),
        
      );
      })
    )
    );
  }
}