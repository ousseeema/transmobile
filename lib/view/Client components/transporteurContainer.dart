// ignore_for_file: must_be_immutable, unnecessary_import, file_names, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransporterContainer extends StatelessWidget {
  String imageurl;
  String transporteurName;
  String address1;
   String address2;
  String Country;
  String phoneNumber1;
  String phoneNumber2;
  String coast;

  TransporterContainer(
      {super.key,
      required this.phoneNumber1,
      required this.phoneNumber2,
      required this.Country,
      required this.address1,
       required this.address2,
      required this.coast,
      required this.imageurl,
      required this.transporteurName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
      child: Container(
        height: Dimenssions.height20 * 9,
        width: Dimenssions.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 8), // changes position of shadow
              ),
            ],
            color: Colors.grey,
            borderRadius: BorderRadius.circular(Dimenssions.radius20)),
        child: Column(
          children: [
            SizedBox(
              height: Dimenssions.height10,
            ),
            Row(
              children: [
                SizedBox(
                  width: Dimenssions.width20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    // Adjust the radius to match the container's borderRadius
                    child: Image.network(
                      "${AppConstant.Transimage}/${imageurl}",
                      height: Dimenssions.height20 * 3,
                      width: Dimenssions.width20 * 3,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  width: Dimenssions.width20,
                ),
                CostumeAnimatedText(
                  text: transporteurName,
                  fontSize: Dimenssions.font20 - 4,
                  weight: FontWeight.bold,
                ),
               const  Spacer(),
                const Icon(
                  BoxIcons.bx_world,
                  color: AppColors.iconColor,
                ),
                SizedBox(
                  width: Dimenssions.width10,
                ),
                CostumeAnimatedText(
                  text: Country,
                  fontSize: Dimenssions.font20 - 4,
                  color: AppColors.insidetextcolor,
                ),
                SizedBox(
                  width: Dimenssions.width20,
                )
              ],
            ),
            SizedBox(
              height: Dimenssions.height10,
            ),
            Row(
              children: [
                SizedBox(
                    width: Dimenssions.width30 ,
                ),
                const Icon(
                  Icons.location_on,
                  color: AppColors.iconColor,
                ),
                CostumeAnimatedText(
                  text: address1,
                  fontSize: Dimenssions.font20 - 4,
                  color: AppColors.insidetextcolor,
                ),
                SizedBox(
                  width: Dimenssions.width10/2,
                ),
               
               
                const Icon(
                  Icons.phone,
                  color: AppColors.iconColor,
                ),
                CostumeAnimatedText(
                  text: phoneNumber1,
                  fontSize: Dimenssions.font20 - 4,
                  color: AppColors.insidetextcolor,
                ),
              ],
            ),
            SizedBox(
              height: Dimenssions.height10,
            ),
            Row(
              children: [
                SizedBox(
                  width: Dimenssions.width30 ,
                ),
                const Icon(
                  Icons.location_on,
                  color: AppColors.iconColor,
                ),
                CostumeAnimatedText(
                  text: address2,
                  fontSize: Dimenssions.font20 - 4,
                  color: AppColors.insidetextcolor,
                ),
                SizedBox(
                  width: Dimenssions.width20,
                ),
                const Icon(
                  Icons.phone,
                  color: AppColors.iconColor,
                ),
                CostumeAnimatedText(
                  text: phoneNumber2,
                  fontSize: Dimenssions.font20 - 4,
                  color: AppColors.insidetextcolor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
