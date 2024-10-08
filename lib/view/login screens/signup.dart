import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/authController/signinController.dart';
import 'package:transmobile/controller/client%20trans%20details/clientmoreDetails.dart';
import 'package:transmobile/controller/client%20trans%20details/transmoreDetails.dart';
import 'package:transmobile/view/More%20details%20C/T/ClientDetails.dart';
import 'package:transmobile/view/More%20details%20C/T/transDetails.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

import '../../controller/authController/signupController.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();

  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController repasswordcontroller = new TextEditingController();

  Widget _Signup(index) {
    return GetBuilder<signupController>(builder: (controller) {
      return (index == 0)
          ? SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimenssions.height20,
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 19,
                      width: Dimenssions.width,
                      child: LottieBuilder.asset(
                          "assets/animations/animation5.json"),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: Dimenssions.width20 * 3),
                          child: Text(
                            "Sign up",
                            style: TextStyle(fontSize: Dimenssions.font20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimenssions.height20,
                    ),
                    SizedBox(
                        height: Dimenssions.height20 * 10,
                        width: Dimenssions.width - Dimenssions.width20,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: namecontroller,
                              decoration: InputDecoration(
                                  hintText: "Jhon Gomez",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  labelText: "Full Name",
                                  labelStyle: const TextStyle(
                                      color: AppColors.bigTextColor),
                                  icon: const Icon(Icons.person),
                                  iconColor: AppColors.iconColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.bigTextColor),
                                    borderRadius: BorderRadius.circular(
                                        Dimenssions.radius20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.bigTextColor),
                                      borderRadius: BorderRadius.circular(
                                          Dimenssions.radius20))),
                              onChanged: (value) {
                                // kol mera ntasti ken how client nsajel el donnees fi client details controller
                                // snn nsajlhom fi transporter details controller 
                                // khaterhom ken nkhalihom fi signup controller besh yogaado
                                //dima yetafskho awel ma netaada ll details 
                                Get.find<signinController>().isClient
                                    ? Get.find<ClientDetailsController>()
                                        .fullname = namecontroller.text.trim()
                                    : Get.find<transDetaislController>()
                                            .fullname =
                                        namecontroller.text.trim();
                              },
                            ),
                            SizedBox(
                              height: Dimenssions.height20 * 2,
                            ),
                            TextFormField(
                              undoController: UndoHistoryController(),
                              controller: emailcontroller,
                              decoration: InputDecoration(
                                  hintText: "Exemple@gmail.com",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  labelText: "Email",
                                  labelStyle: const TextStyle(
                                      color: AppColors.bigTextColor),
                                  icon: const Icon(Icons.email),
                                  iconColor: AppColors.iconColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.bigTextColor),
                                    borderRadius: BorderRadius.circular(
                                        Dimenssions.radius20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.bigTextColor),
                                      borderRadius: BorderRadius.circular(
                                          Dimenssions.radius20))),
                              onChanged: (value) {
                                // kol mera ntasti ken how client nsajel el donnees fi client details controller
                                // snn nsajlhom fi transporter details controller 
                                // khaterhom ken nkhalihom fi signup controller besh yogaado
                                //dima yetafskho awel ma netaada ll details 
                                Get.find<signinController>().isClient
                                    ? Get.find<ClientDetailsController>()
                                        .email = emailcontroller.text.trim()
                                    : Get.find<transDetaislController>().email =
                                        emailcontroller.text.trim();
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
                            Get.back();
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
                                color: AppColors.hintTextColor,
                                fontSize: Dimenssions.font20 - 5),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Swipe to continue",
                            style: TextStyle(
                                color: AppColors.iconColor,
                                fontSize: Dimenssions.font20 - 5)),
                        SizedBox(
                          width: Dimenssions.width20,
                        ),
                        Icon(
                          Icons.double_arrow_rounded,
                          size: Dimenssions.icon24 + 6,
                          color: AppColors.iconColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimenssions.height20,
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 19,
                      width: Dimenssions.width,
                      child: LottieBuilder.asset(
                          "assets/animations/animation5.json"),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: Dimenssions.width20 * 3),
                          child: Text(
                            "Set Password",
                            style: TextStyle(fontSize: Dimenssions.font20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimenssions.height10,
                    ),
                    SizedBox(
                        height: Dimenssions.height20 * 10,
                        width: Dimenssions.width - Dimenssions.width20,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: passwordcontroller,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  labelText: "Password",
                                  labelStyle: const TextStyle(
                                      color: AppColors.bigTextColor),
                                  icon: const Icon(Icons.password),
                                  iconColor: AppColors.iconColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.bigTextColor),
                                    borderRadius: BorderRadius.circular(
                                        Dimenssions.radius20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.bigTextColor),
                                      borderRadius: BorderRadius.circular(
                                          Dimenssions.radius20))),
                              onChanged: (value) {
                                // kol mera ntasti ken how client nsajel el donnees fi client details controller
                                // snn nsajlhom fi transporter details controller 
                                // khaterhom ken nkhalihom fi signup controller besh yogaado
                                //dima yetafskho awel ma netaada ll details 
                                Get.find<signinController>().isClient
                                    ? Get.find<ClientDetailsController>()
                                            .password =
                                        passwordcontroller.text.trim()
                                    : Get.find<transDetaislController>()
                                            .password =
                                        passwordcontroller.text.trim();
                              },
                            ),
                            SizedBox(
                              height: Dimenssions.height20 * 2,
                            ),
                            TextFormField(
                              controller: repasswordcontroller,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: " Password",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  labelText: "Re-enter Password",
                                  labelStyle: const TextStyle(
                                      color: AppColors.bigTextColor),
                                  icon: const Icon(Icons.password),
                                  iconColor: AppColors.iconColor,
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(
                                        Dimenssions.radius20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.bigTextColor),
                                    borderRadius: BorderRadius.circular(
                                        Dimenssions.radius20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.bigTextColor),
                                      borderRadius: BorderRadius.circular(
                                          Dimenssions.radius20))),
                              onChanged: (value) {
                                // kol mera ntasti ken how client nsajel el donnees fi client details controller
                                // snn nsajlhom fi transporter details controller 
                                // khaterhom ken nkhalihom fi signup controller besh yogaado
                                //dima yetafskho awel ma netaada ll details 
                                Get.find<signinController>().isClient
                                    ? Get.find<ClientDetailsController>()
                                            .repassword =
                                        repasswordcontroller.text.trim()
                                    : Get.find<transDetaislController>()
                                            .repassword =
                                        repasswordcontroller.text.trim();
                              },
                            ),
                          ],
                        )),
                    SizedBox(
                      height: Dimenssions.height20,
                    ),
                    RichText(
                      text: TextSpan(
                          text:
                              "By creating an account , you agree to our \n  ",
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
                      height: Dimenssions.height20 * 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        // verification input
                        controller.inputVerification();
                        if(Get.find<signinController>().isClient && controller.verificationstatus ){
                               Get.to(()=> const ClientMoreDetails());
                               
                        }

                        else if(controller.verificationstatus && Get.find<signinController>().isTrans ) {
                          Get.to(() => const TransDetails());
                        }
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
                            "Continue",
                            style: TextStyle(color: AppColors.insidetextcolor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            controller: PageController(keepPage: true),
            itemCount: 2,
            itemBuilder: (context, index) {
              return _Signup(index);
            }),
      ),
    );
  }
}
