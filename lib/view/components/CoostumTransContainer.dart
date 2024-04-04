import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class CostumTransContainer extends StatelessWidget {
  String id;
  String TransName;
  String imagename;
  bool parcels;
  var price;
  String depart;
  String dateDepart;
  String Destination;
  String destinationDate;

  CostumTransContainer(
      {super.key,
      required this.id,
      required this.TransName,
      required this.imagename,
      required this.depart,
      required this.dateDepart,
      required this.Destination,
      required this.destinationDate,
      required this.parcels,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimenssions.height20 * 10,
      width: Dimenssions.width - Dimenssions.width30,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(Dimenssions.radius20)),
      child: Row(
        children: [
          // column for the image and the pricce per kg 
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    100), // Adjust the radius to match the container's borderRadius
                child: Image.network(
                  "${AppConstant.Transimage}/${imagename}",
                  fit: BoxFit.cover,
                  height: Dimenssions.height20 * 3,
                  width: Dimenssions.width30 * 2,
                ),
              ),
              SizedBox(
                height: Dimenssions.height10,
              ),
              CostumeAnimatedText(
                text: "${price}per/kg",
                fontSize: Dimenssions.font20 - 3,
              ),
            ],
          ),
          SizedBox(
            width: Dimenssions.width20,
          ),
          // column for the name and the destination 
          Column(
            children: [
              CostumeAnimatedText(
                text: TransName,
                fontSize: Dimenssions.font20 - 3,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),
              Row(
                children: [
                  CostumeAnimatedText(text: depart),
                  SizedBox(
                    width: Dimenssions.width10,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.iconColor,
                    size: Dimenssions.icon24,
                  ),
                  SizedBox(
                    width: Dimenssions.width10,
                  ),
                  CostumeAnimatedText(text: Destination),
                ],
              ),
              SizedBox(
                height: Dimenssions.height10,
              ),
              Row(
                children: [
                  CostumeAnimatedText(text: dateDepart.toString().substring(0,10)),
                  SizedBox(width: Dimenssions.width20,),
                  CostumeAnimatedText(text: destinationDate.toString().substring(0,10)),
                ],
              )
            ],
          ),
          // button swip 
          SizedBox(width: Dimenssions.width20,),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimenssions.radius20), 
              color: AppColors.buttonColor
            ),
          )


        ],
      ),
    );
  }
}
