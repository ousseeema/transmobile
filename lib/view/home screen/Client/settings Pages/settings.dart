import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/components/settingsContainer.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  initState() {
    super.initState();
    Get.find<SettingController>().GetUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<SettingController>(
      builder: (controller) {
        return controller.isloading
            ? const CircularProgressIndicator()
            : Padding(
                padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimenssions.height20 * 4,
                    ),
                    Row(
                      children: [
                        // profile image
                        ClipRRect(
                            borderRadius: BorderRadius.circular(
                                100), // Adjust the radius to match the container's borderRadius
                            child: Image.network(
                              errorBuilder: (context, error, stackTrace) {
                              return  Image.asset("assets/images/default.png");
                              },
                              "${AppConstant.Clientimage}${controller.client!.profilePicture}",
                              fit: BoxFit.cover,
                              height: Dimenssions.height20 * 3,
                              width: Dimenssions.width30 * 2,
                            )),
                        SizedBox(
                          width: Dimenssions.width20,
                        ),

                        // column for name and email address
                        Column(
                          children: [
                            AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                      controller.client!.fullName,
                                      textStyle: TextStyle(
                                          fontSize: Dimenssions.font20,
                                          fontWeight: FontWeight.bold),
                                      colors: [
                                        Colors.black,
                                        Colors.white,
                                        Colors.blue,
                                      ]),
                                ]),
                            SizedBox(
                              height: Dimenssions.height10 - 3,
                            ),
                            AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                      controller.client!.email,
                                      textStyle: TextStyle(
                                          fontSize: Dimenssions.font20 - 7,
                                          fontWeight: FontWeight.w300),
                                      colors: [
                                        Colors.black,
                                        Colors.white,
                                        Colors.blue,
                                      ])
                                ])
                          ],
                        ),
                        SizedBox(
                          width: Dimenssions.width20*2,
                        ),
                        Icon( Icons.verified, color:  controller.client!.verified? Colors.blue: Colors.grey,size: Dimenssions.icon24,)
                      ],
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 4,
                    ),
                    GestureDetector(
                      onTap: (){
                       // going to the edit page
                      },
                      child: SettingsContainer(
                          iconData: Icons.person_pin, text: "Edit profile", ),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                    GestureDetector(
                      onTap: (){
                       // going to the params page 
                       
                      },
                      child: SettingsContainer(
                          iconData: Icons.settings_suggest_rounded, text: "Settings", ),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),

                    
                    Row(
                      children: [
                        SettingsContainer(
                            iconData: Icons.nights_stay_outlined,
                            text: "Night mode"),
                        const Spacer(),
                        Switch(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.black,
                            value: controller.NightMode,
                            onChanged: (value) {
                              controller.NigthModeChange(value);
                            }),
                        SizedBox(
                          width: Dimenssions.width20,
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // go pro page 

                      },
                      child: SettingsContainer(
                          iconData: Icons.upgrade_rounded, text: "Go pro"),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // go to history page
                      },
                      child: SettingsContainer(
                      iconData: Icons.history_rounded, text: "History"),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                  GestureDetector(
                    onTap: () {
                      //  contact us page 
                    },
                      child: SettingsContainer(
                          iconData: Icons.send_outlined, text: "Contact us"),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // help center page 
                      },
                      child: SettingsContainer(
                          iconData: Icons.help_outline_rounded,
                          text: "Help center"),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // sign out the user from the app 
                        
                      },
                      child: SettingsContainer(
                          iconData: BoxIcons.bx_log_out, text: "Sign out"),
                    ),
                  ],
                ),
              );
      },
    ));
  }
}
