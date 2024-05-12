import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/edit%20password%20page.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/reset%20email%20page.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class paramsPage extends StatefulWidget {
  const paramsPage({super.key});

  @override
  State<paramsPage> createState() => _paramsPageState();
}

class _paramsPageState extends State<paramsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<SettingController>(
      builder: (controller) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(Dimenssions.LRpadmarg20,
                Dimenssions.LRpadmarg20, Dimenssions.LRpadmarg20, 0),
            child: Column(
              children: [
                  Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back))
                      ],
                    ),
                SizedBox(
                  height: Dimenssions.height20 * 15,
                  width: Dimenssions.width,
                  child:
                      LottieBuilder.asset("assets/animations/animation5.json"),
                ),
                SizedBox(
                  height: Dimenssions.height20*4,
                ),
                //! email adddress container
                Container(
                  padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                  height: Dimenssions.height20 * 3.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.circular(Dimenssions.radius10)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.email_rounded,
                        color: AppColors.iconColor,
                      ),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      // column for email text and the email address

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Dimenssions.height10,
                          ),
                          const Text(
                            "Email address",
                            style: TextStyle(color: Colors.grey),
                          ),
                          // display the email address
                          CostumeAnimatedText(text: controller.client!.email!),
                          
                        ],
                      ),
                      const Spacer(),
                          // arrow icon with gesture detector
                          GestureDetector(
                              onTap: () {
                                // go to email address reset

                                Get.to(() => const ResetEmailPage());
                              },
                              child: const Icon(Icons.arrow_forward_ios)),

                          SizedBox(
                            width: Dimenssions.width20,
                          )
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                // ! password conatiner 
                Container(
                  padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                  height: Dimenssions.height20 * 3.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.circular(Dimenssions.radius10)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.password,
                        color: AppColors.iconColor,
                      ),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      // column for passord text and the password

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Dimenssions.height10,
                          ),
                          const Text(
                            "Password ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          // display the email address
                          CostumeAnimatedText(text: "**********"),
                          
                        ],
                      ),
                      const Spacer(),
                      // arrow icon with gesture detector
                      GestureDetector(
                          onTap: () {
                            // go to email address reset

                            Get.to(() => const editPasswordPage());
                          },
                          child: const Icon(Icons.arrow_forward_ios)),
                      SizedBox(
                        width: Dimenssions.width20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
