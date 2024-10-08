import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class shimmerEffect extends StatelessWidget {
  const shimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
 
    return SingleChildScrollView(
      child : Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                child: Column(
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
                          child: Container()
                        ),
                        SizedBox(
                          width: Dimenssions.width20,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: Dimenssions.height20 * 1.5,
                            ),
                            Text("Welcome Back!"),
                           Text("transporter")
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
                          
                            SizedBox(
                              height: Dimenssions.height10,
                            ),
                            // total amount of the revenu container
                            CostumeAnimatedText(
                              text:
                                  "0",
                              weight: FontWeight.bold,
                              color: AppColors.bigTextColor,
                          ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
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
                              Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                               
                                child:const  Icon(Icons.add , color: AppColors.buttonColor,)),
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
                           
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimenssions.width20,
                  ),
                
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
                            
                            SizedBox(
                              height: Dimenssions.height10,
                            ),
                            // total amount of the revenu container
                            
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
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
                            
                            SizedBox(
                              height: Dimenssions.height10,
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimenssions.height20 * 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                    
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // open the page to update the trip(delete it , update it )
                        },
                        child: Text(
                          "Add/Edit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.hintTextColor,
                              fontSize: Dimenssions.font20 - 4),
                        ),
                      ),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                    ],
                  ),
                
                  SizedBox(
                    height: Dimenssions.height20 * 2,
                  ),
                  //! if the transporter has already published a trip then display it esle do SizedBox
                SizedBox(
                          height: Dimenssions.height20 * 20,
                          child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (_, index) {
                               
                                return TimelineTile(
                                 
                                  beforeLineStyle: LineStyle(
                                      color:  AppColors.buttonColor
                                              .withOpacity(0.4)),
                                  indicatorStyle: IndicatorStyle(
                                    drawGap: true,
                                    // size of the indicator
                                    width: Dimenssions.width30,
                                    color: AppColors.buttonColor.withOpacity(0.4),
                                    iconStyle: IconStyle(
                                        iconData: Icons.done,
                                        color: Colors.white),
                                  ),
                                  endChild: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    //container that contains the city and the remove and done containers
                                    child: Container(
                                        height: Dimenssions.height20 * 5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimenssions.radius20),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            
                                            //! if the transporteur has passed the city then display youhave passed
                                            //!this city in the place of remove and done containers
                                           
                                          ],
                                        )),
                                  ),
                                );
                              }),
                        ),
                
                  SizedBox(
                    height: Dimenssions.height20 * 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                     
                    ],
                  ),
                  SizedBox(
                    height: Dimenssions.height20,
                  ),
                  //! transporteur statistc bar format
                  SizedBox(
                      height: Dimenssions.height20 * 11,
                      width: Dimenssions.width,
                      ),
                  SizedBox(
                    height: Dimenssions.height20 * 3,
                  ),
                
                  //! circle charts
                  SizedBox(
                      height: Dimenssions.height20 * 7,
                      width: Dimenssions.width,
                     ),
                  SizedBox(
                    height: Dimenssions.height20 * 3,
                  ),
                ],
                            ) ,),
    );
  }
}