import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/homeController.dart';
import 'package:transmobile/controller/homeScreen/Client/resultController.dart';
import 'package:transmobile/controller/homeScreen/Client/searchController.dart';
import 'package:transmobile/view/components/CoostumTransContainer.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ResultController>(builder: (controller) {
        return SizedBox(
          height: Dimenssions.height,
          width: Dimenssions.width,
          child: ListView.builder(
              itemCount:controller.tripsafterFilter.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
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
              }),
        );
      })),
    );
  }
}
