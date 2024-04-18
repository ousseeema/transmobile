import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class editPasswordPage extends StatefulWidget {
  const editPasswordPage({super.key});

  @override
  State<editPasswordPage> createState() => _editPasswordPageState();
}

class _editPasswordPageState extends State<editPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
  return  Scaffold(

    body:  GetBuilder<SettingController>(builder: (controller) {
       return  SafeArea(child: 
    Column(
                children: [
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
                      "Send",
                      style: TextStyle(color: AppColors.insidetextcolor),
                    ),
                  ),
                ),
              ),
                ],
              ));
  
    },));
  }
}