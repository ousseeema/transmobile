import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/messageController.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class chatPage extends StatefulWidget {
  const chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    Get.find<MessageController>().socketInit();
 Get.find<MessageController>().getuser();   
  super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }
  @override
  void dispose(){
    super.dispose();
    Get.find<MessageController>().Loader=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        SafeArea(child: GetBuilder<MessageController>(builder: (controller) {
      return SingleChildScrollView(
        child: controller.SelectedDiscussion == null
            ? Column(
                children: [
                  SizedBox(height: Dimenssions.height10,),
                 
                  //message listbuilder : contains all the messages
                  // textfield container
                  SizedBox(
                    height: Dimenssions.height - Dimenssions.height20 * 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: Dimenssions.LRpadmarg10),
                    height: Dimenssions.height20 * 4,
                    width: Dimenssions.width,
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimenssions.radius20),
                            topRight: Radius.circular(Dimenssions.radius20))),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: TextField(
                            maxLines: 4,
                            onChanged: (value) {
                              controller.messagecontroller.text = value;
                            },
                            controller: controller.messagecontroller,
                            style: const TextStyle(color: Colors.black),
                            cursorColor: Colors.white,
                            focusNode: FocusNode(),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: "Tap Your Message Here",
                                prefixIcon: Icon(
                                  BoxIcons.bx_chat,
                                  color: Colors.white,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                controller.sendMessage();
                              },
                              child: Icon(
                                BoxIcons.bxs_send,
                                size: Dimenssions.icon24 * 1.2,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  //message listbuilder : contains all the messages
                  SizedBox(
                    height: Dimenssions.height - Dimenssions.height20 * 5,
                    width: Dimenssions.width,
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount:
                            controller.SelectedDiscussion!.messages!.length,
                        itemBuilder: ((context, index) {
                          bool client = controller
                                  .SelectedDiscussion!.userId!.id ==
                              controller.SelectedDiscussion!.messages![index]
                                  ['user'];
                          return Align(
                            alignment: client
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius: 5, //spread radius
                                    blurRadius: 7, // blur radius
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                    //first paramerter of offset is left-right
                                    //second parameter is top to down
                                  ),
                                  //you can set more BoxShadow() here
                                ],
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimenssions.radius10),
                                    bottomRight:
                                        Radius.circular(Dimenssions.radius10),
                                    topRight:
                                        Radius.circular(Dimenssions.radius10)),
                                color: client
                                    ? AppColors.buttonColor
                                    : AppColors.bigTextColor,
                              ),
                              margin: EdgeInsets.only(
                                  top: Dimenssions.LRpadmarg10,
                                  left: Dimenssions.LRpadmarg10,
                                  right: Dimenssions.LRpadmarg10),
                              padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                              height: Dimenssions.height20 * 4,
                              child: Wrap(
                                children: [
                                  Text(
                                    controller.SelectedDiscussion!
                                        .messages![index]['message'],
                                    style: const TextStyle(
                                        color: AppColors.insidetextcolor),
                                  ),
                                  SizedBox(
                                    width: Dimenssions.width30,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        100), // Adjust the radius to match the container's borderRadius
                                    child: Image.network(
                                      client
                                          ? "${AppConstant.Clientimage}${controller.me.profilePicture}"
                                          : "${AppConstant.Transimage}/${controller.SelectedDiscussion!.transporterId!.profilePicture}",
                                      fit: BoxFit.cover,
                                      height: Dimenssions.height20,
                                      width: Dimenssions.width20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimenssions.width10,
                                  ),
                                  Text(
                                    controller.SelectedDiscussion!.createdAt!
                                        .substring(12, 16),
                                    style: TextStyle(
                                        fontSize: Dimenssions.font10,
                                        fontWeight: FontWeight.w200,
                                        color: AppColors.insidetextcolor),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                  // textfield container
                  Container(
                    padding: EdgeInsets.only(top: Dimenssions.LRpadmarg10),
                    height: Dimenssions.height20 * 4,
                    width: Dimenssions.width,
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimenssions.radius20),
                            topRight: Radius.circular(Dimenssions.radius20))),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: TextField(
                            maxLines: 4,
                            onChanged: (value) {
                              controller.messagecontroller.text = value;
                            },
                            controller: controller.messagecontroller,
                            style: const TextStyle(color: Colors.black),
                            cursorColor: Colors.white,
                            focusNode: FocusNode(),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: "Tap Your Message Here",
                                prefixIcon: Icon(
                                  BoxIcons.bx_chat,
                                  color: Colors.white,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                controller.sendMessage();
                              },
                              child: Icon(
                                BoxIcons.bxs_send,
                                size: Dimenssions.icon24 * 1.2,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
      );
    })));
  }
}
