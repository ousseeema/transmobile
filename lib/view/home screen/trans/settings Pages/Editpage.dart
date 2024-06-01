// ignore_for_file: non_constant_identifier_names

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:popup_card/popup_card.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransSettingsController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Client%20components/button.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransEditPage extends StatefulWidget {
  const TransEditPage({super.key});

  @override
  State<TransEditPage> createState() => _TransEditPageState();
}

class _TransEditPageState extends State<TransEditPage> {
  String newfullname = "";
  String newLocalAddress = "";
  String newDestinationAddress = "";
  String newPhoneNumber1 = "";
  String newPhoneNumber2 = "";
  String NewLocalCountry = "";
  String NewDestinationCountry = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController newlocaladdressController = TextEditingController();
  TextEditingController newdestinationaddressController =
      TextEditingController();
  TextEditingController Phone1Controller = TextEditingController();
  TextEditingController Phone2Controller = TextEditingController();
  TextEditingController newlocalcountryController = TextEditingController();
  TextEditingController newdestinationcountryController =
      TextEditingController();
  @override
  initState() {
    super.initState();
    newfullname = "";
    newLocalAddress = "";
    newDestinationAddress = "";
    newPhoneNumber1 = "";
    newPhoneNumber2 = "";
    NewLocalCountry = "";
    NewDestinationCountry = "";
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    nameController.dispose();
    newlocaladdressController.dispose();
    newdestinationaddressController.dispose();
    Phone1Controller.dispose();
    Phone2Controller.dispose();
    newlocalcountryController.dispose();
    newdestinationcountryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<TransSettingsController>(
      builder: (controller) {
        return SafeArea(
          child: controller.edit_loading == true
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.only(
                      left: Dimenssions.LRpadmarg20,
                      right: Dimenssions.LRpadmarg20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimenssions.height20 * 2,
                        ),
                        Center(
                            child: controller.selectedImage == null
                                ? ClipOval(
                                    child: Image.network(
                                    "${AppConstant.Transimage}/${controller.transporteur!.profilePicture}",
                                    width: Dimenssions.width30 * 4,
                                    height: Dimenssions.height20 * 6.2,
                                    fit: BoxFit.cover,
                                  ))
                                : ClipOval(
                                    child: Image.file(
                                      controller.selectedImage!,
                                      fit: BoxFit.cover,
                                      width: Dimenssions.width30 * 4,
                                      height: Dimenssions.height20 * 6.2,
                                    ),
                                  )),
                        SizedBox(
                          height: Dimenssions.height10,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              // add a profil pic
                              controller.PickimageFromGallery();
                            },
                            child: Icon(
                              Icons.add_a_photo_rounded,
                              color: AppColors.iconColor,
                              size: Dimenssions.icon24,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: Dimenssions.height20 * 2.5,
                        ),
                        // name input

                        Container(
                          padding:
                              EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                          height: Dimenssions.height20 * 3.5,
                          width: Dimenssions.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius10)),
                          child: Row(
                            children: [
                              const Icon(Icons.person_pin,
                                  color: AppColors.iconColor),
                              SizedBox(
                                width: Dimenssions.width20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Dimenssions.height10,
                                  ),
                                  const Text(
                                    "Full name :",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  CostumeAnimatedText(
                                      text: controller.transporteur!.fullName!),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SimpleDialog(
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            children: [
                                              SizedBox(
                                                height:
                                                    Dimenssions.height20 * 10,
                                                width: Dimenssions.width30 * 11,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20 *
                                                              2,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20 *
                                                              4,
                                                      width: Dimenssions.width -
                                                          Dimenssions.width20,
                                                      child: TextField(
                                                        controller:
                                                            nameController,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    "Enter your new name here",
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        400]),
                                                                labelText:
                                                                    "New fullname",
                                                                labelStyle: const TextStyle(
                                                                    color: AppColors
                                                                        .bigTextColor),
                                                                icon: Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  size: Dimenssions
                                                                          .icon16 *
                                                                      2,
                                                                ),
                                                                iconColor:
                                                                    AppColors
                                                                        .iconColor,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              AppColors.bigTextColor),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          Dimenssions
                                                                              .radius20),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: AppColors
                                                                            .bigTextColor),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            Dimenssions.radius20))),
                                                        onChanged: (value) {
                                                          newfullname = value;
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20,
                                                    ),
                                                    // buttons
                                                    Row(
                                                      children: [
                                                        const Spacer(),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                      .newfullname =
                                                                  newfullname
                                                                      .trim();
                                                              Get.back();
                                                            },
                                                            child: CostumeButton(
                                                                height: Dimenssions
                                                                        .height20 *
                                                                    2,
                                                                width: Dimenssions
                                                                        .width30 *
                                                                    3,
                                                                text: "Save")),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width20,
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .newfullname = "";
                                                              newfullname = "";
                                                              Get.back();
                                                            },
                                                            child: CostumeButton(
                                                                height: Dimenssions
                                                                        .height20 *
                                                                    2,
                                                                width: Dimenssions
                                                                        .width30 *
                                                                    3,
                                                                text:
                                                                    "Unsave")),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width20,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: const Icon(Icons.arrow_forward_ios)),
                              SizedBox(
                                width: Dimenssions.width20,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimenssions.height10,
                        ),
                        // change local  address 
                        Container(
                          padding:
                              EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                          height: Dimenssions.height20 * 3.5,
                          width: Dimenssions.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius10)),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: AppColors.iconColor),
                              SizedBox(
                                width: Dimenssions.width20,
                              ),
                              CostumeAnimatedText(
                                  text: controller.transporteur!.localAddress!),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SimpleDialog(
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            children: [
                                              SizedBox(
                                                height:
                                                    Dimenssions.height20 * 10,
                                                width: Dimenssions.width30 * 11,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20 *
                                                              2,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20 *
                                                              4,
                                                      width: Dimenssions.width -
                                                          Dimenssions.width20,
                                                      child: TextField(
                                                        controller:
                                                            newlocaladdressController,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    "Enter your new Adress here",
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        400]),
                                                                labelText:
                                                                    "New Address",
                                                                labelStyle: const TextStyle(
                                                                    color: AppColors
                                                                        .bigTextColor),
                                                                icon: Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  size: Dimenssions
                                                                          .icon16 *
                                                                      2,
                                                                ),
                                                                iconColor:
                                                                    AppColors
                                                                        .iconColor,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              AppColors.bigTextColor),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          Dimenssions
                                                                              .radius20),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: AppColors
                                                                            .bigTextColor),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            Dimenssions.radius20))),
                                                        onChanged: (value) {
                                                          newLocalAddress =
                                                              value;
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20,
                                                    ),
                                                    // buttons
                                                    Row(
                                                      children: [
                                                        const Spacer(),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                      .newLocalAddress =
                                                                  newLocalAddress
                                                                      .trim();
                                                              Get.back();
                                                            },
                                                            child: CostumeButton(
                                                                height: Dimenssions
                                                                        .height20 *
                                                                    2,
                                                                width: Dimenssions
                                                                        .width30 *
                                                                    3,
                                                                text: "Save")),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width20,
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .newLocalAddress = "";
                                                              newLocalAddress =
                                                                  "";
                                                              Get.back();
                                                            },
                                                            child: CostumeButton(
                                                                height: Dimenssions
                                                                        .height20 *
                                                                    2,
                                                                width: Dimenssions
                                                                        .width30 *
                                                                    3,
                                                                text:
                                                                    "Unsave")),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width20,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: const Icon(Icons.arrow_forward_ios)),
                              SizedBox(
                                width: Dimenssions.width20,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimenssions.height10,
                        ),
                        // change destination address
                        Container(
                          padding:
                              EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                          height: Dimenssions.height20 * 3.5,
                          width: Dimenssions.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius10)),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: AppColors.iconColor),
                              SizedBox(
                                width: Dimenssions.width20,
                              ),
                              CostumeAnimatedText(
                                  text: controller.transporteur!.DestinationAddress),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SimpleDialog(
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            children: [
                                              SizedBox(
                                                height:
                                                    Dimenssions.height20 * 10,
                                                width: Dimenssions.width30 * 11,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20 *
                                                              2,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20 *
                                                              4,
                                                      width: Dimenssions.width -
                                                          Dimenssions.width20,
                                                      child: TextField(
                                                        controller:
                                                            newlocaladdressController,
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    "Enter your new Adress here",
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        400]),
                                                                labelText:
                                                                    "New Address",
                                                                labelStyle: const TextStyle(
                                                                    color: AppColors
                                                                        .bigTextColor),
                                                                icon: Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  size: Dimenssions
                                                                          .icon16 *
                                                                      2,
                                                                ),
                                                                iconColor:
                                                                    AppColors
                                                                        .iconColor,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              AppColors.bigTextColor),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          Dimenssions
                                                                              .radius20),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: AppColors
                                                                            .bigTextColor),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            Dimenssions.radius20))),
                                                        onChanged: (value) {
                                                          newDestinationAddress =
                                                              value;
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20,
                                                    ),
                                                    // buttons
                                                    Row(
                                                      children: [
                                                        const Spacer(),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                      .newDestinationAddress =
                                                                  newDestinationAddress
                                                                      .trim();
                                                              Get.back();
                                                            },
                                                            child: CostumeButton(
                                                                height: Dimenssions
                                                                        .height20 *
                                                                    2,
                                                                width: Dimenssions
                                                                        .width30 *
                                                                    3,
                                                                text: "Save")),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width20,
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .newDestinationAddress = "";
                                                              newDestinationAddress =
                                                                  "";
                                                              Get.back();
                                                            },
                                                            child: CostumeButton(
                                                                height: Dimenssions
                                                                        .height20 *
                                                                    2,
                                                                width: Dimenssions
                                                                        .width30 *
                                                                    3,
                                                                text:
                                                                    "Unsave")),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width20,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: const Icon(Icons.arrow_forward_ios)),
                              SizedBox(
                                width: Dimenssions.width20,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimenssions.height10,
                        ),

                        // phone number
                        Container(
                          padding:
                              EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                          height: Dimenssions.height20 * 3.5,
                          width: Dimenssions.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius10)),
                          child: Row(
                            children: [
                              const Icon(Icons.phone,
                                  color: AppColors.iconColor),
                              SizedBox(
                                width: Dimenssions.width20,
                              ),
                              CostumeAnimatedText(
                                  text: controller.transporteur!.phoneNumberB!),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: SizedBox(
                                              height: Dimenssions.height20 * 10,
                                              width: Dimenssions.width30 * 11,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        Dimenssions.height20 *
                                                            2,
                                                  ),
                                                  Container(
                                                    height:
                                                        Dimenssions.height20 *
                                                            4,
                                                    margin: EdgeInsets.only(
                                                      left: Dimenssions
                                                          .LRpadmarg20,
                                                    ),
                                                    width: Dimenssions.width -
                                                        Dimenssions.width20 * 2,
                                                    child:
                                                        InternationalPhoneNumberInput(
                                                      textFieldController:
                                                          Phone1Controller,
                                                      countries: const [
                                                        "TN",
                                                        "DZ",
                                                        "MA",
                                                        "LY",
                                                      ],
                                                      onInputChanged:
                                                          (PhoneNumber number) {
                                                        newPhoneNumber1 =
                                                            number.phoneNumber!;
                                                      },
                                                      selectorConfig:
                                                          const SelectorConfig(
                                                        selectorType:
                                                            PhoneInputSelectorType
                                                                .BOTTOM_SHEET,
                                                        useBottomSheetSafeArea:
                                                            true,
                                                      ),
                                                      autoValidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      inputBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  Dimenssions
                                                                      .radius20)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        Dimenssions.height20,
                                                  ),
                                                  // buttons
                                                  Row(
                                                    children: [
                                                      const Spacer(),
                                                      GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                    .newphonenumber1 =
                                                                newPhoneNumber1
                                                                    .trim();
                                                            Get.back();
                                                          },
                                                          child: CostumeButton(
                                                              height: Dimenssions
                                                                      .height20 *
                                                                  2,
                                                              width: Dimenssions
                                                                      .width30 *
                                                                  3,
                                                              text: "Save")),
                                                      SizedBox(
                                                        width:
                                                            Dimenssions.width20,
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .newphonenumber1 = "";
                                                            newPhoneNumber1 =
                                                                "";
                                                            Get.back();
                                                          },
                                                          child: CostumeButton(
                                                              height: Dimenssions
                                                                      .height20 *
                                                                  2,
                                                              width: Dimenssions
                                                                      .width30 *
                                                                  3,
                                                              text: "Unsave")),
                                                      SizedBox(
                                                        width:
                                                            Dimenssions.width20,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: const Icon(Icons.arrow_forward_ios)),
                              SizedBox(
                                width: Dimenssions.width20,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimenssions.height10,
                        ),
                        // phone number input change
                        Container(
                          padding:
                              EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                          height: Dimenssions.height20 * 3.5,
                          width: Dimenssions.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius10)),
                          child: Row(
                            children: [
                              const Icon(Icons.phone,
                                  color: AppColors.iconColor),
                              SizedBox(
                                width: Dimenssions.width20,
                              ),
                              CostumeAnimatedText(
                                  text: controller.transporteur!.phoneNumberA!),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: SizedBox(
                                              height: Dimenssions.height20 * 10,
                                              width: Dimenssions.width30 * 11,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        Dimenssions.height20 *
                                                            2,
                                                  ),
                                                  Container(
                                                    height:
                                                        Dimenssions.height20 *
                                                            4,
                                                    margin: EdgeInsets.only(
                                                      left: Dimenssions
                                                          .LRpadmarg20,
                                                    ),
                                                    width: Dimenssions.width -
                                                        Dimenssions.width20 * 2,
                                                    child:
                                                        InternationalPhoneNumberInput(
                                                      textFieldController:
                                                          Phone2Controller,
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
                                                      ],
                                                      onInputChanged:
                                                          (PhoneNumber number) {
                                                        newPhoneNumber2 =
                                                            number.phoneNumber!;
                                                      },
                                                      selectorConfig:
                                                          const SelectorConfig(
                                                        selectorType:
                                                            PhoneInputSelectorType
                                                                .BOTTOM_SHEET,
                                                        useBottomSheetSafeArea:
                                                            true,
                                                      ),
                                                      autoValidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      inputBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  Dimenssions
                                                                      .radius20)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        Dimenssions.height20,
                                                  ),
                                                  // buttons
                                                  Row(
                                                    children: [
                                                      const Spacer(),
                                                      GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                    .newphonenumber2 =
                                                                newPhoneNumber2
                                                                    .trim();
                                                            Get.back();
                                                          },
                                                          child: CostumeButton(
                                                              height: Dimenssions
                                                                      .height20 *
                                                                  2,
                                                              width: Dimenssions
                                                                      .width30 *
                                                                  3,
                                                              text: "Save")),
                                                      SizedBox(
                                                        width:
                                                            Dimenssions.width20,
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .newphonenumber2 = "";
                                                            newPhoneNumber2 =
                                                                "";
                                                            Get.back();
                                                          },
                                                          child: CostumeButton(
                                                              height: Dimenssions
                                                                      .height20 *
                                                                  2,
                                                              width: Dimenssions
                                                                      .width30 *
                                                                  3,
                                                              text: "Unsave")),
                                                      SizedBox(
                                                        width:
                                                            Dimenssions.width20,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: const Icon(Icons.arrow_forward_ios)),
                              SizedBox(
                                width: Dimenssions.width20,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimenssions.height10,
                        ),
                        // local country input change
                        Container(
                          padding:
                              EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                          height: Dimenssions.height20 * 3.5,
                          width: Dimenssions.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius10)),
                          child: Row(
                            children: [
                              const Icon(BoxIcons.bx_world,
                                  color: AppColors.iconColor),
                              SizedBox(
                                width: Dimenssions.width20,
                              ),
                              CostumeAnimatedText(
                                  text: controller.transporteur!.listCountry1),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SimpleDialog(
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            children: [
                                              SizedBox(
                                                height:
                                                    Dimenssions.height20 * 10,
                                                width: Dimenssions.width30 * 11,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20 *
                                                              2,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width10,
                                                        ),
                                                        Icon(
                                                          BoxIcons.bx_world,
                                                          size: Dimenssions
                                                                  .icon16 *
                                                              2,
                                                          color: AppColors
                                                              .iconColor,
                                                        ),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width10,
                                                        ),
                                                        const Text("Country :"),
                                                        CountryCodePicker(
                                                          showOnlyCountryWhenClosed:
                                                              true,
                                                          showCountryOnly: true,
                                                          initialSelection:
                                                              'FR',
                                                          countryFilter: const [
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
                                                          ],
                                                          onChanged: (country) {
                                                            NewLocalCountry =
                                                                country.name!;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20,
                                                    ),
                                                    // buttons
                                                    Row(
                                                      children: [
                                                        const Spacer(),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                      .NewLocalCountry =
                                                                  NewLocalCountry
                                                                      .trim();
                                                              Get.back();
                                                            },
                                                            child: CostumeButton(
                                                                height: Dimenssions
                                                                        .height20 *
                                                                    2,
                                                                width: Dimenssions
                                                                        .width30 *
                                                                    3,
                                                                text: "Save")),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width20,
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .NewLocalCountry = "";
                                                              Get.back();
                                                            },
                                                            child: CostumeButton(
                                                                height: Dimenssions
                                                                        .height20 *
                                                                    2,
                                                                width: Dimenssions
                                                                        .width30 *
                                                                    3,
                                                                text:
                                                                    "Unsave")),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width20,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: const Icon(Icons.arrow_forward_ios)),
                              SizedBox(
                                width: Dimenssions.width20,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimenssions.height10,
                        ),
                        //destination country input change
                        Container(
                          padding:
                              EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                          height: Dimenssions.height20 * 3.5,
                          width: Dimenssions.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius10)),
                          child: Row(
                            children: [
                              const Icon(BoxIcons.bx_world,
                                  color: AppColors.iconColor),
                              SizedBox(
                                width: Dimenssions.width20,
                              ),
                              CostumeAnimatedText(
                                  text: controller.transporteur!.listCountry2),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SimpleDialog(
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            children: [
                                              SizedBox(
                                                height:
                                                    Dimenssions.height20 * 10,
                                                width: Dimenssions.width30 * 11,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20 *
                                                              2,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width10,
                                                        ),
                                                        Icon(
                                                          BoxIcons.bx_world,
                                                          size: Dimenssions
                                                                  .icon16 *
                                                              2,
                                                          color: AppColors
                                                              .iconColor,
                                                        ),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width10,
                                                        ),
                                                        const Text("Country :"),
                                                        CountryCodePicker(
                                                          showOnlyCountryWhenClosed:
                                                              true,
                                                          showCountryOnly: true,
                                                          initialSelection:
                                                              'TN',
                                                          countryFilter: const [
                                                            "TN",
                                                            "DZ",
                                                            "MA",
                                                            "LY",
                                                          ],
                                                          onChanged: (country) {
                                                            NewDestinationCountry =
                                                                country.name!;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimenssions.height20,
                                                    ),
                                                    // buttons
                                                    Row(
                                                      children: [
                                                        const Spacer(),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                      .NewDestinationCountry =
                                                                  NewDestinationCountry
                                                                      .trim();
                                                              Get.back();
                                                            },
                                                            child: CostumeButton(
                                                                height: Dimenssions
                                                                        .height20 *
                                                                    2,
                                                                width: Dimenssions
                                                                        .width30 *
                                                                    3,
                                                                text: "Save")),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width20,
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .NewDestinationCountry = "";
                                                              Get.back();
                                                            },
                                                            child: CostumeButton(
                                                                height: Dimenssions
                                                                        .height20 *
                                                                    2,
                                                                width: Dimenssions
                                                                        .width30 *
                                                                    3,
                                                                text:
                                                                    "Unsave")),
                                                        SizedBox(
                                                          width: Dimenssions
                                                              .width20,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: const Icon(Icons.arrow_forward_ios)),
                              SizedBox(
                                width: Dimenssions.width20,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimenssions.height20 * 3,
                        ),

                        GestureDetector(
                            onTap: () {
                              // validate the input the update the user details in trhe data base
                              controller.EditProfile();
                            },
                            child: CostumeButton(
                                height: Dimenssions.height10 * 5,
                                width: Dimenssions.width30 * 9,
                                text: "Update Information")),
                        SizedBox(
                          height: Dimenssions.height20 * 3,
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    ));
  }
}
