import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/authController/resetpassController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({super.key});

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<resetpassController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
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
                  "Email have been sent!",
                  style: TextStyle(
                      fontSize: Dimenssions.font20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: Dimenssions.height10,
              ),
              const Text(
                "  Please check your email for a reset code. \nEnter the code below to verify your identity \n and proceed with resetting your password.",
                style: TextStyle(color: AppColors.hintTextColor),
              ),
              SizedBox(
                height: Dimenssions.height20 * 2,
              ),
              const Text(
                "Reset Code : ",
                style: TextStyle(color: AppColors.bigTextColor),
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),
              VerificationCode(
                  length: 4,
                  fullBorder: true,
                  padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                  margin: EdgeInsets.only(right: Dimenssions.LRpadmarg10),
                  cursorColor: AppColors.hintTextColor,
                  onCompleted: (String value) {
                    controller.verification_code = value;
                  },
                  onEditing: (bool value) {
                    controller.onediting_verification_code = value;
                    if (!controller.onediting_verification_code)
                      FocusScope.of(context).unfocus();
                  }),
              SizedBox(
                height: Dimenssions.height20 * 3,
              ),
              SizedBox(
                  height: Dimenssions.height20 * 10,
                  width: Dimenssions.width - Dimenssions.width20,
                  child: Column(
                    children: [
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "New Password",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            labelText: "New Password",
                            labelStyle:
                                const TextStyle(color: AppColors.bigTextColor),
                            icon: const Icon(Icons.password),
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
                          controller.password = value.trim();
                        },
                      ),
                      SizedBox(
                        height: Dimenssions.height20 * 2,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: " New Password",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            labelText: "Re-enter New  Password",
                            labelStyle:
                                const TextStyle(color: AppColors.bigTextColor),
                            icon: const Icon(Icons.password),
                            iconColor: AppColors.iconColor,
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius20),
                            ),
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
                          controller.repassword = value.trim();
                        },
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive the code?"),
                  SizedBox(
                    width: Dimenssions.width10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // resent the code (same api with the send reset code )
                      controller.resendresetcode();
                    },
                    child: Text(
                      "Re-sent",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationStyle: TextDecorationStyle.solid,
                          color: AppColors.hintTextColor,
                          fontSize: Dimenssions.font20 - 4),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimenssions.height20 * 2,
              ),
              GestureDetector(
                onTap: () {
                  // ! verification input
                  //! changing the password 
                  controller.resetpassword();
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
                      "Send",
                      style: TextStyle(color: AppColors.insidetextcolor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      })),
    );
  }
}
