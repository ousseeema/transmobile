import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<SettingController>(
      builder: (controller) {
        return Column(
          children: [
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

                },
                child: Icon(
                  Icons.add_a_photo_rounded,
                  color: AppColors.iconColor,
                  size: Dimenssions.icon24,
                ),
              ),
            ),

             SizedBox(height: Dimenssions.height20*3,),
            // name input 
            Row(
              children: [ 
               const  Icon(Icons.person_pin),
                SizedBox(width: Dimenssions.width20,),
                CostumeAnimatedText(text: controller.client!.fullName),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // change  full name page
                  },
                  child: const Icon(Icons.arrow_forward_ios_sharp))
              ],
            ), 
            SizedBox(height: Dimenssions.height20,),
            // address input change
            Row(
              children: [ 
               const  Icon(Icons.location_on),
                SizedBox(width: Dimenssions.width20,),
                CostumeAnimatedText(text: controller.client!.fulladdress),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // go to the change fulladdress page change
                  },
                  child: const Icon(Icons.arrow_forward_ios_sharp))
              ],
            ),
            SizedBox(height: Dimenssions.height20,),

            // phone number
            Row(
              children: [ 
               const  Icon(Icons.phone),
                SizedBox(width: Dimenssions.width20,),
                CostumeAnimatedText(text: controller.client!.phoneNumber),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // go to the change phone number page
                  },
                  child: const Icon(Icons.arrow_forward_ios_sharp))
              ],
            ),
            SizedBox(height: Dimenssions.height20,),
            // phone number input change
            Row(
              children: [ 
               const  Icon(Icons.phone),
                SizedBox(width: Dimenssions.width20,),
                CostumeAnimatedText(text: controller.client!.phoneNumber2),
                const Spacer(),
               GestureDetector(
                  onTap: () {
                    // go to the change phone number2 page
                  },
                  child: const Icon(Icons.arrow_forward_ios_sharp))
              ],
            ),
            SizedBox(height: Dimenssions.height20,),
            // country input change
            Row(
              children: [ 
               const  Icon(BoxIcons.bx_world),
                SizedBox(width: Dimenssions.width20,),
                CostumeAnimatedText(text: controller.client!.country),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // go to the change country page
                  },
                  child: const Icon(Icons.arrow_forward_ios_sharp))
              ],
            )


          ],
        );
      },
    ));
  }
}
