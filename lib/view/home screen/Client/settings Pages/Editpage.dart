import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:popup_card/popup_card.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/components/button.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String newfullname = "";
  String newAddress = "";
  String newPhoneNumber1 = "";
  String newPhoneNumber2 = "";
  String NewCountry ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<SettingController>(
      builder: (controller) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: Dimenssions.LRpadmarg30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Dimenssions.height20*4,
                  ),
                  Center(
                      child: controller.selectedImage == null
                          ? ClipOval(
                              child: Image.network(
                              "${AppConstant.Clientimage}${controller.client!.profilePicture}",
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
                    height: Dimenssions.height20 * 5,
                  ),
                  // name input

                  Row(
                    children: [
                      const Icon(Icons.person_pin,  color: AppColors.iconColor),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      CostumeAnimatedText(text: controller.client!.fullName),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    contentPadding: const EdgeInsets.all(10),
                                    children: [
                                      SizedBox(
                                        height: Dimenssions.height20 * 10,
                                        width: Dimenssions.width30 * 11,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: Dimenssions.height20 * 2,
                                            ),
                                            SizedBox(
                                              height: Dimenssions.height20 * 4,
                                              width: Dimenssions.width -
                                                  Dimenssions.width20,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "Enter your new name here",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Colors.grey[400]),
                                                    labelText: "New fullname",
                                                    labelStyle: const TextStyle(
                                                        color: AppColors
                                                            .bigTextColor),
                                                    icon: Icon(
                                                      Icons.location_on,
                                                      size: Dimenssions.icon16 *
                                                          2,
                                                    ),
                                                    iconColor:
                                                        AppColors.iconColor,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: AppColors
                                                                  .bigTextColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimenssions
                                                                  .radius20),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: AppColors
                                                                    .bigTextColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimenssions
                                                                    .radius20))),
                                                onChanged: (value) {
                                                  newfullname = value;
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: Dimenssions.height20,
                                            ),
                                            // buttons
                                            Row(
                                              children: [
                                                const Spacer(),
                                                GestureDetector(
                                                    onTap: () {
                                                      controller.newfullname =
                                                          newfullname.trim();
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
                                                  width: Dimenssions.width20,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      controller.newfullname =
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
                                                  width: Dimenssions.width20,
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
                  SizedBox(
                    height: Dimenssions.height20 * 2,
                  ),
                  // change address filed
                  Row(
                    children: [
                      const Icon(Icons.location_on,  color: AppColors.iconColor),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      CostumeAnimatedText(text: controller.client!.fulladdress),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    contentPadding: const EdgeInsets.all(10),
                                    children: [
                                      SizedBox(
                                        height: Dimenssions.height20 * 10,
                                        width: Dimenssions.width30 * 11,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: Dimenssions.height20 * 2,
                                            ),
                                            SizedBox(
                                              height: Dimenssions.height20 * 4,
                                              width: Dimenssions.width -
                                                  Dimenssions.width20,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "Enter your new Adress here",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Colors.grey[400]),
                                                    labelText: "New Address",
                                                    labelStyle: const TextStyle(
                                                        color: AppColors
                                                            .bigTextColor),
                                                    icon: Icon(
                                                      Icons.location_on,
                                                      size: Dimenssions.icon16 *
                                                          2,
                                                    ),
                                                    iconColor:
                                                        AppColors.iconColor,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: AppColors
                                                                  .bigTextColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimenssions
                                                                  .radius20),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: AppColors
                                                                    .bigTextColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimenssions
                                                                    .radius20))),
                                                onChanged: (value) {
                                                  newAddress = value;
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: Dimenssions.height20,
                                            ),
                                            // buttons
                                            Row(
                                              children: [
                                                const Spacer(),
                                                GestureDetector(
                                                    onTap: () {
                                                      controller.newaddress =
                                                          newAddress.trim();
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
                                                  width: Dimenssions.width20,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      controller.newaddress =
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
                                                  width: Dimenssions.width20,
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
                  SizedBox(
                    height: Dimenssions.height20 * 2,
                  ),

                  // phone number
                  Row(
                    children: [
                      const Icon(Icons.phone,  color: AppColors.iconColor),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      CostumeAnimatedText(text: controller.client!.phoneNumber),
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
                                            height: Dimenssions.height20 * 2,
                                          ),
                                          Container(
                                            height: Dimenssions.height20 * 4,
                                            margin: EdgeInsets.only(
                                              left: Dimenssions.LRpadmarg20,
                                            ),
                                            width: Dimenssions.width -
                                                Dimenssions.width20 * 2,
                                            child:
                                                InternationalPhoneNumberInput(
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
                                                useBottomSheetSafeArea: true,
                                              ),
                                              autoValidateMode:
                                                  AutovalidateMode.disabled,
                                              inputBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimenssions
                                                              .radius20)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimenssions.height20,
                                          ),
                                          // buttons
                                          Row(
                                            children: [
                                              const Spacer(),
                                              GestureDetector(
                                                  onTap: () {
                                                    controller.newphonenumber1 =
                                                        newAddress.trim();
                                                    Get.back();
                                                  },
                                                  child: CostumeButton(
                                                      height:
                                                          Dimenssions.height20 *
                                                              2,
                                                      width:
                                                          Dimenssions.width30 *
                                                              3,
                                                      text: "Save")),
                                              SizedBox(
                                                width: Dimenssions.width20,
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    controller.newphonenumber1 =
                                                        "";
                                                    Get.back();
                                                  },
                                                  child: CostumeButton(
                                                      height:
                                                          Dimenssions.height20 *
                                                              2,
                                                      width:
                                                          Dimenssions.width30 *
                                                              3,
                                                      text: "Unsave")),
                                              SizedBox(
                                                width: Dimenssions.width20,
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
                  SizedBox(
                    height: Dimenssions.height20 * 2,
                  ),
                  // phone number input change
                  Row(
                    children: [
                      const Icon(Icons.phone,  color: AppColors.iconColor),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      CostumeAnimatedText(
                          text: controller.client!.phoneNumber2),
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
                                            height: Dimenssions.height20 * 2,
                                          ),
                                          Container(
                                            height: Dimenssions.height20 * 4,
                                            margin: EdgeInsets.only(
                                              left: Dimenssions.LRpadmarg20,
                                            ),
                                            width: Dimenssions.width -
                                                Dimenssions.width20 * 2,
                                            child:
                                                InternationalPhoneNumberInput(
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
                                                useBottomSheetSafeArea: true,
                                              ),
                                              autoValidateMode:
                                                  AutovalidateMode.disabled,
                                              inputBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimenssions
                                                              .radius20)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimenssions.height20,
                                          ),
                                          // buttons
                                          Row(
                                            children: [
                                              const Spacer(),
                                              GestureDetector(
                                                  onTap: () {
                                                    controller.newphonenumber2 =
                                                        newAddress.trim();
                                                    Get.back();
                                                  },
                                                  child: CostumeButton(
                                                      height:
                                                          Dimenssions.height20 *
                                                              2,
                                                      width:
                                                          Dimenssions.width30 *
                                                              3,
                                                      text: "Save")),
                                              SizedBox(
                                                width: Dimenssions.width20,
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    controller.newphonenumber2 =
                                                        "";
                                                    Get.back();
                                                  },
                                                  child: CostumeButton(
                                                      height:
                                                          Dimenssions.height20 *
                                                              2,
                                                      width:
                                                          Dimenssions.width30 *
                                                              3,
                                                      text: "Unsave")),
                                              SizedBox(
                                                width: Dimenssions.width20,
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
                  SizedBox(
                    height: Dimenssions.height20 * 2,
                  ),
                  // country input change
                  Row(
                    children: [
                      const Icon(BoxIcons.bx_world,  color: AppColors.iconColor),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      CostumeAnimatedText(text: controller.client!.country),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    contentPadding: const EdgeInsets.all(10),
                                    children: [
                                      SizedBox(
                                        height: Dimenssions.height20 * 10,
                                        width: Dimenssions.width30 * 11,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: Dimenssions.height20 * 2,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: Dimenssions.width10,
                                                ),
                                                Icon(
                                                  BoxIcons.bx_world,
                                                  size: Dimenssions.icon16 * 2,
                                                  color: AppColors.iconColor,
                                                ),
                                                SizedBox(width: Dimenssions.width10,),
                                               const  Text("Country :"),
                                                
                                                
                                                
                                                CountryCodePicker(
                                                  showOnlyCountryWhenClosed:
                                                      true,
                                                  showCountryOnly: true,
                                                  initialSelection: 'TN',
                                                  countryFilter: const [
                                                    "TN",
                                                    "DZ",
                                                    "MA",
                                                    "LY",
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
                                                    NewCountry =
                                                        country.name!;
                                                  },
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Dimenssions.height20,
                                            ),
                                            // buttons
                                            Row(
                                              children: [
                                                const Spacer(),
                                                GestureDetector(
                                                    onTap: () {
                                                      controller.newcountry =
                                                          NewCountry.trim();
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
                                                  width: Dimenssions.width20,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      controller.newcountry =
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
                                                  width: Dimenssions.width20,
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
                          SizedBox(width: Dimenssions.width20,)
                    ],
                  )
              ,
              SizedBox(height: Dimenssions.height20*3,),
             
             
               GestureDetector(
                onTap: () {
                  // validate the input the update the user details in trhe data base 
                },
                child: CostumeButton(height: Dimenssions.height10 * 5, width: Dimenssions.width30 * 9, text: "Update Information"))
               
               
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
