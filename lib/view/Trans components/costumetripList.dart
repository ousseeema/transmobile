// ignore_for_file: must_be_immutable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class CostumeTripList extends StatefulWidget {
  List<City> Citys ;
   CostumeTripList({super.key, required this.Citys});

  @override
  State<CostumeTripList> createState() => _CostumeTripListState();
}

class _CostumeTripListState extends State<CostumeTripList> {
  bool isPast = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ListView.builder(
            itemCount: widget.Citys.length,
            itemBuilder: (_, index) {
              if (widget.Citys[index].done) {
                isPast = true;
              } else {
                isPast = false;
              }
              return Padding(
                padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20,
                    right: Dimenssions.LRpadmarg20),
                child: TimelineTile(
                  isFirst: index == 0 ? true : false,
                  isLast: index == widget.Citys.length - 1
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
                    iconStyle:
                        IconStyle(iconData: Icons.done, color: Colors.white),
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: Dimenssions.height20 * 5,
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
                              AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                ColorizeAnimatedText(
                                    "Destination : ${widget.Citys[index].city}",
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimenssions.font20 - 5,
                                      color: AppColors.mainTextColor,
                                      decoration: isPast
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                    ),
                                    colors: [
                                      Colors.purple,
                                      Colors.blue,
                                      Colors.yellow,
                                      Colors.red,
                                    ])
                              ]),
                              
                              AnimatedTextKit(animatedTexts: [
                                ColorizeAnimatedText(
                                    "Visit Date : ${widget.Citys[index].dateofpassage.toString().substring(0, 11)}",
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimenssions.font20 - 5,
                                      color: AppColors.mainTextColor,
                                      decoration: isPast
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                    ),
                                    colors: [
                                      Colors.purple,
                                      Colors.blue,
                                      Colors.yellow,
                                      Colors.red,
                                    ])
                              ]),
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
                            color: isPast ? Colors.white : AppColors.iconColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ) ;
  }
}