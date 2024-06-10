import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/homeScreen/Client/resultController.dart';
import 'package:transmobile/view/Client%20components/CoostumTransContainer.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
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
                  child: const Icon(Icons.arrow_back_rounded, )),
                  SizedBox(width: Dimenssions.width30*3.5,),
                CostumeAnimatedText(text: "Search Result",weight: FontWeight.bold,fontSize: Dimenssions.font20,),
              ],
            ),
            GetBuilder<ResultController>(builder: (controller) {
            return  controller.tripsafterFilter.isEmpty?  LottieBuilder.asset("assets/animations/nodatafound.json"):
             SizedBox(
              height: Dimenssions.height- Dimenssions.height20*4,
              width: Dimenssions.width,
              child: ListWheelScrollView.useDelegate(
                itemExtent: Dimenssions.height20 * 10,
                controller: FixedExtentScrollController(initialItem: 1),
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                      childCount: controller.tripsafterFilter.length,
                  builder: (context, index){
                    return  CostumTransContainer(
                      index : index,
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
                    price: controller.tripsafterFilter[index].transporter.priceKg);
                  },
               
            )));
                  }),
          ],
        )),
    );
  }
}
