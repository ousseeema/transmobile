// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/view/home%20screen/trans/settings%20Pages/TripHistoryDetails.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class HistoryTripContainer extends StatefulWidget {
  TripModel Trip;
  HistoryTripContainer({super.key, required this.Trip});

  @override
  State<HistoryTripContainer> createState() => _HistoryTripContainerState();
}

class _HistoryTripContainerState extends State<HistoryTripContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> TripHistoryDetails(Trip:widget.Trip ));
      },
      child: Container(
        margin: EdgeInsets.all(Dimenssions.LRpadmarg10),
        height: Dimenssions.height20 * 4,
        width: Dimenssions.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 8), // changes position of shadow
              ),
            ],
            color: Colors.grey,
            borderRadius: BorderRadius.circular(Dimenssions.radius10)),
        child: Row(
          children: [
            const Icon(
              Icons.date_range_rounded,
              color: AppColors.iconColor,
            ),
            Text(
              " ${widget.Trip.createdAt.substring(0, 10)}    ",
              style: const TextStyle(color: AppColors.insidetextcolor),
            ),
            const Icon(
              BoxIcons.bx_trip,
              color: AppColors.iconColor,
            ),
            Text(
                "  ${widget.Trip.citys[0].city} To ${widget.Trip.citys[widget.Trip.citys.length - 1].city} ",
                style: const TextStyle(color: AppColors.insidetextcolor)),
          ],
        ),
      ),
    );
  }
}
