import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
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
                          bottomLeft: Radius.circular(Dimenssions.radius20),
                          bottomRight: Radius.circular(Dimenssions.radius20))),
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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: controller.selectedImage == null
                        ? const ClipOval(
                            child: Image(
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/oussema.JPG")),
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
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius10)),
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
            Positioned(
                top: Dimenssions.height20 * 17,
                child: Container(
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
                      "DE ",
                      "IT",
                      "CH",
                      "ES",
                      "NL",
                      "PT",
                    ],
                    onInputValidated: (value) {},
                    onInputChanged: (PhoneNumber number) {},
                    onSaved: (PhoneNumber number) {
                      // save the number in the variable in the controller
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
                )),
              Positioned(
                top: Dimenssions.height20 * 21.5,
                child: Container(
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
                  
                   
                    validator: (p0) {
                      return "heeloo";
                    },
                    onInputChanged: (PhoneNumber number) {
                      
                      

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
                )),
                Positioned(
                      top: Dimenssions.height20 * 27,
                  child: 
                    Container(
                      height: 80,
                      width: 200,
                      
                      
                    ))
                
          ],
        ));
      },
    ));
  }
}
