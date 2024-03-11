import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:transmobile/controller/authController/signinController.dart';
import 'package:transmobile/controller/client%20trans%20details/transmoreDetails.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransDetails extends StatefulWidget {
  const TransDetails({super.key});

  @override
  State<TransDetails> createState() => _TransDetailsState();
}

class _TransDetailsState extends State<TransDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<transDetaislController>(
      builder: (controller) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Dimenssions.height20 * 15,
                width: Dimenssions.width,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        child: Container(
                          height: Dimenssions.height20 * 10,
                          width: Dimenssions.width,
                          decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(Dimenssions.radius20),
                                  bottomRight:
                                      Radius.circular(Dimenssions.radius20))),
                        )),
                    Positioned(
                        top: Dimenssions.height20 * 1.5,
                        right: Dimenssions.width20,
                        child: GestureDetector(
                          onTap: () {
                            //!affiche les info sur cette  page
                          },
                          child: Icon(
                            Icons.info,
                            color: AppColors.iconColor,
                            size: Dimenssions.icon24 + 2,
                          ),
                        )),
                    Positioned(
                      top: Dimenssions.height20 * 1.5,
                      left: Dimenssions.width30 * 5,
                      child: Text(
                        "More details",
                        style: TextStyle(
                            color: AppColors.mainTextColor,
                            fontSize: Dimenssions.font20),
                      ),
                    ),
                    Positioned(
                        top: Dimenssions.height20 * 6,
                        right: Dimenssions.width30,
                        left: Dimenssions.width30,
                        child: Container(
                          height: Dimenssions.height20 * 8,
                          width: Dimenssions.width - Dimenssions.width30 * 2,
                          decoration: BoxDecoration(
                              color: AppColors.hintTextColor,
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius20)),
                        )),
                    Positioned(
                        top: Dimenssions.height20 * 4,
                        left: Dimenssions.width30 * 5,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            child: controller.selectedImage == null
                                ? ClipOval(
                                    child: Image(
                                        width: Dimenssions.width30 * 4,
                                        height: Dimenssions.height20 * 6.2,
                                        fit: BoxFit.cover,
                                        image: const AssetImage(
                                            "assets/images/oussema.JPG")),
                                  )
                                : ClipOval(
                                    child: Image.file(
                                      controller.selectedImage!,
                                      fit: BoxFit.cover,
                                      width: 130,
                                      height: 130,
                                    ),
                                  ))),
                    Positioned(
                        top: Dimenssions.height20 * 8.5,
                        left: Dimenssions.width30 * 8,
                        child: GestureDetector(
                          onTap: () {
                            /// add a image from the gallery
                            controller.PickimageFromGallery();
                          },
                          child: Container(
                            height: Dimenssions.height20 * 2,
                            width: Dimenssions.height20 * 2,
                            decoration: BoxDecoration(
                                color: AppColors.iconColor,
                                borderRadius: BorderRadius.circular(
                                    Dimenssions.radius10)),
                            child: Icon(
                              Icons.add_circle_outline_sharp,
                              size: Dimenssions.icon24,
                            ),
                          ),
                        )),
                    Positioned(
                        top: Dimenssions.height20 * 11,
                        left: Dimenssions.width30 * 4,
                        child: (controller.selectedImage == null
                            ? const Text(
                                "Please select a profile image",
                                style: TextStyle(
                                  color: AppColors.insidetextcolor,
                                ),
                              )
                            : const Text(""))),
                  ],
                ),
              ),
              

              // ! list view for the input
              SizedBox(
                height: Dimenssions.height- Dimenssions.height20 * 17 -Dimenssions.height10 * 5,
                width: Dimenssions.width,
                child: ListView(
                  children: [
                    Container(
                      height: Dimenssions.height20 * 4,
                      margin: EdgeInsets.only(
                        left: Dimenssions.LRpadmarg20,
                      ),
                      width: Dimenssions.width - Dimenssions.width20 * 2,
                      child: InternationalPhoneNumberInput(
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
                        onInputChanged: (PhoneNumber number) {
                          controller.phone_Numeber1 = number.phoneNumber!;
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
                    Container(
                      height: Dimenssions.height20 * 4,
                      margin: EdgeInsets.only(
                        left: Dimenssions.LRpadmarg20,
                      ),
                      width: Dimenssions.width - Dimenssions.width20 * 2,
                      child: InternationalPhoneNumberInput(
                        countries: const [
                          "TN",
                          "DZ",
                          "MA",
                          "LY",
                        ],
                        onInputChanged: (PhoneNumber number) {
                          controller.phone_Numeber2 = number.phoneNumber!;
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
                    SizedBox(
                      height: Dimenssions.height20 * 4,
                      width: Dimenssions.width - Dimenssions.width20,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText:
                                "23 Rue de Grenell,75700 PARIS CEDEX,FRANCE ",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            labelText: "Local Address",
                            labelStyle:
                                const TextStyle(color: AppColors.bigTextColor),
                            icon: Icon(
                              Icons.location_on,
                              size: Dimenssions.icon16 * 2,
                            ),
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
                          controller.Localaddress = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: Dimenssions.height20,
                    ),
                    SizedBox(
                      height: Dimenssions.height20 * 4,
                      width: Dimenssions.width - Dimenssions.width20,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText:
                                "23 Rue de Grenell,75700 PARIS CEDEX,FRANCE ",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            labelText: "Destination address",
                            labelStyle:
                                const TextStyle(color: AppColors.bigTextColor),
                            icon: Icon(
                              Icons.location_on,
                              size: Dimenssions.icon16 * 2,
                            ),
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
                          controller.destination = value;
                        },
                      ),
                    ),
                    
                    Row(
                      children: [
                        SizedBox(
                          width: Dimenssions.width10/2,
                        ),
                        Icon(Icons.home_outlined,
                         size: Dimenssions.icon16 * 2,
                         color: AppColors.iconColor,),
                        SizedBox(
                          width: Dimenssions.width10 * 2,
                        ),
                        const Text(
                          "Local Country :",
                          style: TextStyle(
                            color: AppColors.mainTextColor,
                          ),
                        ),
                        SizedBox(width: Dimenssions.width20*2.3,),
                        CountryCodePicker(
                          initialSelection: 'FR',
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
                            controller.Localaddress = country.name!;
                          },
                        ),
                      ],
                    ),
                     Row(
                      children: [
                        SizedBox(
                          width: Dimenssions.width10/2,
                        ),
                        Icon(Icons.home_outlined,
                         size: Dimenssions.icon16 * 2,
                         color: AppColors.iconColor,),
                        SizedBox(
                          width: Dimenssions.width20,
                        ),
                        const Text(
                          "Destination Country :",
                          style: TextStyle(
                            color: AppColors.mainTextColor,
                          ),
                        ),
                        CountryCodePicker(
                          initialSelection: 'TN',
                          countryFilter: const [
                           "TN",
                           "DZ",
                           "MA",
                           "LY",
                          ],
                          onChanged: (country) {
                            controller.destination = country.name!;
                            },
                        ),
                      ],
                    ),
                    
                     Row(
                      children: [
                         SizedBox(
                          width: Dimenssions.width10/2,
                        ),
                        Icon(CupertinoIcons.car,
                         size: Dimenssions.icon16 * 2,
                         color: AppColors.iconColor,),
                         SizedBox(width: Dimenssions.width20,),
                        const Text("Home pick ups :",style: TextStyle(
                          color: AppColors.mainTextColor,
                        ),),

                        Switch(
                          value: controller.home_pickups,
                           onChanged: (value){
                            controller.homepickups_Change(value);

                           })
                      ],
                     ) 
                  ],
                ),
              ),
              GestureDetector(
                      onTap: () {
                        // verification input then go to teh next page
                        controller.check_before_send();

                        // if the response from the server is sucess and the input verification if good then o to the home page
                        if (controller.response_success) {
                          //Get.offAll(()=> TransHomePage());
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
                            "Update Information",
                            style: TextStyle(color: AppColors.insidetextcolor),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ));
      },
    ));
  }
}
