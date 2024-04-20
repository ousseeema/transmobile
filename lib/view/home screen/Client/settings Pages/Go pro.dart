import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class GoPro extends StatefulWidget {
  const GoPro({super.key});

  @override
  State<GoPro> createState() => _GoProState();
}

class _GoProState extends State<GoPro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: GetBuilder<SettingController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                    padding: EdgeInsets.only(
                        left: Dimenssions.LRpadmarg20,
                        right: Dimenssions.LRpadmarg20),
                    child: GestureDetector(
                      onTap: () {
                        // add package phot from the gallery
                        controller.PickimageFromGallery();
                      },
                      child: Container(
                        height: Dimenssions.height20 * 11,
                        decoration: BoxDecoration(
                            border: const DashedBorder.fromBorderSide(
                              dashLength: 10,
                              side: BorderSide(color: Colors.blue, width: 1),
                            ),
                            color: Colors.blue[100]!.withOpacity(0.4)),
                        child: controller.passportimage == null
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cloud_download_outlined,
                                      size: Dimenssions.icon24 * 3,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      height: Dimenssions.height20,
                                    ),
                                    AnimatedTextKit(
                                        repeatForever: true,
                                        animatedTexts: [
                                          FadeAnimatedText(
                                            'Tap to upload image',
                                            textStyle: TextStyle(
                                                color: Colors.blue,
                                                fontSize: Dimenssions.font20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])
                                  ],
                                ),
                              )
                            : Image.file(
                                controller.passportimage!,
                                fit: BoxFit.fill,
                                width: Dimenssions.width,
                                height: Dimenssions.height20 * 11,
                              ),
                      ),
                    ),
                  ),
                  // data like name and  and message to the admin




            ],
          
          ),
        );
      },)
      ,
    );
  }
}