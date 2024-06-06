import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/transporteur/notificationController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Client%20components/button.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class DemandeDetails_Container extends StatefulWidget {
  const DemandeDetails_Container({super.key});

  @override
  State<DemandeDetails_Container> createState() =>
      _DemandeDetails_ContainerState();
}

class _DemandeDetails_ContainerState extends State<DemandeDetails_Container> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<TransnotificationController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimenssions.LRpadmarg20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back_rounded)),
                      SizedBox(
                        width: Dimenssions.width30 * 3.5,
                      ),
                      CostumeAnimatedText(text: "Demande Details"),
                    ],
                  ),
                  SizedBox(
                    height: Dimenssions.height20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                    child: const Text(" Package Photo :"),
                  ),
                  SizedBox(
                    height: Dimenssions.height20,
                  ),
                  Container(
                    margin: EdgeInsets.all(Dimenssions.LRpadmarg10),
                    height: Dimenssions.height20 * 14,
                    width: Dimenssions.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "${AppConstant.Packagesimage}/${controller.Selected_Demande.message.packagephoto}",
                            ))),
                  ),
                  SizedBox(
                    height: Dimenssions.height10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                    child: const Text("General Information :"),
                  ),
                  SizedBox(
                    height: Dimenssions.height20,
                  ),
                  // email  address container
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimenssions.LRpadmarg10,
                        right: Dimenssions.LRpadmarg10),
                    width: Dimenssions.width,
                    padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius10),
                        color: Colors.grey[400]),
                    child: Row(
                      children: [
                        const Icon(Icons.email,
                            color: AppColors.insidetextcolor),
                        const Text(
                          'Email Address:',
                          style: TextStyle(color: AppColors.insidetextcolor),
                        ),
                        CostumeAnimatedText(
                            text:
                                "   ${controller.Selected_Demande.client.email}"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimenssions.height10,
                  ),
                  // name  container
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimenssions.LRpadmarg10,
                        right: Dimenssions.LRpadmarg10),
                    width: Dimenssions.width,
                    padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius10),
                        color: Colors.grey[400]),
                    child: Row(
                      children: [
                        const Icon(Icons.person,
                            color: AppColors.insidetextcolor),
                        const Text(
                          'FullName:',
                          style: TextStyle(color: AppColors.insidetextcolor),
                        ),
                        CostumeAnimatedText(
                            text:
                                "   ${controller.Selected_Demande.client.fullName}"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimenssions.height10,
                  ),
                  //country container
                  Container(
                      margin: EdgeInsets.only(
                          left: Dimenssions.LRpadmarg10,
                          right: Dimenssions.LRpadmarg10),
                      width: Dimenssions.width,
                      padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius10),
                          color: Colors.grey[400]),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: AppColors.insidetextcolor),
                          const Text(
                            'Country:',
                            style: TextStyle(color: AppColors.insidetextcolor),
                          ),
                          CostumeAnimatedText(
                              text:
                                  " ${controller.Selected_Demande.client.country}"),
                        ],
                      )),

                  SizedBox(
                    height: Dimenssions.height10,
                  ),

                  // PICKUP ADDRESS
                  Container(
                      margin: EdgeInsets.only(
                          left: Dimenssions.LRpadmarg10,
                          right: Dimenssions.LRpadmarg10),
                      width: Dimenssions.width,
                      padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius10),
                          color: Colors.grey[400]),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_sharp,
                              color: AppColors.insidetextcolor),
                          const Text(
                            'Sender Address:',
                            style: TextStyle(color: AppColors.insidetextcolor),
                          ),
                          SizedBox(
                            width: Dimenssions.width30 * 7,
                            child: CostumeAnimatedText(
                                text: controller
                                    .Selected_Demande.message.Pickupaddress),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: Dimenssions.height10,
                  ),

                  // sender phonenumber  container
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimenssions.LRpadmarg10,
                        right: Dimenssions.LRpadmarg10),
                    width: Dimenssions.width,
                    padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius10),
                        color: Colors.grey[400]),
                    child: Row(
                      children: [
                        const Icon(Icons.call_made_outlined,
                            color: AppColors.insidetextcolor),
                        const Text(
                          'Sender Number:',
                          style: TextStyle(color: AppColors.insidetextcolor),
                        ),
                        CostumeAnimatedText(
                            text: controller.Selected_Demande.message
                                .phoneNumberof_the_sender),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimenssions.height10,
                  ),
                  // delivery  ADDRESS
                  Container(
                      margin: EdgeInsets.only(
                          left: Dimenssions.LRpadmarg10,
                          right: Dimenssions.LRpadmarg10),
                      width: Dimenssions.width,
                      padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius10),
                          color: Colors.grey[400]),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_sharp,
                              color: AppColors.insidetextcolor),
                          const Text(
                            'Reciver Address:',
                            style: TextStyle(color: AppColors.insidetextcolor),
                          ),
                          SizedBox(
                            width: Dimenssions.width30 * 7,
                            child: CostumeAnimatedText(
                                text: controller
                                    .Selected_Demande.message.receivedAdress),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: Dimenssions.height10,
                  ),
                  //reciver phone number  container
                  Container(
                      margin: EdgeInsets.only(
                          left: Dimenssions.LRpadmarg10,
                          right: Dimenssions.LRpadmarg10),
                      width: Dimenssions.width,
                      padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius10),
                          color: Colors.grey[400]),
                      child: Row(
                        children: [
                          const Icon(Icons.call_received_rounded,
                              color: AppColors.insidetextcolor),
                          const Text(
                            'Reciver Number:',
                            style: TextStyle(color: AppColors.insidetextcolor),
                          ),
                          CostumeAnimatedText(
                              text: controller.Selected_Demande.message
                                  .phoneNumberof_the_receiver),
                        ],
                      )),
                      SizedBox(height: Dimenssions.height20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: CostumeButton(
                            height: Dimenssions.height20*2,
                            width: Dimenssions.width20 * 8,
                            text: "Accept"),
                      ),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: CostumeButton(
                          
                            height: Dimenssions.height20 * 2,
                            width: Dimenssions.width20 * 8,
                            text: "Reject"),
                      ),
                    ],
                  ), 
                  SizedBox(height: Dimenssions.height20*3,)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
