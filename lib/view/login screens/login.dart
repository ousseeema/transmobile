import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/authController/signinController.dart';
import 'package:transmobile/view/login%20screens/forgotpassword.dart';
import 'package:transmobile/view/login%20screens/signup.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<signinController>(
       builder: (controller) {
         return SingleChildScrollView(
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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimenssions.width20 * 3),
                    child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: Dimenssions.font20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),
              SizedBox(
                  height: Dimenssions.height20 * 9,
                  width: Dimenssions.width - Dimenssions.width20,
                  child: Form(
                     key: _formKey,
                    child: Column(
                      children: [
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
                          
                          onChanged: (value) {
                            controller.email = value.trim();
                          },
                        ),
                        SizedBox(
                          height: Dimenssions.height20 * 2,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: " Password",
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
                          
                          onChanged: (value) {
                           controller.password = value.trim();
                          },
                        ),
                      ],
                    ),
                  )),
                  
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // going to send  code verification via email
                      Get.to(()=> const forgotpassword());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationStyle: TextDecorationStyle.solid,
                          color: AppColors.hintTextColor,
                          fontSize: Dimenssions.font20 - 5),
                    ),
                  ),
                  SizedBox(
                    width: Dimenssions.width20,
                  ),
                ],
              ),
              SizedBox(
                height: Dimenssions.height20*1.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You don't have an account?",
                    style: TextStyle(
                        color: AppColors.bigTextColor,
                        fontSize: Dimenssions.font20 - 5),
                  ),
                  SizedBox(
                    width: Dimenssions.width20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>const signupPage(),
                      transition: Transition.fade,
        
        
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationStyle: TextDecorationStyle.solid,
                          color: AppColors.hintTextColor,
                          fontSize: Dimenssions.font20 - 4),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Dimenssions.height10 * 2,
              ),
              GestureDetector(
                onTap: () {
                   // ! verification input
                   controller.verificationinput();
                  
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
                      "Sign in",
                      style: TextStyle(color: AppColors.insidetextcolor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
       },
       
      ),
    );
  }
}
