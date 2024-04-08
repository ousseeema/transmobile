import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/view/components/CostumeReviewContainer.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: GetBuilder<DetailsResult>(builder: (controller) {
        return ListView.builder(
        itemCount: controller.SelectedTrip!.transporter.comments.length,
        itemBuilder: (_, index){
          return const CostumeReviewContainer();

        });
      },)
    );
  }
}