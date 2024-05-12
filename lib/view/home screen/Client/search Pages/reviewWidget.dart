import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/view/Client%20components/CostumeReviewContainer.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(child: GetBuilder<DetailsResult>(
      builder: (controller) {
        return ListView.builder(
            itemCount: controller.SelectedTrip!.transporter.comments.length,
            itemBuilder: (_, index) {
              return Padding(
                padding:  EdgeInsets.only(top: Dimenssions.TBpadmarg10, left: Dimenssions.TBpadmarg10, right: Dimenssions.TBpadmarg10),
                child: CostumeReviewContainer(
                    username: controller
                        .SelectedTrip!.transporter.comments[index].user.fullName!,
                    createdAt: controller
                        .SelectedTrip!.transporter.comments[index].createdAt,
                    rating: controller
                        .SelectedTrip!.transporter.comments[index].rating,
                    Comment: controller
                        .SelectedTrip!.transporter.comments[index].comment,
                    imageUrl: controller.SelectedTrip!.transporter.comments[index]
                        .user.profilePicture!),
              );
            });
      },
    ));
  }
}
