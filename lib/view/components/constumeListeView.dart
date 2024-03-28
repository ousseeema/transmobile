// ignore_for_file: must_be_immutable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class CostumeListView extends StatelessWidget {
  TripModel trip;
  int index;
  CostumeListView({super.key, required this.trip, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isPast = false;
    return SizedBox(
        height: Dimenssions.height,
        width: Dimenssions.width,
        child: Column(
          children: [
            SizedBox(
              height: Dimenssions.height20 * 2,
            ),
            SizedBox(
              height: Dimenssions.height20 * 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 9,
                    child: Center(
                      child: CostumeAnimatedText(
                        text: "Trip Number  : ${index + 1}",
                        color: AppColors.mainTextColor,
                        fontSize: Dimenssions.font20,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.double_arrow_rounded,
                        color: AppColors.iconColor,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: Dimenssions.height - Dimenssions.height20 * 7.5,
              child: ListView.builder(
                  itemCount: trip.citys.length,
                  itemBuilder: (_, index) {
                    if (trip.citys[index].done) {
                      isPast = true;
                    } else {
                      isPast = false;
                    }
                    return TimelineTile(
                      isFirst: index == 0 ? true : false,
                      isLast: index == trip.citys.length - 1 ? true : false,
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
                        child: Container(
                          height: Dimenssions.height20 * 8,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius20),
                              color: isPast
                                  ? AppColors.buttonColor
                                  : AppColors.buttonColor.withOpacity(0.2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: Dimenssions.height20,
                                  ),
                                  CostumeAnimatedText(
                                    text:
                                        "Destination : ${trip.citys[index].city}",
                                    color: AppColors.mainTextColor,
                                    textDecoration: isPast
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.underline,
                                    fontSize: Dimenssions.font20,
                                    weight: FontWeight.bold,
                                  ),
                                  CostumeAnimatedText(
                                    text:
                                        "Visit Date : ${trip.citys[index].dateofpassage.toString().substring(0, 11)}",
                                    fontSize: Dimenssions.font20 - 5,
                                    weight: FontWeight.normal,
                                    color: AppColors.mainTextColor,
                                    textDecoration: isPast
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.solid,
                                  ),
                                  CostumeAnimatedText(
                                    text: isPast
                                        ? "Your Transporter has \n already passed  this city \n to the next destination"
                                        : "Be ready your Transporter \n     is almost here for you ",
                                    fontSize: Dimenssions.font20 - 5,
                                    weight: FontWeight.normal,
                                    color: isPast ? Colors.white : Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: Dimenssions.width20 * 2,
                              ),
                              Icon(
                                isPast
                                    ? Iconsax.location_slash_bold
                                    : Iconsax.location_bold,
                                size: Dimenssions.icon24,
                                color:
                                    isPast ? Colors.white : AppColors.iconColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: Dimenssions.height20,
            ),
          ],
        ));
  }
}
