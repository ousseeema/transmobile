// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Trans%20components/costumePackage.dart';
import 'package:transmobile/view/Trans%20components/costumetripList.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TripHistoryDetails extends StatefulWidget {
  TripModel Trip;
  TripHistoryDetails({super.key, required this.Trip});

  @override
  State<TripHistoryDetails> createState() => _TripHistoryDetailsState();
}

class _TripHistoryDetailsState extends State<TripHistoryDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          // for the firstt ligne of the trip details(date and total package )
          Row(
            children: [
              SizedBox(
                width: Dimenssions.width10,
              ),
              // date container
              Container(
                width: Dimenssions.width / 2 - Dimenssions.width20,
                padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimenssions.radius10),
                    color: AppColors.buttonColor),
                child: Row(
                  children: [
                    const Icon(Icons.date_range_rounded,
                        color: AppColors.insidetextcolor),
                    CostumeAnimatedText(
                        text:
                            "Date : ${widget.Trip.createdAt.substring(0, 10)}"),
                  ],
                ),
              ),
              SizedBox(
                width: Dimenssions.width10,
              ),
              //total package container
              Container(
                  width: Dimenssions.width / 2 - Dimenssions.width20,
                  padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimenssions.radius10),
                      color: AppColors.buttonColor),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.card_giftcard_rounded,
                        color: AppColors.insidetextcolor,
                      ),
                      CostumeAnimatedText(
                          text:
                              "Total Package : ${widget.Trip.packages.length + widget.Trip.self_packages.length}"),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: Dimenssions.height20,
          ),
          // for the second ligne of the trip details (home pickup /delivery )
          Row(
            children: [
              SizedBox(
                width: Dimenssions.width10,
              ),
              // home delivery  container
              Container(
                width: Dimenssions.width / 2 - Dimenssions.width20,
                padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimenssions.radius10),
                    color: AppColors.buttonColor),
                child: Row(
                  children: [
                    const Icon(BoxIcons.bx_car,
                        color: AppColors.insidetextcolor),
                    CostumeAnimatedText(
                        text:
                            "Home Delivery:${widget.Trip.homeDelivery.toString()}"),
                  ],
                ),
              ),
              SizedBox(
                width: Dimenssions.width10,
              ),
              //homepickup  container
              Container(
                  width: Dimenssions.width / 2 - Dimenssions.width20,
                  padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimenssions.radius10),
                      color: AppColors.buttonColor),
                  child: Row(
                    children: [
                      const Icon(Icons.date_range_rounded,
                          color: AppColors.insidetextcolor),
                      CostumeAnimatedText(
                          text:
                              "Home PickUp: ${widget.Trip.homeDelivery.toString()}"),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: Dimenssions.height20,
          ),
          // for the third ligne of the details(extranl , internal package )
          Row(
            children: [
              SizedBox(
                width: Dimenssions.width10,
              ),
              // internal package  container
              Container(
                width: Dimenssions.width / 2 - Dimenssions.width20,
                padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimenssions.radius10),
                    color: AppColors.buttonColor),
                child: Row(
                  children: [
                    const Icon(
                      BoxIcons.bx_box,
                color: AppColors.insidetextcolor
                    ),
                    CostumeAnimatedText(
                        text: "Internal Pack: ${widget.Trip.packages.length}"),
                  ],
                ),
              ),
              SizedBox(
                width: Dimenssions.width10,
              ),
              //external package  container
              Container(
                  width: Dimenssions.width / 2 - Dimenssions.width20,
                  padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimenssions.radius10),
                      color: AppColors.buttonColor),
                  child: Row(
                    children: [
                      const Icon(
                        BoxIcons.bx_box,
                        color: AppColors.insidetextcolor
                      ),
                      CostumeAnimatedText(
                          text:
                              "External Pack: ${widget.Trip.self_packages.length}"),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: Dimenssions.height20,
          ),
          TabBar(
              indicatorColor: Colors.black,
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: AppColors.mainTextColor,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.reviews_outlined,
                        color: AppColors.iconColor,
                      ),
                      SizedBox(width: Dimenssions.width30,),
                      CostumeAnimatedText(text: "Trip Tab")
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppColors.iconColor,
                      ),
                      SizedBox(width: Dimenssions.width30,),
                      CostumeAnimatedText(text: "Package Tab")
                    ],
                  ),
                ),
                
              ]),
          // les tab de trip and package

          SizedBox(
            height: Dimenssions.height10,
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
                // trip costume list
              CostumeTripList(
                Citys: widget.Trip.citys,
              ),
              // costume package list
              CostumePackageList(packageList: widget.Trip.packages, heightscreen: Dimenssions.height,),
            
            ]),
          )
        ],
      )),
    );
  }
}
