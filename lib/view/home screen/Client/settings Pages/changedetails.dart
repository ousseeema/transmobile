import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class ChangeDetails extends StatelessWidget {
  var variable;
   ChangeDetails({super.key , required this.variable});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: GetBuilder<SettingController>(builder: (controller){
        return  Center(
        child: SizedBox(
                height: Dimenssions.height20 * 4,
                width: Dimenssions.width - Dimenssions.width20,
                child: TextField(
                  
                  decoration: InputDecoration(
                      hintText: "23 Rue de Grenell,75700 PARIS CEDEX,FRANCE ",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      labelText: "Full address",
                      labelStyle:
                          const TextStyle(color: AppColors.bigTextColor),
                      icon: Icon(
                        Icons.location_on,
                        size: Dimenssions.icon16 * 2,
                      ),
                      iconColor: AppColors.iconColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.bigTextColor),
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius20),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.bigTextColor),
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius20))),
                  onChanged: (value) {
                  
                  },
                ),
              ),
      );
    
      },))
    ;
  }
}