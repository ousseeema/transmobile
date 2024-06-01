import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransEditPasswordPage extends StatefulWidget {
  const TransEditPasswordPage({super.key});

  @override
  State<TransEditPasswordPage> createState() => _TransEditPasswordPageState();
}

class _TransEditPasswordPageState extends State<TransEditPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
  return  Scaffold(

    body:  GetBuilder<SettingController>(builder: (controller) {
       return  SafeArea(
        child: 
    Padding(
      padding:  EdgeInsets.all(Dimenssions.LRpadmarg20),
      child: SingleChildScrollView(
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                        "Wanna change your Password?",
                        style: TextStyle(
                            fontSize: Dimenssions.font20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 ,
                    ),
                    const Text(
                        "Don't worry, we've got you covered! Enter  your\n      old and new password below to change it"),
                    SizedBox(
                      height: Dimenssions.height20 * 10,
                      width: Dimenssions.width,
                      child: LottieBuilder.asset(
                          "assets/animations/forgotpassanimation.json"),
                    ),
                    SizedBox(
                      height: Dimenssions.height20*2,
                    ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Old Password",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            labelText: "Old Password",
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
                          controller.oldpassword = value.trim();
                        },
                      ),
                      SizedBox(
                        height: Dimenssions.height20 * 2,
                      ),
                      TextFormField(
                        controller: repasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: " New Password",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            labelText: " New  Password",
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
                          controller.newpassword = value.trim();
                        },
                      ),
        
                       SizedBox(
                    height: Dimenssions.height20 * 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      // ! verification input
                      //! changing the password 
                      controller.changepassword();
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
                          "Change Password",
                          style: TextStyle(color: AppColors.insidetextcolor),
                        ),
                      ),
                    ),
                  ),
                    ],
                  ),
      ),
    ));
  
    },));
  }
}