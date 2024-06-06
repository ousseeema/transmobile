import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransHomeController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Client%20components/button.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class AddSinglePackage extends StatefulWidget {
  const AddSinglePackage({super.key});

  @override
  State<AddSinglePackage> createState() => _AddSinglePackageState();
}

class _AddSinglePackageState extends State<AddSinglePackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<transHomeController>(
      builder: ((controller) {
        return  controller.isloading? const Center(child: CircularProgressIndicator(),): 
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
           
            children: [
                SizedBox(
                  height: Dimenssions.height20*2,
                ),
                CostumeAnimatedText(text: "Add Single Package", fontSize: Dimenssions.font20-3,weight: FontWeight.bold,),
                SizedBox(
                  height: Dimenssions.height20 * 2,
                ),
            
            
                // name inpuyt field
                 SizedBox(
                              height: Dimenssions.height20 * 4,
                              width: Dimenssions.width,
                              child: TextFormField(
                               
                              
                                decoration: InputDecoration(
                                  labelText: "FullName",
                                    hintText: "Ex: Oussema ",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                        
                                    
                                     
                                    iconColor: AppColors.iconColor,
                                    enabledBorder: OutlineInputBorder(
                
                                      borderSide: const BorderSide(
                                          color: AppColors.bigTextColor),
                                      borderRadius: BorderRadius.circular(
                                          Dimenssions.radius20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.bigTextColor),
                                        borderRadius: BorderRadius.circular(
                                            Dimenssions.radius20))),
                                onChanged: (value) {
                                  controller.fullname =value;
                                  
                                },
                              ),
                            ),
            
                            SizedBox(height: Dimenssions.height20,),
            
            
                            // phone number input field
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
                               "TN",
                              "DZ",
                              "MA",
                              "LY",
                            ],
                            onInputChanged: (PhoneNumber number) {
                              controller.phoneNumber = number.phoneNumber!;
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              useBottomSheetSafeArea: true,
                            ),
                            autoValidateMode: AutovalidateMode.disabled,
                            inputBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimenssions.radius20)),
                          ),
                        ),
            
            
                        SizedBox(height: Dimenssions.height20,),
                       
            
                       // pick up city input
                         SizedBox(
                              height: Dimenssions.height20 * 4,
                              width: Dimenssions.width,
                              child: TextFormField(
                               
                               keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: "Pickup city",
                                    hintText: "Djerba",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                        
                                    
                                     
                                    iconColor: AppColors.iconColor,
                                    enabledBorder: OutlineInputBorder(
                
                                      borderSide: const BorderSide(
                                          color: AppColors.bigTextColor),
                                      borderRadius: BorderRadius.circular(
                                          Dimenssions.radius20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.bigTextColor),
                                        borderRadius: BorderRadius.circular(
                                            Dimenssions.radius20))),
                                onChanged: (value) {
                                  controller.pickupCity =value;
                                  
                                },
                              ),
                            ),
                            SizedBox(height: Dimenssions.height20,),
            
                             // delivery city input field
                         SizedBox(
                              height: Dimenssions.height20 * 4,
                              width: Dimenssions.width,
                              child: TextFormField(
                               
                               keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "Lyon ",
                                    labelText: "Delivery city",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                        
                                    
                                     
                                    iconColor: AppColors.iconColor,
                                    enabledBorder: OutlineInputBorder(
                
                                      borderSide: const BorderSide(
                                          color: AppColors.bigTextColor),
                                      borderRadius: BorderRadius.circular(
                                          Dimenssions.radius20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.bigTextColor),
                                        borderRadius: BorderRadius.circular(
                                            Dimenssions.radius20))),
                                onChanged: (value) {
                                  controller.DeliveryCity =value;
                                  
                                },
                              ),
                            ),
                    SizedBox(height: Dimenssions.height20,),
                    // row that containes the number of packages and the amount 
            
                     Row(
                          children: [
                            SizedBox(
                              width: Dimenssions.width30 * 1.6,
                            ),
                            SizedBox(
                              height: Dimenssions.height20 * 4,
                             width: Dimenssions.width30 * 5,
                              child: TextField(
                               
             
                                decoration: InputDecoration(
                                    hintText: "00",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    labelText: "Number of packages",
                                    labelStyle: const TextStyle(
                                        color: AppColors.bigTextColor),
                                    iconColor: AppColors.iconColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.bigTextColor),
                                      borderRadius: BorderRadius.circular(
                                          Dimenssions.radius20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.bigTextColor),
                                        borderRadius: BorderRadius.circular(
                                            Dimenssions.radius20))),
                                onChanged: (value) {
                                  controller.numberOfPackages = int.parse(value);
                                },
                              ),
                            ),
                            SizedBox(
                              width: Dimenssions.width20,
                            ),
                            // number of packages input field
                            SizedBox(
                              height: Dimenssions.height20 * 4,
                            width: Dimenssions.width30 * 5,
                              child: TextField(
                               
                                decoration: InputDecoration(
                                    hintText: "00",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    labelText: "Total amount",
                                    labelStyle: const TextStyle(
                                        color: AppColors.bigTextColor),
                                    iconColor: AppColors.iconColor,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.bigTextColor),
                                      borderRadius: BorderRadius.circular(
                                          Dimenssions.radius20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.bigTextColor),
                                        borderRadius: BorderRadius.circular(
                                            Dimenssions.radius20))),
                                onChanged: (value) {
                                  controller.totalamount = int.parse(value);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimenssions.height20,),
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
                              "Home delivery :",
                              style: TextStyle(
                                color: AppColors.mainTextColor,
                              ),
                            ),
                            SizedBox(
                              width: Dimenssions.width30 * 1.7,
                            ),
                            Switch(
                                activeColor: AppColors.buttonColor,
                                value: controller.homeDelivery,
                                onChanged: (value) {
                                  controller.Homedelivery_change(value);
                                }),
                          ],
                        ),
                         SizedBox(height: Dimenssions.height20,),
                        // exact address 
                        SizedBox(
                              height: Dimenssions.height20 * 4,
                              width: Dimenssions.width,
                              child: TextFormField(
                               
                               keyboardType: TextInputType.number,
                              
                                decoration: InputDecoration(
                                    hintText: "Djerba Midoun ",
                                    labelText: "Exact address",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                        
                                    
                                     
                                    iconColor: AppColors.iconColor,
                                    enabledBorder: OutlineInputBorder(
                
                                      borderSide: const BorderSide(
                                          color: AppColors.bigTextColor),
                                      borderRadius: BorderRadius.circular(
                                          Dimenssions.radius20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColors.bigTextColor),
                                        borderRadius: BorderRadius.circular(
                                            Dimenssions.radius20))),
                                onChanged: (value) {
                                  controller.exacteAddress =value;
                                  
                                },
                              ),
                            ),
                            SizedBox(height: Dimenssions.height20*2,),
                            //add package 
                            GestureDetector(
                              onTap: () {
                                // sending the request to the serveur to add a packagge manually
                                controller.addpackage();
                              },
                              child: CostumeButton(height:    Dimenssions.height10 * 5,
                                                width: Dimenssions.width30 * 9, text: "Add Package"),
                            ), 
                    SizedBox(height: Dimenssions.height20,),
                    // reset the form 
                     GestureDetector(
                      onTap: () {
                        // reset function
                        controller.resetForm();
                      },
                       child: CostumeButton(height:    Dimenssions.height10 * 5,
                                         width: Dimenssions.width30 * 9, text: "Reset"),
                     )
            
            
                            
                              
            
               
                
              ],
            ),
          ),
        );
      }),
    ));
  }
}
