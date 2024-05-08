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
  void initState() {
    // TODO: implement initState
    Get.find<MessageController>().socketInit();
    super.initState();
     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GetBuilder<MessageController>(builder: (controller){
              return SingleChildScrollView(
      child: Column(
        children: [

          //message listbuilder : contains all the messages 
          SizedBox(
            height: Dimenssions.height - Dimenssions.height20 * 5,
            width: Dimenssions.width,
            child: ListView.builder(
                itemCount:controller.SelectedDiscussion.messages.length,
                 itemBuilder: ((context, index) {
                   bool client =controller.SelectedDiscussion.userId ==  controller.SelectedDiscussion.messages[index]['user'];
                 return Align(
                
                  alignment:client ? Alignment.centerLeft: Alignment.centerRight,
                   child: Container(
                    color: client? AppColors.bigTextColor: AppColors.buttonColor,
                    margin: EdgeInsets.only(top: Dimenssions.LRpadmarg10),
                    padding: EdgeInsets.all(Dimenssions.LRpadmarg10),
                    height: Dimenssions.height20*4,
                    child: Wrap(
                   
                     children: [ 
                      Text(controller.SelectedDiscussion.messages[index]['message']),
                      Text(controller.SelectedDiscussion.createdAt.substring(12,16), style: TextStyle(
                        fontSize: Dimenssions.font10-3,
                        fontWeight: FontWeight.w200


                      ),)
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
                    onChanged: (value) {
                    controller.messagecontroller.text= value;
                    },
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
