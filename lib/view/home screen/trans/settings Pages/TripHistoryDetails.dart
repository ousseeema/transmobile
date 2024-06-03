import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TripHistoryDetails extends StatelessWidget {
  TripModel Trip;
   TripHistoryDetails({super.key, required this.Trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: Dimenssions.height20,
          ),
          Text(
            " Trip Details",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: Dimenssions.font20),
          ),
          SizedBox(
            height: Dimenssions.height20,
          ),
        ],
      )),
    );
  }
}
