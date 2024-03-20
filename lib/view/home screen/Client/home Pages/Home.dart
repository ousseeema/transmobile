
import 'package:flutter/material.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
          
          SizedBox(
            height: Dimenssions.height20*6,
            width: Dimenssions.width,
            child: Stack( 
              children: [
                Positioned(
                   top: 0,
                   left: 0,
                   right: 0,
                  child: Container(
                    height: Dimenssions.height20*5.5,
                    width: Dimenssions.width,
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimenssions.radius40), bottomRight:Radius.circular(Dimenssions.radius40) )
                    ),
                    child:  Row( 
                      children: [ 
                        SizedBox(width: Dimenssions.width30,),
                      Container(
                        height: Dimenssions.height20*4,
                        width: Dimenssions.height20*4,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Dimenssions.radius30)
                          )
                        ),
                      ), 
                      SizedBox(width: Dimenssions.width20,),
                      const Text("Welcome Back! \n User fullname"),
                    ],),
                 

                )),

              ],
            ),
          ),
          SizedBox(height: Dimenssions.height10,),
          SizedBox(
            height: Dimenssions.height20*10,
            width: Dimenssions.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              
              itemCount: 8,
              itemBuilder: (_, index){
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                  
                    height: Dimenssions.height20*10,
                    width: Dimenssions.width-20,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/amazon.jpg")),
                      
                      borderRadius: BorderRadius.circular(Dimenssions.radius20)
                    ),
                     
                  
                  ),
                );
              }),

          ),
          SizedBox(height: Dimenssions.height20,),
          Padding(
            padding:  EdgeInsets.only(left:Dimenssions.LRpadmarg20),
            child: Text("Track your package : ", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimenssions.font20+3
            ),),
          ),
          SizedBox(height: Dimenssions.height10,),
          Container(
            child: Stack(
              children: [ 
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  //google maps here 
                  child: Container()),
                  Positioned(
                    top:Dimenssions.height20,
                    child: Container(
                      decoration:const  BoxDecoration(
                        color: Color.fromRGBO(115, 93, 93, 0.988),
                      ),
                      child: const Row(
                        children: [
                           Text("Click to see your package",),
                           Icon(Icons.arrow_forward)
                        ],
                      ),
                    ))
              ],




            ),
          )


        ]),
      ) ,
    );
  }
}