import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/authController/verificationcodeController.dart';
import 'package:transmobile/view/splashscreens/transOuclient.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class verificationCode extends StatefulWidget {
  const verificationCode({super.key});

  @override
  State<verificationCode> createState() => _verificationCodeState();
}

class _verificationCodeState extends State<verificationCode> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(body: SafeArea(
        child: GetBuilder<verificationCodeController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14, top: 5),
                      child: GestureDetector(
                          onTap: () {
                            showAdaptiveDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog.adaptive(
                                      backgroundColor: Colors.white,
                                      actions: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: const Text(
                                            "Stay ",
                                            style: TextStyle(
                                                color: AppColors.buttonColor),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimenssions.width20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.offAll(
                                                () => const TransOuClient());
                                          },
                                          child: const Text(
                                            "back",
                                            style: TextStyle(
                                                color: AppColors.buttonColor),
                                          ),
                                        )
                                      ],
                                      content: SizedBox(
                                        height: 180,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: 100,
                                                child: LottieBuilder.asset(
                                                    "assets/animations/attention.json")),
                                            const Text(
                                                "If you left this page you will \nnot be able to create another \naccount  until 24H passes"),
                                          ],
                                        ),
                                      ));
                                });
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: Dimenssions.icon16 * 2,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimenssions.height20 * 15,
                  width: Dimenssions.width,
                  child: LottieBuilder.asset(
                      "assets/animations/verificationcode.json"),
                ),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                Text(
                  "Please type the verification code \n    have been sent to your email",
                  style: TextStyle(
                      color: AppColors.bigTextColor,
                      fontSize: Dimenssions.font20),
                ),
                SizedBox(
                  height: Dimenssions.height20 * 3,
                ),
                VerificationCode(
                    length: 4,
                    fullBorder: true,
                    padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                    margin: EdgeInsets.only(right: Dimenssions.LRpadmarg10),
                    onCompleted: (String value) {
                     controller.verificationCode =value;
                    
                    },
                    onEditing: (bool value) {
                      controller.onediting_verification_code = value;
                      if (!value)
                        FocusScope.of(context).unfocus();
                    }),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't recieve the verification code?",
                      style: TextStyle(color: AppColors.hintTextColor),
                    ),
                    SizedBox(
                      width: Dimenssions.width10 - 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        //! resending the verifiçcation code 
                        controller.resending_verification_code();
 
                      },
                      child: const Text("Re-Send code",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black,
                            decorationStyle: TextDecorationStyle.solid,
                            color: AppColors.bigTextColor,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimenssions.height20 * 4,
                ),
                GestureDetector(
                  onTap: () {
                    // ! verification code
                    //! after the verification code is recieved and entred
                    
                     controller.sendverification_code();
                  },
                  child: Container(
                    height: Dimenssions.height10 * 5,
                    width: Dimenssions.width30 * 9,
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius10)),
                    child: const Center(
                      child: Text(
                        "Verify",
                        style: TextStyle(color: AppColors.insidetextcolor),
                      ),
                    ),
                  ),
                )
              ]),
            );
          },
        ),
      )),
    );
  }
}
