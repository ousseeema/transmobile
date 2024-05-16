import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:transmobile/controller/homeScreen/Client/homeController.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransHomeController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Client%20components/button.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class UpdateTripScreen extends StatefulWidget {
  const UpdateTripScreen({super.key});

  @override
  State<UpdateTripScreen> createState() => _UpdateTripScreenState();
}

class _UpdateTripScreenState extends State<UpdateTripScreen> {
  @override
  Widget build(BuildContext context) {
    bool isPast = false;
    return Scaffold(
        body: GetBuilder<transHomeController>(builder: (controller) {
      return SafeArea(
        child: controller.isloading? const Center(
          child: CircularProgressIndicator(),
        ): SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Dimenssions.height20,
              ),
              CostumeAnimatedText(text: "Update your trip", fontSize: Dimenssions.font20-3,weight: FontWeight.bold,),
              SizedBox(
                height: Dimenssions.height20,
              ),
              SizedBox(
                height: Dimenssions.height20 * 30,
                child: ListView.builder(
                    itemCount: controller.Trip!.citys.length,
                    itemBuilder: (_, index) {
                      if (controller.Trip!.citys[index].done) {
                        isPast = true;
                      } else {
                        isPast = false;
                      }
                      return TimelineTile(
                        isFirst: index == 0 ? true : false,
                        isLast: index == controller.Trip!.citys.length - 1
                            ? true
                            : false,
                        beforeLineStyle: LineStyle(
                            color: isPast
                                ? AppColors.buttonColor
                                : AppColors.buttonColor.withOpacity(0.4)),
                        indicatorStyle: IndicatorStyle(
                          drawGap: true,
                          // size of the indicator
                          width: Dimenssions.width30,
                          color: isPast
                              ? AppColors.buttonColor
                              : AppColors.buttonColor.withOpacity(0.4),
                          iconStyle: IconStyle(
                              iconData: Icons.done, color: Colors.white),
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.all(8.0),
                          //container that contains the city and the remove and done containers
                          child: Container(
                              height: Dimenssions.height20 * 5,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimenssions.radius20),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CostumeAnimatedText(
                                      text: controller.Trip!.citys[index].city),
                                  SizedBox(
                                    height: Dimenssions.height20,
                                  ),
                                  //! if the transporteur has passed the city then display youhave passed
                                  //!this city in the place of remove and done containers
                                  isPast
                                      ? Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimenssions.radius10 / 2),
                                              color: AppColors.buttonColor),
                                          height: Dimenssions.height20 * 2,
                                          width: Dimenssions.width30 * 6,
                                          child: Center(
                                              child: CostumeAnimatedText(
                                            text: "You've passed this city",
                                            color: AppColors.insidetextcolor,
                                          )),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            //done container
                                            GestureDetector(
                                              onTap: () {
                                                // update the trip by do done to  specific city
                                                controller.DoneCity(index);
                                              },
                                              child: Container(
                                                height:
                                                    Dimenssions.height20 * 2,
                                                width: Dimenssions.width30 * 3,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimenssions
                                                                    .radius10 /
                                                                2),
                                                    color: Colors.blue),
                                                child: const Center(
                                                  child: Text(
                                                    "Done",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .insidetextcolor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: Dimenssions.width30,
                                            ),
                                            // remove container
                                            GestureDetector(
                                              onTap: () {
                                                // update the trip by removing specific city
                                                controller.DeleteCity(index);
                                              },
                                              child: Container(
                                                height:
                                                    Dimenssions.height20 * 2,
                                                width: Dimenssions.width30 * 3,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimenssions
                                                                    .radius10 /
                                                                2),
                                                    color: Colors.red[200]),
                                                child: const Center(
                                                  child: Text(
                                                    "Remove",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .insidetextcolor),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                ],
                              )),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),
              // city input box
              SizedBox(
                height: Dimenssions.height20 * 4,
                width: Dimenssions.width - Dimenssions.width20,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Djerba Tunisie",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      labelText: "New city",
                      labelStyle:
                          const TextStyle(color: AppColors.bigTextColor),
                      icon: Icon(
                        Icons.location_on,
                        size: Dimenssions.icon16 * 2,
                      ),
                      iconColor: AppColors.iconColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.bigTextColor),
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius20),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.bigTextColor),
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius20))),
                  onChanged: (value) {
                    controller.newCity = value;
                  },
                ),
              ),
              SizedBox(height: Dimenssions.height20,),
              // postion input box
              SizedBox(
                height: Dimenssions.height20 * 4,
                width: Dimenssions.width - Dimenssions.width20,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Postion",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      labelText: "City Postion",
                      
                      labelStyle:
                          const TextStyle(color: AppColors.bigTextColor),
                      icon: Icon(
                        Icons.location_on,
                        size: Dimenssions.icon16 * 2,
                      ),
                      iconColor: AppColors.iconColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.bigTextColor),
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius20),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.bigTextColor),
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius20))),
                  onChanged: (value) {
                    controller.newCity = value;
                  },
                ),
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),
              //update button
              GestureDetector(
                onTap: () => controller.updateTrip(),
                child: CostumeButton(
                    height: Dimenssions.height10 * 5,
                    width: Dimenssions.width30 * 9,
                    text: "Update Trip"),
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),
              //delete button
              GestureDetector(
                onTap: () => controller.DeleteTrip(),
                child: CostumeButton(
                    height: Dimenssions.height10 * 5,
                    width: Dimenssions.width30 * 9,
                    text: "Delete Trip"),
              ),
              SizedBox(
                height: Dimenssions.height20*3,
              ),
            ],
          ),
        ),
      );
    }));
  }
}
