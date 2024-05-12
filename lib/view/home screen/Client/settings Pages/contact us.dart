import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:text_area/text_area.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Client%20components/button.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          SafeArea(
            child: GetBuilder<SettingController>(builder: (controller) {
        return controller.ContactUs_loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: Dimenssions.height20,),
                    Row(
                      children: [
                        SizedBox(width: Dimenssions.width20,),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back_rounded)),
                      ],
                    ),

                    SizedBox(height: Dimenssions.height20,),
                    Container(
                      margin: EdgeInsets.all(Dimenssions.TBpadmarg30),
                      padding: EdgeInsets.only(
                          left: Dimenssions.LRpadmarg20,
                          right: Dimenssions.LRpadmarg20),
                      height: Dimenssions.height20 * 10,
                      width: Dimenssions.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/images/logo.png"))),
                    ),
                    SizedBox(
                      height: Dimenssions.height10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Dimenssions.width20,
                        ),
                        const Icon(
                          BoxIcons.bx_chat,
                          color: AppColors.iconColor,
                        ),
                        SizedBox(
                          width: Dimenssions.width10,
                        ),
                        CostumeAnimatedText(text: "Message :")
                      ],
                    ),
                    SizedBox(
                      height: Dimenssions.height10,
                    ),
                    Container(
                      margin: EdgeInsets.all(Dimenssions.LRpadmarg20),
                      child: TextArea(
                        validation: true,
                        borderRadius: 10,
                        borderColor: const Color(0xFFCFD6FF),
                        textEditingController:
                            controller.ContactUsMessageController,
                        errorText: 'Please type a reason!',
                      ),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        // sending the message to the admin
                        controller.contactUs();
                      },
                      child: CostumeButton(
                          height: Dimenssions.height10 * 5,
                          width: Dimenssions.width30 * 9,
                          text: "Contact Us"),
                    )
                  ],
                ),
              );
      })),
    );
  }
}
