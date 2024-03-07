import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

import '../../controller/authController/signupController.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  String? name;
  String? email;
  String? password;

  Widget _Signup(index) {
    return (index == 0)
        ? SingleChildScrollView(
          child: Column(
              children: [
                SizedBox(
                  height: Dimenssions.height20,
                ),
                SizedBox(
                  height: Dimenssions.height20 * 20,
                  width: Dimenssions.width,
                  child: LottieBuilder.asset("assets/animations/animation5.json"),
                ),
                SizedBox(
                    height: Dimenssions.height20 * 10,
                    width: Dimenssions.width-Dimenssions.width20,
                    child: Column(
                      children: [
                        TextFormField(
                               decoration: InputDecoration(
                               hintText: "Jhon Gomez",
                               hintStyle: TextStyle(color: Colors.grey[400]),
                               labelText: "Full Name",
                               labelStyle:
                                   const TextStyle(color: AppColors.bigTextColor),
                                icon: const Icon(Icons.person),
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
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length < 3 ||
                                value.contains(RegExp(r'[0-9]'))) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        SizedBox(
                          height: Dimenssions.height20*2,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Exemple@gmail.com",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              labelText: "Email",
                              labelStyle:
                                  const TextStyle(color: AppColors.bigTextColor),
                              icon: const Icon(Icons.email),
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
                          validator: (value) {
                            if (value!.isEmpty || value.isEmail) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          },
                        )
                      ],
                    )),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: AppColors.bigTextColor,
                          fontSize: Dimenssions.font20 - 5),
                    ),
                    SizedBox(
                      width: Dimenssions.width10,
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            color: AppColors.hintTextColor,
                            fontSize: Dimenssions.font20 - 5),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimenssions.height20*2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Text("Swipe to continue",
                        style: TextStyle(
                            color: AppColors.iconColor,
                            fontSize: Dimenssions.font20 - 5)),
                            SizedBox(width: Dimenssions.width20,),
                    Icon(
                      Icons.double_arrow_rounded,
                      size: Dimenssions.icon24+6,
                      color: AppColors.iconColor,
                    )
                  ],
                )
              ],
            ),
        )
        : SingleChildScrollView(
          child: Column(
              children: [
                SizedBox(
                  height: Dimenssions.height20,
                ),
                SizedBox(
                  height: Dimenssions.height20 * 20,
                  width: Dimenssions.width,
                  child: LottieBuilder.asset("assets/animations/animation5.json"),
                ),
                SizedBox(
                    height: Dimenssions.height20 * 10,
                    width: Dimenssions.width-Dimenssions.width20,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              labelText: "Password",
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
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length < 8 ||
                                value.contains(RegExp(
                                    r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
                              return "Password must be at least 8 characters long \n and contain at least 1 letter and 7 number";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        SizedBox(
                          height: Dimenssions.height20*2,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: " Password",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              labelText: "Re-enter Password",
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
                          validator: (value) {
                            if (value != password) {
                              return "Password must the same";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                      ],
                    )),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                RichText(
                  text: TextSpan(
                      text: "By creating an account , you agree to our \n  ",
                      style: TextStyle(
                         fontFamily: "MadimiOne",
                          color: AppColors.bigTextColor,
                          fontSize: Dimenssions.font20 - 5),
                      children: [
                        const TextSpan(
                            text: "Terms of Use",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.hintTextColor,
                                fontWeight: FontWeight.bold,
                              
                                )),
                        TextSpan(
                          text: " and ",
                          style: TextStyle(
                              color: AppColors.bigTextColor,
                              fontSize: Dimenssions.font20 - 5),
                        ),
                        const TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.hintTextColor,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
                SizedBox(
                  height: Dimenssions.height20*2,
                ),
                GestureDetector(
                  onTap: () {
                    // going to the next page trans ou client
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
                        "Sign up",
                        style: TextStyle(color: AppColors.insidetextcolor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<signupController>(builder: (controller) {
        return PageView.builder(
            itemCount: 2,
            itemBuilder: (_, index) {
              return _Signup(index);
            });
      }),
    );
  }
}
