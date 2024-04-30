// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class messagesScreen extends StatefulWidget {
  const messagesScreen({super.key});

  @override
  State<messagesScreen> createState() => _messagesScreenState();
}

class _messagesScreenState extends State<messagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:   Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: 
            Container(
              height: Dimenssions.height,
              width: Dimenssions.width,
              decoration: BoxDecoration(),
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index){
                //  return MessageWidget(isMe: true, Message : messagetext, createdAt: CreatedAt);


                }),
            ))
          ],
        ) ),
    );
  }
}