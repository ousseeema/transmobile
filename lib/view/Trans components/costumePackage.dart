// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class CostumePackageList extends StatefulWidget {
  List<dynamic> packageList;
  double heightscreen;
  CostumePackageList({super.key, required this.packageList, required this.heightscreen});

  @override
  State<CostumePackageList> createState() => _CostumePackageListState();
}

class _CostumePackageListState extends State<CostumePackageList> {
  bool isPast = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.heightscreen,
      width: Dimenssions.width,
      child: ListView.builder(
          itemCount: widget.packageList.length,
          itemBuilder: (_, index) {
            Map<String, dynamic> package = widget.packageList[index];

            Map<String, dynamic> message = package["message"];
            return Container(
              margin: EdgeInsets.all(Dimenssions.LRpadmarg10),
              height: Dimenssions.height20 * 7,
              width: Dimenssions.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimenssions.radius20),
                  color: widget.heightscreen== Dimenssions.height? AppColors.buttonColor: Colors.grey[300]),
              child: Row(
                children: [
                  SizedBox(
                    width: Dimenssions.width20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimenssions.radius20),
                    // Adjust the radius to match the container's borderRadius
                    child: Image.network(
                      "${AppConstant.Packagesimage}${message["packagephoto"]}",
                      fit: BoxFit.cover,
                      height: Dimenssions.height20 * 5,
                      width: Dimenssions.width30 * 2,
                    ),
                  ),
                  SizedBox(
                    width: Dimenssions.width20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CostumeAnimatedText(
                          text:
                              "Sender number:${message["phoneNumberof_the_sender"]}"),
                      SizedBox(
                        height: Dimenssions.height10 / 2,
                      ),
                      CostumeAnimatedText(
                          text:
                              "Reciver number:${message["phoneNumberof_the_receiver"]}"),
                      SizedBox(
                        height: Dimenssions.height10 / 2,
                      ),
                      CostumeAnimatedText(
                          text: "From:${message["Pickupaddress"]}"),
                      SizedBox(
                        height: Dimenssions.height10 / 2,
                      ),
                      CostumeAnimatedText(
                          text: "To:${message["receivedAdress"]}"),
                      SizedBox(
                        height: Dimenssions.height10 / 2,
                      ),
                      CostumeAnimatedText(
                          text: "Weight:${message["numberofkg"]} Kg"),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
