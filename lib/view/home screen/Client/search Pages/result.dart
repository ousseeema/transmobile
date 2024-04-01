import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/searchController.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<searchController>(builder: (controller){
        return SizedBox(
        height: Dimenssions.height,
        width: Dimenssions.width,
        child: ListView.builder(
          itemCount: controller.trips.length,
          itemBuilder: (_, index){
           

        }),
      );

      }));
  }
}