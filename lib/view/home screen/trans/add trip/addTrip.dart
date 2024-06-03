// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/transporteur/AddTripController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});

  @override
  State<AddTripScreen> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AddTripController>(
          builder: (Tripcontroller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Dimenssions.height20,
                  ),
                  CostumeAnimatedText(text: "Add trip screen"),
                  SizedBox(
                    height: Dimenssions.height20,
                  ),
                  SizedBox(
                    height: Dimenssions.height - Dimenssions.height20 * 14,
                    width: Dimenssions.width,
                    child: ListView.builder(
                        itemCount: Tripcontroller.TextControllers.length,
                        itemBuilder: (_, index) {
                          return Slidable(
                            endActionPane: ActionPane(motion: const BehindMotion(), 
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(Dimenssions.radius10),
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                                label: "Delete",
                                
                                onPressed:(context){
                                  Tripcontroller.deleteInputfield(index);
              
                                } )
              
                            ]),
                            child: Container(
                              margin: EdgeInsets.all(Dimenssions.LRpadmarg10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimenssions.radius10),
                                  color: Colors.grey[200]),
                              height: Dimenssions.height20 * 10,
                              width: Dimenssions.width,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Dimenssions.height20,
                                  ),
                                  //! inout city textfield
                                  SizedBox(
                                    height: Dimenssions.height20 * 4,
                                    width:
                                        Dimenssions.width - Dimenssions.width20 * 2,
                                    child: TextField(
                                      
                                      decoration: InputDecoration(
                                          hintText: "Lyon,France",
                                          hintStyle:
                                              TextStyle(color: Colors.grey[400]),
                                          labelText: "City ${index + 1}",
                                          labelStyle: const TextStyle(
                                              color: AppColors.bigTextColor),
                                          icon: Icon(
                                            Icons.location_on,
                                            size: Dimenssions.icon16 * 2,
                                          ),
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
                                                     Tripcontroller.TextControllers[index][0]=value;
                                                  },
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimenssions.height20,
                                  ),
                            
                                  // date picker for the City
                                  GestureDetector(
                                    onTap: () {
                                      showCupertinoModalPopup(
                                          context: context,
                                          builder: ((BuildContext context) {
                                            return SizedBox(
                                              height: Dimenssions.height20 * 12,
                                              child: CupertinoDatePicker(
                                                
                                                mode: CupertinoDatePickerMode.date,
                                                minimumDate: DateTime.now(),
                                                onDateTimeChanged: (value) {
                                                 Tripcontroller.PickDate(index, value);
                                                },
                                              ),
                                            );
                                          }));
                                    },
                                    child: Container(
                                      height: Dimenssions.height20 * 3,
                                      width: Dimenssions.width -
                                          Dimenssions.width20 * 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimenssions.radius20),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: Dimenssions.width10,
                                          ),
                                          const Icon(
                                            Icons.date_range_outlined,
                                            color: AppColors.iconColor,
                                          ),
                                          SizedBox(
                                            width: Dimenssions.width20 - 3,
                                          ),
                                          Text(
                                            " When to pass :       ${Tripcontroller.TextControllers[index][1]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Dimenssions.font20 - 4,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  
                  // switcher for the home delivery and the home pick up 
                  Row(
                    children: [ 
                      // home delivery switcher 
                    SizedBox(width: Dimenssions.width10,),
                          const Text(
                            "Home delivery :",
                            style: TextStyle(
                              color: AppColors.mainTextColor,
                            ),
                          ),
                        SizedBox(width: Dimenssions.width10,),
                          Switch(
                              activeColor: AppColors.buttonColor,
                              value: Tripcontroller.home_delivery,
                              onChanged: (value) {
                               Tripcontroller.home_deliverychange(value);
                              }),
                      // home pick up switcher 
                       SizedBox(
                            width: Dimenssions.width20,
                          ),
                         
                          const Text(
                            "Home pick up :",
                            style: TextStyle(
                              color: AppColors.mainTextColor,
                            ),
                          ),
                          SizedBox(width: Dimenssions.width10,),
                          
                          Switch(
                              activeColor: AppColors.buttonColor,
                              value: Tripcontroller.home_pick_up,
                              onChanged: (value) {
                               Tripcontroller.home_pickupchange(value);
                              }),
                      




                    ],
                  ),
                  SizedBox(height: Dimenssions.height20,) ,
                  //! add button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // adding input field when they tap +
                          Tripcontroller.addInputfield();
                        },
                        child: Container(
                          height: Dimenssions.height20 * 3,
                          width: Dimenssions.height20 * 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.buttonColor),
                          child: const Align(
                              alignment: Alignment.center, child: Icon(Icons.add, color: Colors.white,)),
                        ),
                      ),
                      
                         GestureDetector(
                        onTap: () {
                          // adding input field when they tap +
                          Tripcontroller.addTrip();
                        },
                        child: Container(
                          height: Dimenssions.height20 * 3,
                          width: Dimenssions.height20 * 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green),
                          child: const Align(
                              alignment: Alignment.center, child: Icon(Icons.done_rounded, color: Colors.white,)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
