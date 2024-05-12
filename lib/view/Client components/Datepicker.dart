// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/searchController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class DatePicker extends StatefulWidget {
  BuildContext context;

   DatePicker({super.key,required this.context});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
    DateTime initDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    
  return GetBuilder<searchController>(builder: (controller){
    return GestureDetector(
          onTap: () {
            showCupertinoModalPopup(
              context: context, 
              builder: ((BuildContext context) {
                return SizedBox(
                  height: Dimenssions.height20*12,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    //minimumDate: DateTime.now(),
                    initialDateTime: initDate,
                    onDateTimeChanged: (value) {
                     
                       controller.dateController.text=value.toString().substring(0,11);
 
                    
                    },
                    
                    ),

                );
              }));
          },
      child: Container(
        height: Dimenssions.height20*3,
        width: 
        Dimenssions.width-Dimenssions.width20*3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimenssions.radius20),
          border: Border.all(color: Colors.black,
          width: 1,

          ),

        ),
        child: Row(
          children: [
            SizedBox(width: Dimenssions.width10,),
            const Icon(Icons.date_range_outlined, color: AppColors.iconColor,),
            SizedBox(width: Dimenssions.width20-3,),
            Text("Pick up   date :       ${controller.dateController.text}", 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: Dimenssions.font20-4, 
            
            ),
            
            ),
          ],
        ),


        
      
      ),
    );
 
  }) ;
  }
}