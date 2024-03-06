

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/view/information.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  bool _isExpanded = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isExpanded = !_isExpanded;
      });
    });

    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.to(()=> const informations() );
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedContainer(
            decoration: BoxDecoration(
             color: Colors.deepPurple[100],
             //shape: BoxShape.circle,
             borderRadius: BorderRadius.circular(_isExpanded ? 0 : 300),
             gradient:const  LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(19, 15, 65, 1),
                Color.fromRGBO(62, 55, 122, 0.8),
                Color.fromRGBO(89, 81, 154, 0.612),
               
              ],)
            ),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        height: _isExpanded ? MediaQuery.of(context).size.height: 150,
        width: _isExpanded ? MediaQuery.of(context).size.width : 150,
     
        child:const Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to",style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 22,),



              Text(
                "TransMobile",
                style: TextStyle(
                    color: Color.fromRGBO(255, 222, 89, 2),
                  fontSize: 28,
                      fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
