import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransSettingsController.dart';
import 'package:transmobile/view/Client%20components/settingsContainer.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/Editpage.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/Go%20pro.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/contact%20us.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/InfoCenter.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/params.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransSettingScreen extends StatefulWidget {
  const TransSettingScreen({super.key});

  @override
  State<TransSettingScreen> createState() => _TransSettingScreenState();
}

class _TransSettingScreenState extends State<TransSettingScreen> {
  @override
  initState() {
    super.initState();
    Get.find<TransSettingsController>().GetUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<TransSettingsController>(
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
                              return const  CircularProgressIndicator();
                              },
                              "${AppConstant.Transimage}${controller.transporteur!.profilePicture}",
                              fit: BoxFit.cover,
                              height: Dimenssions.height20 * 3,
                              width: Dimenssions.width30 * 2,
                            )),
                        SizedBox(
                          width: Dimenssions.width20,
                        ),

                        // column for name and email address
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                      controller.transporteur!.fullName,
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
                                      controller.transporteur!.email,
                                      textStyle: TextStyle(
                                          fontSize: Dimenssions.font20 - 4,
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
                        Icon( Icons.verified, color:  controller.transporteur!.verified==true ? Colors.blue: Colors.grey,size: Dimenssions.icon24,)
                      ],
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 4,
                    ),
                    GestureDetector(
                      onTap: (){
                       // going to the edit page
                       Get.to(()=>const EditPage());
                      },
                       // costume container for settings
                      child: SettingsContainer(
                          iconData: Icons.person_pin, text: "Edit profile", ),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                    GestureDetector(
                      onTap: (){
                       // going to the params page 
                       Get.to(()=> const paramsPage());
                      },
                       // costume container for settings
                      child: SettingsContainer(
                          iconData: Icons.settings_suggest_rounded, text: "Settings", ),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),

                    
                    Row(
                      children: [
                         // costume container for settings
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
                        //! if the user is not verified then give it the access to go pro page
                        //! if the user is already verified then affiche the the snack bar
                       controller.transporteur!.verified== true?
                        Get.snackbar("Remainder", "Your account is already Pro", backgroundColor: Colors.green[100], colorText: Colors.white) :
                        Get.to(()=>const GoPro());

                      },
                      // costume container for settings
                      child: SettingsContainer(
                          iconData: Icons.upgrade_rounded, text: "Go pro"),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // go to history page
                      
                       controller.getAllTrips();
                      },
                       // costume container for settings
                      child: SettingsContainer(
                      iconData: Icons.history_rounded, text: "History"),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                  GestureDetector(
                    onTap: () {
                      //  contact us page 
                      Get.to(()=> const ContactUsPage());
                    },
                     // costume container for settings
                      child: SettingsContainer(
                          iconData: Icons.send_outlined, text: "Contact us"),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // help center page 
                        Get.to(()=>const  InfoCenter());
                      },
                       // costume container for settings
                      child: SettingsContainer(
                          iconData: Icons.help_outline_rounded,
                          text: "Info Center"),
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        // sign out the user from the app 
                        controller.signOut();
                        
                      },
                       // costume container for settings
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
