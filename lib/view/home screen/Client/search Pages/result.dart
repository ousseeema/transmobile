import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/controller/homeScreen/Client/homeController.dart';
import 'package:transmobile/controller/homeScreen/Client/resultController.dart';
import 'package:transmobile/controller/homeScreen/Client/searchController.dart';
import 'package:transmobile/view/components/CoostumTransContainer.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      
     
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Dimenssions.height20,),
            Row(
              children: [
                SizedBox(width: Dimenssions.width20,),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back_rounded, color: AppColors.iconColor,)),
                  SizedBox(width: Dimenssions.width30,),
                CostumeAnimatedText(text: "Search Result",weight: FontWeight.bold,fontSize: Dimenssions.font20,),
              ],
            ),
            GetBuilder<ResultController>(builder: (controller) {
            return SizedBox(
              height: Dimenssions.height- Dimenssions.height20*4,
              width: Dimenssions.width,
              child: ListWheelScrollView.useDelegate(
                itemExtent: Dimenssions.height20 * 10,
                controller: FixedExtentScrollController(initialItem: 1),
                physics: FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                      childCount: controller.tripsafterFilter.length,
                  builder: (context, index){
                    return  GestureDetector(
                     onTap:(){
                      // select the trip that we will be interested in  on the next page
                      Get.find<DetailsResult>().selectedtrip(controller.tripsafterFilter[index]);
                      
                     },
                      child: CostumTransContainer(
                          id: controller.tripsafterFilter[index].id, 
                          TransName: controller.tripsafterFilter[index].transporter.fullName,
                          imagename: controller.tripsafterFilter[index].transporter.profilePicture,
                          depart: controller.tripsafterFilter[index].citys[0].city,
                          dateDepart: controller.tripsafterFilter[index].citys[0].dateofpassage,
                          Destination: controller.tripsafterFilter[index]
                          .citys[controller.tripsafterFilter[index].citys.length-1].city,
                          destinationDate: controller
                          .tripsafterFilter[index]
                          .citys[controller.tripsafterFilter[index].citys.length-1]
                          .dateofpassage,
                          parcels: controller.tripsafterFilter[index].transporter.parsols,
                      price: controller.tripsafterFilter[index].transporter.priceKg),
                         
                    );
                  },
               
            )));
                  }),
          ],
        )),
    );
  }
}
