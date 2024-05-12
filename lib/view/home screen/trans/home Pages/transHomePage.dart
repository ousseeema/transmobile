import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransHomeController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
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
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: GetBuilder<transHomeController>(
          builder: (controller) {
            return Column(
              children: [
                
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
                Row(
                  children: [
                    // container contains the income of the current transporteur
                    Container(
                      height: Dimenssions.height20 * 5,
                      width: Dimenssions.width / 2 - Dimenssions.width30,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        children: [
                          Container(
                            height: Dimenssions.height10 * 3,
                            width: Dimenssions.width10 * 3,
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
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
