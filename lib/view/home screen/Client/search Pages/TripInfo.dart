import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TripInfo extends StatefulWidget {
  const TripInfo({super.key});

  @override
  State<TripInfo> createState() => _TripInfoState();
}

class _TripInfoState extends State<TripInfo> {
      bool isPast = false;

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<DetailsResult>(builder: (controller){
      return SizedBox(
       child: ListView.builder(
                  itemCount: controller.SelectedTrip!.citys.length,
                  itemBuilder: (_, index) {
                    if (controller.SelectedTrip!.citys[index].done) {
                      isPast = true;
                    } else {
                      isPast = false;
                    }
                    return TimelineTile(
                      isFirst: index == 0 ? true : false,
                      isLast: index == controller.SelectedTrip!.citys.length - 1 ? true : false,
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
                                        "Destination : ${controller.SelectedTrip!.citys[index].city}",
                                    color: AppColors.mainTextColor,
                                    textDecoration: isPast
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.underline,
                                    fontSize: Dimenssions.font20,
                                    weight: FontWeight.bold,
                                  ),
                                  CostumeAnimatedText(
                                    text:
                                        "Visit Date : ${controller.SelectedTrip!.citys[index].dateofpassage.toString().substring(0, 11)}",
                                    fontSize: Dimenssions.font20 - 5,
                                    weight: FontWeight.normal,
                                    color: AppColors.mainTextColor,
                                    textDecoration: isPast
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.solid,
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
    );
 
    }); }
}