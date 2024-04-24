import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:transmobile/controller/homeScreen/Client/SendRequestController.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class SendRequest extends StatefulWidget {
  const SendRequest({super.key});

  @override
  State<SendRequest> createState() => _SendRequestState();
}

class _SendRequestState extends State<SendRequest> {
  final TextEditingController number1 = TextEditingController();
  final TextEditingController number2 = TextEditingController();
  final TextEditingController pickupAddress = TextEditingController();
  final TextEditingController recieverAddress = TextEditingController();
  final TextEditingController totalkg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SendRequestController>(
          builder: (controller) {
            return  controller.is_Loading==true ? const Center(
              child:  CircularProgressIndicator()
              ) :  SingleChildScrollView(
              child: Column(
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
                  // select image from  yhe gallery conatiner
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
                                fit: BoxFit.fill,
                                width: Dimenssions.width,
                                height: Dimenssions.height20 * 11,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimenssions.height20,
                  ),
                  // more details to be filled
                  SizedBox(
                    height: Dimenssions.height20 * 4,
                    width: Dimenssions.width - Dimenssions.width20,
                    child: TextField(
                      controller: pickupAddress,
                      decoration: InputDecoration(
                          hintText:
                              "23 Rue de Grenell,75700 PARIS CEDEX,FRANCE ",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          labelText: "Pick Up Address",
                          labelStyle:
                              const TextStyle(color: AppColors.bigTextColor),
                          icon: Icon(
                            Icons.location_on,
                            size: Dimenssions.icon16 * 2,
                          ),
                          iconColor: AppColors.iconColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.bigTextColor),
                            borderRadius:
                                BorderRadius.circular(Dimenssions.radius20),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.bigTextColor),
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius20))),
                      onChanged: (value) {
                        controller.pickupAddress = value;
                      },
                    ),
                  ),
                 
                  // sender phone number
                  Container(
                    height: Dimenssions.height20 * 4,
                    margin: EdgeInsets.only(
                      left: Dimenssions.LRpadmarg20,
                    ),
                    width: Dimenssions.width - Dimenssions.width20 * 2,
                    child: InternationalPhoneNumberInput(
                       hintText: "Sender phone number",
                      maxLength: 13,
                      textFieldController: number1,
                      countries: const [
                        "GB",
                        "FR",
                        "IE",
                        "AT",
                        "DE",
                        "IT",
                        "CH",
                        "ES",
                        "NL",
                        "PT",
                        "TN",
                        "DZ",
                        "MA",
                        "LY",
                      ],
                      onInputChanged: (PhoneNumber number) {
                        controller.phoneNumberof_the_sender =
                            number.phoneNumber!;
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        useBottomSheetSafeArea: true,
                      ),
                      autoValidateMode: AutovalidateMode.disabled,
                      inputBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius20)),
                    ),
                  ),

                  SizedBox(
                    height: Dimenssions.height20,
                  ),

                  // reciver address
                  SizedBox(
                    height: Dimenssions.height20 * 4,
                    width: Dimenssions.width - Dimenssions.width20,
                    child: TextField(
                      controller: recieverAddress,
                      decoration: InputDecoration(
                          hintText:
                              "23 Rue de Grenell,75700 PARIS CEDEX,FRANCE ",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          labelText: "Reciver Address",
                          labelStyle:
                              const TextStyle(color: AppColors.bigTextColor),
                          icon: Icon(
                            Icons.location_on,
                            size: Dimenssions.icon16 * 2,
                          ),
                          iconColor: AppColors.iconColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.bigTextColor),
                            borderRadius:
                                BorderRadius.circular(Dimenssions.radius20),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.bigTextColor),
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius20))),
                      onChanged: (value) {
                        controller.receivedAdress = value;
                      },
                    ),
                  ),
                  

                  /// reciver phoone number
                  Container(
                    height: Dimenssions.height20 * 4,
                    margin: EdgeInsets.only(
                      left: Dimenssions.LRpadmarg20,
                    ),
                    width: Dimenssions.width - Dimenssions.width20 * 2,
                    child: InternationalPhoneNumberInput(
                      hintText: "Reciver phone number",
                      maxLength: 13,
                      textFieldController: number2,
                      countries: const [
                        "GB",
                        "FR",
                        "IE",
                        "AT",
                        "DE",
                        "IT",
                        "CH",
                        "ES",
                        "NL",
                        "PT",
                        "TN",
                        "DZ",
                        "MA",
                        "LY",
                      ],
                      onInputChanged: (PhoneNumber number) {
                        controller.phoneNumberof_the_receiver =
                            number.phoneNumber!;
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        useBottomSheetSafeArea: true,
                      ),
                      autoValidateMode: AutovalidateMode.disabled,
                      inputBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius20)),
                    ),
                  ),

                  SizedBox(
                    height: Dimenssions.height20,
                  ),
                  // total kg
                  Row(
                    children: [
                      SizedBox(
                        width: Dimenssions.width10 / 2 + 1,
                      ),
                      Icon(
                        CupertinoIcons.money_euro_circle,
                        size: Dimenssions.icon16 * 2,
                        color: AppColors.iconColor,
                      ),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      const Text(
                        "Total of KG :",
                        style: TextStyle(
                          color: AppColors.mainTextColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimenssions.width30 * 2.6,
                      ),
                      SizedBox(
                        height: Dimenssions.height20 * 4,
                        width: Dimenssions.width30 * 5,
                        child: TextFormField(
                          controller: totalkg,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "100 KG ",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              iconColor: AppColors.iconColor,
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
                            controller.totalkg = double.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),

                  // switcher for home delivery
                  Row(
                    children: [
                      SizedBox(
                        width: Dimenssions.width10 / 2 + 1,
                      ),
                      Icon(
                        CupertinoIcons.car,
                        size: Dimenssions.icon16 * 2,
                        color: AppColors.iconColor,
                      ),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      const Text(
                        "Home Delivery :",
                        style: TextStyle(
                          color: AppColors.mainTextColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimenssions.width30 * 1.7,
                      ),
                      Switch(
                          activeColor: AppColors.buttonColor,
                          value: controller.home_delivery,
                          onChanged: (value) {
                            controller.homedelivery_Change(value);
                          }),
                    ],
                  ),

                  // switcher for home pickups
                  Row(
                    children: [
                      SizedBox(
                        width: Dimenssions.width10 / 2 + 1,
                      ),
                      Icon(
                        CupertinoIcons.car,
                        size: Dimenssions.icon16 * 2,
                        color: AppColors.iconColor,
                      ),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      const Text(
                        "Home pick ups :",
                        style: TextStyle(
                          color: AppColors.mainTextColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimenssions.width30 * 1.7,
                      ),
                      Switch(
                          activeColor: AppColors.buttonColor,
                          value: controller.home_pickups,
                          onChanged: (value) {
                            controller.homepickups_Change(value);
                          }),
                    ],
                  ),
                  SizedBox(
                    height: Dimenssions.height20,
                  ),

                  GestureDetector(
                    onTap: () {
                      // verification input then send the request
                     controller.check_before_send();
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
                          "Send request",
                          style: TextStyle(color: AppColors.insidetextcolor),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: Dimenssions.height20 * 3,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
