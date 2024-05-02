import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/messageController.dart';
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
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child:SizedBox(
              height: Dimenssions.height,
              width: Dimenssions.width,
              child:  ListView.builder(
                    itemCount: 10, itemBuilder: ((context, index) {
                      

                    })),
            )
            ),
            Positioned(
              top: Dimenssions.height-Dimenssions.height20*5,
              left: 0,
              right: 0,
              bottom: 0,
              child: 
            Container(
              decoration: BoxDecoration( ),
            )),
          
        ],
      ),
    ));
  }
}
