import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/authController/resetpassController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<resetpassController>(builder: (controller) {
          return (controller.is_Loading1)? const Center(
            child: CircularProgressIndicator(),
          ): SingleChildScrollView(
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
                "Forgot your password?",
                style: TextStyle(
                    fontSize: Dimenssions.font20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: Dimenssions.height20 * 2,
            ),
            const Text(
                "Don't worry, we've got you covered! Enter \n your email below to reset your password"),
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
                    labelStyle: const TextStyle(color: AppColors.bigTextColor),
                    icon: const Icon(Icons.email),
                    iconColor: AppColors.iconColor,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.bigTextColor),
                      borderRadius: BorderRadius.circular(Dimenssions.radius20),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.bigTextColor),
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius20))),
                onChanged: (value) {
                  controller.email = value;
                },
              ),
            ),
            SizedBox(height: Dimenssions.height20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Text("Remamber your address",
                style: TextStyle(
                          color: AppColors.bigTextColor,
                          fontSize: Dimenssions.font20 - 5),
                ),
                SizedBox(width: Dimenssions.width10,),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  
                  child: Text("Login", 
                   style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black,
                            decorationStyle: TextDecorationStyle.solid,
                            color: AppColors.hintTextColor,
                            fontSize: Dimenssions.font20 - 5),
                  ))
              
              ],
            ),
            SizedBox(height: Dimenssions.height20*4,),
            GestureDetector(
                  onTap: () {
                     // ! verification input and sending the code to the email for the reset password
                     
                     controller.SendresetCode();
                    
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
            
            
            
            
                    ]),
          );
          
        },)
      ),
    );
  }
}
