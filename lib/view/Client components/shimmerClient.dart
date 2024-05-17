import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class ClientShimmerEffect extends StatelessWidget {
  const ClientShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Dimenssions.height20 * 6,
                              width: Dimenssions.width,
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: Dimenssions.height20 * 5.5,
                                        width: Dimenssions.width,
                                        decoration: BoxDecoration(
                                            color: AppColors.iconColor,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(
                                                    Dimenssions.radius40),
                                                bottomRight: Radius.circular(
                                                    Dimenssions.radius40))),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: Dimenssions.width30,
                                            ),
                                            ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                    20), // Adjust the radius to match the container's borderRadius
                                                child: Image.asset(
                                                  "assets/images/default.png",
                                                  height:
                                                      Dimenssions.height20 * 3,
                                                  width:
                                                      Dimenssions.height20 * 3,
                                                )),
                                            SizedBox(
                                              width: Dimenssions.width20,
                                            ),
                                            Column(
                                              children: [
                                                CostumeAnimatedText(
                                                    text: "Welcome Back! "),
                                                SizedBox(
                                                  height: Dimenssions.height10,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimenssions.height10,
                            ),
                            SizedBox(
                              height: Dimenssions.height20 * 11,
                              width: Dimenssions.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: Dimenssions.height20 * 10,
                                        width: Dimenssions.width - 20,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  "assets/images/amazon.jpg",
                                                )),
                                            borderRadius: BorderRadius.circular(
                                                Dimenssions.radius20)),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: Dimenssions.height20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Dimenssions.LRpadmarg20),
                              child: CostumeAnimatedText(
                                text: "Track your package : ",
                                weight: FontWeight.bold,
                                fontSize: Dimenssions.font20 + 3,
                              ),
                            ),
                            SizedBox(
                              height: Dimenssions.height10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimenssions.radius30),
                                color: Colors.grey,
                              ),
                              height: Dimenssions.height20 * 10,
                              width: Dimenssions.width,
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        width: Dimenssions.width,
                                        height: Dimenssions.height20 * 3,
                                        decoration: BoxDecoration(
                                          color: AppColors.iconColor
                                              .withOpacity(0.7),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: Dimenssions.width20 * 2,
                                            ),
                                            Expanded(
                                                flex: 3,
                                                child: CostumeAnimatedText(
                                                  text:
                                                      "Click to see your package",
                                                  color:
                                                      AppColors.insidetextcolor,
                                                )),
                                            const Expanded(
                                                flex: 1,
                                                child:
                                                    Icon(Icons.arrow_forward))
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            // displaying the text Transporteur and view more
                            SizedBox(
                              height: Dimenssions.height20,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimenssions.LRpadmarg20),
                                  child: CostumeAnimatedText(
                                      text: "Transporter : ",
                                      weight: FontWeight.bold,
                                      fontSize: Dimenssions.font20 + 3),
                                ),
                                const Spacer(),
                                CostumeAnimatedText(
                                  text: "view more ",
                                  weight: FontWeight.w100,
                                  fontSize: Dimenssions.font20 - 10,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimenssions.height20,
                            ),

                            /// list of transporteurs
                            /// displaying the list of transporteur in random order every time the user use the application
                            SizedBox(
                              height: Dimenssions.height20 * 4,
                              width: Dimenssions.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  // list of transporteurs length
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimenssions.LRpadmarg10 / 2,
                                          right: Dimenssions.LRpadmarg10 / 2),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              20), // Adjust the radius to match the container's borderRadius
                                          child: Image.asset(
                                            "assets/images/default.png",
                                            height: Dimenssions.height20 * 6,
                                            width: Dimenssions.width20 * 4,
                                          )),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: Dimenssions.height20,
                            ),
                          ]),
                    ),
                  );
  }
}