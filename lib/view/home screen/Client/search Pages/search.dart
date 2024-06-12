// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/searchController.dart';
import 'package:transmobile/view/Client%20components/Datepicker.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Client%20components/autoplaces.dart';
import 'package:transmobile/view/Client%20components/switcher.dart';
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
          return controller.isLoading? const Center(child:  CircularProgressIndicator()):SingleChildScrollView(
            child: Column(
           
              children: [
                SizedBox(
                  height: Dimenssions.height20,
                ),
                Row(
                  children: [
                    // search title
                  
                    SizedBox(
                        width: Dimenssions.width / 2 - Dimenssions.width30 ),
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
            /*    autoPlaces(
                    icon: const Icon(
                      BoxIcons.bx_world,
                      color: AppColors.iconColor,
                    ),
                    hintText: "Destination Country",
                    labelText: "Country B"),*/
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
                      icon: BoxIcons.bx_box,
                      text: "Receive parcels : ",
                      variable: "parcles"),
                ),
            
                // price per kg 
                Row(
                        children: [
                          SizedBox(
                            width: Dimenssions.width30 -5 ,
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
                      SizedBox(height: Dimenssions.height20,),
                      GestureDetector(
                onTap: () {
                  // verification input then go to  next page
                   controller.SearchForTrip();
    
                  
                 
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
              ),
              SizedBox(height: Dimenssions.height20*3,)



              ],
            ),
          );
        },
      )),
    );
  }
}
