import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:transmobile/controller/homeScreen/Client/SendRequestController.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class SendRequest extends StatefulWidget {
  const SendRequest({super.key});

  @override
  State<SendRequest> createState() => _SendRequestState();
}

class _SendRequestState extends State<SendRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SendRequestController>(
          builder: (controller) {
            return Column(
              children: [
                SizedBox(
                  height: Dimenssions.height20,
                ),
                CostumeAnimatedText(
                  text: "Send request",
                  fontSize: Dimenssions.font20 - 3,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: Dimenssions.height20,
                ),
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
                      child: controller.SelectedImage == null
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
                              controller.SelectedImage!,
                              fit: BoxFit.cover,
                              width: 130,
                              height: 130,
                            ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
