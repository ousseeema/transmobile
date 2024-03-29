// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/searchController.dart';
import 'package:transmobile/view/components/Datepicker.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/components/autoplaces.dart';
import 'package:transmobile/view/components/switcher.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  TextEditingController googlecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: GetBuilder<searchController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Dimenssions.height20,
                ),
                Row(
                  children: [
                    // search title
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.mainTextColor,
                        size: Dimenssions.icon24,
                      ),
                    ),
                    SizedBox(
                        width: Dimenssions.width / 2 - Dimenssions.width30 * 2),
                    CostumeAnimatedText(
                      text: "Search",
                      color: AppColors.mainTextColor,
                      fontSize: Dimenssions.font20,
                      weight: FontWeight.bold,
                    )
                  ],
                ),
                SizedBox(
                  height: Dimenssions.height20 * 4,
                ),
                // search input for the current country
                autoPlaces(
                    icon: const Icon(
                      BoxIcons.bx_world,
                      color: AppColors.iconColor,
                    ),
                    hintText: "Current Country",
                    labelText: "Country A"),
                SizedBox(
                  height: Dimenssions.height20 * 2,
                ),
                // date picker
                DatePicker(context: context),
                SizedBox(
                  height: Dimenssions.height20 * 2,
                ),
                // search input for destination country
                autoPlaces(
                    icon: const Icon(
                      BoxIcons.bx_world,
                      color: AppColors.iconColor,
                    ),
                    hintText: "Destination Country",
                    labelText: "Country B"),
                SizedBox(
                  height: Dimenssions.height20 * 2,
                ),
                // costume home pickup switcher
                Padding(
                  padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                  child: CostumeSwitcher(
                   
                      icon: CupertinoIcons.car,
                      text: "Home pickup :     ",
                      variable: "Pickup"),
                ),
            
                // costume home delivery  switcher
                Padding(
                  padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                  child: CostumeSwitcher(
                      icon: CupertinoIcons.car,
                      text: "Home delivery :  ",
                      variable: "delivery"),
                ),
            
                // costume parcles  switcher
                Padding(
                  padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                  child: CostumeSwitcher(
                      icon: CupertinoIcons.cube_box_fill,
                      text: "Receive parcels : ",
                      variable: "parcles"),
                ),
                // price per kg 
                Row(
                        children: [
                          SizedBox(
                            width: Dimenssions.width10 / 2 + 1,
                          ),
                          Icon(
                            CupertinoIcons.money_euro_circle,
                            size: Dimenssions.icon16 * 2,
                            color: AppColors.iconColor,
                          ),
                          SizedBox(
                            width: Dimenssions.width20,
                          ),
                         const  Text(
                            "Cost of KG :",
                            style: TextStyle(
                              color: AppColors.mainTextColor,
                            ),
                          ),
                          SizedBox(width: Dimenssions.width30*2.6,),
                          
                          SizedBox(
                            height: Dimenssions.height20 * 4,
                            width: Dimenssions.width30 * 5,
                            child: TextFormField(
                             
                             keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "100 Euro ",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400]),
                                      
                                  
                                   
                                  iconColor: AppColors.iconColor,
                                  enabledBorder: OutlineInputBorder(
    
                                    borderSide: const BorderSide(
                                        color: AppColors.bigTextColor),
                                    borderRadius: BorderRadius.circular(
                                        Dimenssions.radius20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.bigTextColor),
                                      borderRadius: BorderRadius.circular(
                                          Dimenssions.radius20))),
                              onChanged: (value) {
                                controller.coastkg =double.parse(value);
                                
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimenssions.height20*4,),
                      GestureDetector(
                onTap: () {
                  // verification input then go to  next page
                  
    
                  
                 
                  },
                child: Container(
                  height: Dimenssions.height10 * 5,
                  width: Dimenssions.width30 * 9,
                  decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius:
                          BorderRadius.circular(Dimenssions.radius10)),
                  child: const Center(
                    child: Text(
                      "Search",
                      style: TextStyle(color: AppColors.insidetextcolor),
                    ),
                  ),
                ),
              )



              ],
            ),
          );
        },
      )),
    );
  }
}
