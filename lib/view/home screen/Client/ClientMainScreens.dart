// ignore_for_file: non_constant_identifier_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

import '../../../controller/homeScreen/Client/ClientMainScreensController.dart';

class ClientMainScreens extends StatefulWidget {
  const ClientMainScreens({super.key});

  @override
  State<ClientMainScreens> createState() => _ClientMainScreensState();
}

class _ClientMainScreensState extends State<ClientMainScreens> {
  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: GetBuilder<ClientMainScreensController>(builder: (Controller){
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
              Icon(BoxIcons.bx_search, color:Controller.currentIndex==2? Colors.black:AppColors.iconColor),
             Icon(BoxIcons.bx_user, color: Controller.currentIndex==4? Colors.black:AppColors.iconColor),
            
          ]),
        
      );
      })
    );
  }
}