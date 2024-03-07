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
    return (index==1)? Column(
      children: [
        SizedBox(
          height: Dimenssions.height20,
        ),
        SizedBox(
          height: Dimenssions.height20 * 10,
          width: Dimenssions.width,
          child: LottieBuilder.asset("assets/animations/animation5.json"),
        ),
        SizedBox(
            height: Dimenssions.height20 * 20,
            width: Dimenssions.width,
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
                        borderSide:
                            const BorderSide(color: AppColors.bigTextColor),
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius20),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.bigTextColor),
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius20))),
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
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Exemple@gmail.com",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      labelText: "Email",
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
                        borderSide:
                            const BorderSide(color: AppColors.bigTextColor),
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius20),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.bigTextColor),
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius20))),
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
        RichText(
          text: TextSpan(
              text: "By creating an account , you agree to our  ",
              style: TextStyle(
                  color: AppColors.bigTextColor,
                  fontSize: Dimenssions.font20 - 5),
              children: [
                const TextSpan(
                    text: "Terms of Use",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.hintTextColor,
                        fontWeight: FontWeight.bold)),
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
          height: Dimenssions.height20,
        ),
        Row(
          children: [
            Text("Swipe to continue",
                style: TextStyle(
                    color: AppColors.bigTextColor,
                    fontSize: Dimenssions.font20 - 5)),
                    Icon(Icons.swipe_right, size: Dimenssions.icon24,)
          ],
        )
      ],
    ):Column(
      children: [
        SizedBox(
          height: Dimenssions.height20,
        ),
        SizedBox(
          height: Dimenssions.height20 * 10,
          width: Dimenssions.width,
          child: LottieBuilder.asset("assets/animations/animation5.json"),
        ),
        SizedBox(
            height: Dimenssions.height20 * 20,
            width: Dimenssions.width,
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
                          
                      icon: const Icon(Icons.person),
                      iconColor: AppColors.iconColor,
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.bigTextColor),
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius20),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.bigTextColor),
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius20))),
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length < 8 ||
                        value.contains(RegExp(r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
                      return "Password must be at least 8 characters long \n and contain at least 1 letter and 7 number";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    
                      hintText: " Password",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      labelText: "Re-enter Password",
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
                        borderSide:
                            const BorderSide(color: AppColors.bigTextColor),
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius20),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.bigTextColor),
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius20))),
                  validator: (value) {
                    if (value != password ) {
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
              text: "By creating an account , you agree to our  ",
              style: TextStyle(
                  color: AppColors.bigTextColor,
                  fontSize: Dimenssions.font20 - 5),
              children: [
                const TextSpan(
                    text: "Terms of Use",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.hintTextColor,
                        fontWeight: FontWeight.bold)),
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
          height: Dimenssions.height20,
        ),
        Container(
          
        )
       
      ],
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
