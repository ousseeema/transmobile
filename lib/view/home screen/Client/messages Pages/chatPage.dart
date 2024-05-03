import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/messageController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class chatPage extends StatefulWidget {
  const chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GetBuilder<MessageController>(builder: (controller){
              return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: Dimenssions.height - Dimenssions.height20 * 5,
            width: Dimenssions.width,
            child: ListView.builder(
                itemCount: 10, itemBuilder: ((context, index) {
                  
                })),
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
                    controller: controller.messagecontroller,
                    style:const  TextStyle(color: Colors.black),
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
                    child: Icon(
                      BoxIcons.bxs_send,
                      size: Dimenssions.icon24 * 1.2,
                      color: Colors.white,
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
