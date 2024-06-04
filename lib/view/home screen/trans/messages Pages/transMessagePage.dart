// ignore_for_file: camel_case_types, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransmessageController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransMessageScreen extends StatefulWidget {
  const TransMessageScreen({super.key});

  @override
  State<TransMessageScreen> createState() => _TransMessageScreenState();
}

class _TransMessageScreenState extends State<TransMessageScreen> {
  @override
  void initState() {
  
    
    super.initState();
      
        Get.find<TransporterMessageController>().GetAllMessages();
    
   
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<TransporterMessageController>(
        builder: (controller) {
          return controller.messageLoader? const Center(
              child: CircularProgressIndicator()):
              controller.ListOfMessage.isEmpty? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Dimenssions.height20,),
                 
                  CostumeAnimatedText(text: "Messages"), 
                  SizedBox(height: Dimenssions.height20*10,),
                      
                  SizedBox(
                    height:Dimenssions.height20*11 ,
                    width: Dimenssions.width,
                    child: Image.asset(
                    
                      "assets/images/no message.png"),
                  ),
                ],
              ) :
              SingleChildScrollView(
                    child: Column(
                children: [
                  SizedBox(
                    height: Dimenssions.height10,
                  ),
                  CostumeAnimatedText(
                    text: "Messages",
                  ),
                  SizedBox(
                    height: Dimenssions.height20 * 2,
                  ),
                  SizedBox(
                    height: Dimenssions.height,
                    width: Dimenssions.width,
                    
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        indent: Dimenssions.width20 * 2,
                        endIndent: Dimenssions.width20 * 2,
                      ),
                      itemCount: controller.ListOfMessage.length,
                      itemBuilder: (context, index) {
                        DateTime now = DateTime.now();
          
                        final lastMessage =
                            controller.ListOfMessage[index].messages.last;
                        final createdAt = lastMessage["CreatedAt"];
                        DateTime parsedDate = DateFormat("yyyy-MM-dd")
                            .parse(createdAt.substring(0, 10));
          
                        // Create new DateTime objects with time set to midnight
                        DateTime nowDate =
                            DateTime(now.year, now.month, now.day);
                        DateTime parsedDateWithoutTime = DateTime(
                            parsedDate.year,
                            parsedDate.month,
                            parsedDate.day);
                        final isToday = nowDate.compareTo(parsedDateWithoutTime);
           
                        //message container for each discussion that a user have done
                        return InkWell(
                          onTap: () {
                            // going to the chat page 
                            controller.selectDiscussion(controller.ListOfMessage[index]);
                            
                          },
                          child: Container(
                            height: Dimenssions.height20 * 3,
                            margin: EdgeInsets.only(
                                left: Dimenssions.LRpadmarg30,
                                bottom: Dimenssions.LRpadmarg10 / 2,
                                top: Dimenssions.LRpadmarg10 / 2),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        100), // Adjust the radius to match the container's borderRadius
                                    child: Image.network(
                                      "${AppConstant.Transimage}/${controller.ListOfMessage[index].transporterId.profilePicture}",
                                      height: Dimenssions.height20 * 2.5,
                                      width: Dimenssions.height20 * 2.5,
                                    )),
                                SizedBox(
                                  width: Dimenssions.width20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.ListOfMessage[index].transporterId.fullName}",
                                      style: const TextStyle(
                                          color: AppColors.buttonColor,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: Dimenssions.height10,
                                    ),
                                    lastMessage["user"].toString() ==
                                            controller.Transporter.id
                                        ? SizedBox(
                                            width: Dimenssions.width30 * 2,
                                            child: Text(
                                              "${lastMessage["message"]}",
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.grey),
                                            ),
                                          )
                                        : SizedBox(
                                            width: Dimenssions.width30 * 5,
                                            child: Text(
                                                "${lastMessage["message"]}",
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                          ),
                                  ],
                                ),
                               const Spacer(),
                               Text(
                                  isToday == 0
                                      ? "${createdAt.substring(11, 16)}" // Display time only
                                      : "${createdAt.substring(0, 10)}", // Display full date
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: AppColors.iconColor
                                ), 
                                ),
                                SizedBox(width: Dimenssions.width20,)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
                  );
        },
            ),
      ));
  }
}
