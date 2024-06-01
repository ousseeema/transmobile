import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransResetEmailPage extends StatefulWidget {
  const TransResetEmailPage({super.key});

  @override
  State<TransResetEmailPage> createState() => _TransResetEmailPageState();
}

class _TransResetEmailPageState extends State<TransResetEmailPage> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: GetBuilder<SettingController>(
        builder: (controller) {
          return (controller.resetEmail_loading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14, top: 5),
                          child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: Dimenssions.icon16 * 2,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 2,
                    ),
                    Center(
                      child: Text(
                        "Wanna change your Email?",
                        style: TextStyle(
                            fontSize: Dimenssions.font20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 2,
                    ),
                    const Text(
                        "Don't worry, we've got you covered! Enter \n your new email below  change it"),
                    SizedBox(
                      height: Dimenssions.height20 * 14,
                      width: Dimenssions.width,
                      child: LottieBuilder.asset(
                          "assets/animations/forgotpassanimation.json"),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 4,
                      width: Dimenssions.width - Dimenssions.width20,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Exemple@gmail.com",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            labelText: "Email",
                            labelStyle:
                                const TextStyle(color: AppColors.bigTextColor),
                            icon: const Icon(Icons.email),
                            iconColor: AppColors.iconColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.bigTextColor),
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius20),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.bigTextColor),
                                borderRadius: BorderRadius.circular(
                                    Dimenssions.radius20))),
                        onChanged: (value) {
                          controller.changedemail = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: Dimenssions.height20,
                    ),
                    
                    SizedBox(
                      height: Dimenssions.height20 * 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        // ! verification input and sending the code to the email for the reset change it 

                        controller.changeEmailAddress();
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
                            "Change email",
                            style: TextStyle(color: AppColors.insidetextcolor),
                          ),
                        ),
                      ),
                    ),
                  ]),
                );
        },
      )),
    );
  }
}
