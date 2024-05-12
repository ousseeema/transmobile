import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/searchController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

// ignore: must_be_immutable
class CostumeSwitcher extends StatefulWidget {
  String text;
  IconData icon ;
  String variable;
  
   CostumeSwitcher({super.key, required this.icon, required this.text, required this.variable});

  @override
  State<CostumeSwitcher> createState() => _CostumeSwitcherState();
}

class _CostumeSwitcherState extends State<CostumeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<searchController>(builder: (controller){
      return  Row(
                        children: [
                          SizedBox(
                            width: Dimenssions.width10 / 2 + 1,
                          ),
                          Icon(
                            widget.icon,
                            size: Dimenssions.icon16 * 2,
                            color: AppColors.iconColor,
                          ),
                          SizedBox(
                            width: Dimenssions.width20,
                          ),
                           Text(
                            widget.text,
                            style: const TextStyle(
                              color: AppColors.mainTextColor,
                            ),
                          ),
                          SizedBox(
                            width: Dimenssions.width30 * 1.7,
                          ),
                          Switch(
                              activeColor: AppColors.buttonColor,
                              value: widget.variable== "Pickup"? controller.home_pickup: widget.variable== "delivery"? controller.home_delivery: controller.parcels
                              ,
                              onChanged: (value) {
                                controller.change_value(value,widget.variable);
                              
                              }
                              
                              
                              ),
                        ],
                      ) ;
 

    }); }
}