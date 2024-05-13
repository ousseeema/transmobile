import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransHomeController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Trans%20components/charts.dart';
import 'package:transmobile/view/Trans%20components/piechart.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransHomePage extends StatefulWidget {
  const TransHomePage({super.key});

  @override
  State<TransHomePage> createState() => _TransHomePageState();
}

class _TransHomePageState extends State<TransHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero).then(
      (value) {
        Get.find<transHomeController>().LoadData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPast = false;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: GetBuilder<transHomeController>(
          builder: (controller) {
            return Column(
              children: [
                // container for the trans name and the welcome
                Container(
                  height: Dimenssions.height20 * 5.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration(
                      color: AppColors.iconColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Dimenssions.radius40),
                          bottomRight: Radius.circular(Dimenssions.radius40))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimenssions.width30,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            100), // Adjust the radius to match the container's borderRadius
                        child: Image.network(
                          "${AppConstant.Transimage}/${controller.transporter!.profilePicture}",
                          fit: BoxFit.cover,
                          height: Dimenssions.height20 * 3,
                          width: Dimenssions.width30 * 2,
                        ),
                      ),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: Dimenssions.height20 * 1.5,
                          ),
                          CostumeAnimatedText(text: "Welcome Back! "),
                          CostumeAnimatedText(
                            text: controller.transporter!.fullName,
                            color: AppColors.insidetextcolor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                // the first row 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // first container in first row : container contains the income of the current transporteur
                    Container(
                      height: Dimenssions.height20 * 7,
                      width: Dimenssions.width / 2 - Dimenssions.width30,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimenssions.height20,
                          ),
                          //! container for the $$ icon
                          Container(
                            height: Dimenssions.height10 * 4,
                            width: Dimenssions.width10 * 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green,
                            ),
                            child: const Center(
                              child: Icon(
                                BoxIcons.bx_dollar,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimenssions.height10,
                          ),
                          CostumeAnimatedText(
                            text: "Total income",
                            fontSize: Dimenssions.font10 + 4,
                            color: AppColors.hintTextColor,
                          ),
                          SizedBox(
                            height: Dimenssions.height10,
                          ),
                          // total amount of the revenu container
                          CostumeAnimatedText(
                            text:
                                controller.transporter!.totalRevenue.toString(),
                            weight: FontWeight.bold,
                            color: AppColors.bigTextColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: Dimenssions.width20,),
                  // THE SSECOND CONTAINER IN THE FIRST ROW : total package container
                    Container(
                      height: Dimenssions.height20 * 7,
                      width: Dimenssions.width / 2 - Dimenssions.width30,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimenssions.height20,
                          ),
                          //! container for the $$ icon
                          Container(
                            height: Dimenssions.height10 * 4,
                            width: Dimenssions.width10 * 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_upward_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimenssions.height10,
                          ),
                          CostumeAnimatedText(
                            text: "Total package",
                            fontSize: Dimenssions.font10 + 4,
                            color: AppColors.hintTextColor,
                          ),
                          SizedBox(
                            height: Dimenssions.height10,
                          ),
                          // total package  text
                          CostumeAnimatedText(
                            text:
                                controller.transporter!.numberofPackages.toString(),
                            weight: FontWeight.bold,
                            color: AppColors.bigTextColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimenssions.width20,),

                // the second row 
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // container contains the total trip  of the current transporteur
                    Container(
                      height: Dimenssions.height20 * 7,
                      width: Dimenssions.width / 2 - Dimenssions.width30,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimenssions.height20,
                          ),
                          //! container for the $$ icon
                          Container(
                            height: Dimenssions.height10 * 4,
                            width: Dimenssions.width10 * 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green,
                            ),
                            child: const Center(
                              child: Icon(
                                BoxIcons.bx_trip,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimenssions.height10,
                          ),
                          CostumeAnimatedText(
                            text: "Total Trips",
                            fontSize: Dimenssions.font10 + 4,
                            color: AppColors.hintTextColor,
                          ),
                          SizedBox(
                            height: Dimenssions.height10,
                          ),
                          // total amount of the revenu container
                          CostumeAnimatedText(
                            text:
                                controller.transporter!.numberofTrips.toString(),
                            weight: FontWeight.bold,
                            color: AppColors.bigTextColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: Dimenssions.width20,),
                  // total client  container
                    Container(
                      height: Dimenssions.height20 * 7,
                      width: Dimenssions.width / 2 - Dimenssions.width30,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimenssions.height20,
                          ),
                          //! container for the $$ icon
                          Container(
                            height: Dimenssions.height10 * 4,
                            width: Dimenssions.width10 * 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green,
                            ),
                            child: const Center(
                              child: Icon(
                                BoxIcons.bx_user,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimenssions.height10,
                          ),
                          CostumeAnimatedText(
                            text: "Total Client",
                            fontSize: Dimenssions.font10 + 4,
                            color: AppColors.hintTextColor,
                          ),
                          SizedBox(
                            height: Dimenssions.height10,
                          ),
                          // total amount of the revenu container
                          CostumeAnimatedText(
                            text:
                                controller.transporter!.numberofClients.toString(),
                            weight: FontWeight.bold,
                            color: AppColors.bigTextColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimenssions.height20*2,),
               Row(
                children: [ 
                  SizedBox(width: Dimenssions.width20,),
                 CostumeAnimatedText(text: "Current Trip : ",weight: FontWeight.bold,fontSize: Dimenssions.font20-4,),
                 const   Spacer(),
                 Text("Add/Edit", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.hintTextColor,
                  fontSize: Dimenssions.font20-4

                 ),),
                 SizedBox(width: Dimenssions.width20,),


                ],
               ),

               SizedBox(height: Dimenssions.height20*2,),
               //! if the transporter has already published a trip then display it esle do SizedBox
               controller.Trip == null ? SizedBox(
                child: CostumeAnimatedText(text: "No Trip for the moment", weight: FontWeight.bold, fontSize: Dimenssions.font20, color: AppColors.iconColor,),

               ) : 
               SizedBox(height: Dimenssions.height20*5,
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
                      isLast: index == controller.Trip!.citys.length - 1 ? true : false,
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
                  }),),

              SizedBox(height: Dimenssions.height20*2,),
                 Row( 
                  children: [
                     SizedBox(width: Dimenssions.width20,),
                     CostumeAnimatedText(text: "Statistic",weight: FontWeight.bold,fontSize: Dimenssions.font20-4,),
                  ],
                 ),
                 SizedBox(height: Dimenssions.height20,),
               //! transporteur statistc bar format
               SizedBox(
                height: Dimenssions.height20*11,
                width: Dimenssions.width,
                child: const charts()),
                SizedBox(height: Dimenssions.height20*3,),
 
                 //! circle charts 
                SizedBox(
                    height: Dimenssions.height20*7,
                width: Dimenssions.width,
                  child: const PieChartSample2()),
                  SizedBox(height: Dimenssions.height20*3,),


              ],
            );
          },
        ),
      )),
    );
  }
}
