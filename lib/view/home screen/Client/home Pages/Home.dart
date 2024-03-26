import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transmobile/controller/homeScreen/ClientMainScreensController.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController _mapcontroller;
    CameraPosition? new_position;
 
  @override
  void initState(){
    // always wwhen the  this page open wee get the data from the server
    Future.delayed(Duration.zero).then((value) {

     Get.find<ClientMainScreensController>().LoadData();
    },);
      
    super.initState();
    // always wwhen the  this page open wee get the data from the server
  
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ClientMainScreensController>(
        builder: (controller) {

          return RefreshIndicator(
          onRefresh: () async  {
        await  controller.LoadData();
         
        },
        child: controller.isloading? 
         // animation while loading
         // shimmer effect
       Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: Dimenssions.height20 * 6,
                width: Dimenssions.width,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: Dimenssions.height20 * 5.5,
                          width: Dimenssions.width,
                          decoration: BoxDecoration(
                              color: AppColors.iconColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(Dimenssions.radius40),
                                  bottomRight:
                                      Radius.circular(Dimenssions.radius40))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Dimenssions.width30,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      20), // Adjust the radius to match the container's borderRadius
                                  child: Image.asset(
                                    "assets/images/default.png",
                                    height: Dimenssions.height20 * 3,
                                    width: Dimenssions.height20 * 3,
                                  )),
                              SizedBox(
                                width: Dimenssions.width20,
                              ),
                              const Text("Welcome Back! \n User fullname"),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: Dimenssions.height10,
              ),
              SizedBox(
                height: Dimenssions.height20 * 10,
                width: Dimenssions.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: Dimenssions.height20 * 10,
                          width: Dimenssions.width - 20,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/images/amazon.jpg",
                                  )),
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius20)),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                child: Text(
                  "Track your package : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimenssions.font20 + 3),
                ),
              ),
              SizedBox(
                height: Dimenssions.height10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimenssions.radius30),
                  color: Colors.grey,
                ),
                height: Dimenssions.height20 * 10,
                width: Dimenssions.width,
                child: Stack(
                  children: [
                   
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: Dimenssions.width,
                          height: Dimenssions.height20 * 3,
                          decoration: BoxDecoration(
                            color: AppColors.iconColor.withOpacity(0.7),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Dimenssions.width20 * 2,
                              ),
                              const Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Click to see your package",
                                    style:
                                        TextStyle(color: AppColors.insidetextcolor),
                                  )),
                              const Expanded(
                                  flex: 1, child: Icon(Icons.arrow_forward))
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              // displaying the text Transporteur and view more
              SizedBox(
                height: Dimenssions.height20,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                    child: Text(
                      "Transporter : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimenssions.font20 + 3),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "view more ",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: Dimenssions.font20-10,
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),
          
              /// list of transporteurs
              /// displaying the list of transporteur in random order every time the user use the application
              SizedBox(
                height: Dimenssions.height20 * 4,
                width: Dimenssions.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // list of transporteurs length
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: Dimenssions.LRpadmarg10 / 2,
                            right: Dimenssions.LRpadmarg10 / 2),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                20), // Adjust the radius to match the container's borderRadius
                            child: Image.asset(
                              "assets/images/default.png",
                              height: Dimenssions.height20 * 6,
                              width: Dimenssions.width20 * 4,
                            )),
                      );
                    }),
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),
            ]),
          ),
        ):SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: Dimenssions.height20 * 6,
                width: Dimenssions.width,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: Dimenssions.height20 * 5.5,
                          width: Dimenssions.width,
                          decoration: BoxDecoration(
                              color: AppColors.iconColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(Dimenssions.radius40),
                                  bottomRight:
                                      Radius.circular(Dimenssions.radius40))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Dimenssions.width30,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      20), // Adjust the radius to match the container's borderRadius
                                  child: Image.asset(
                                    "assets/images/default.png",
                                    height: Dimenssions.height20 * 3,
                                    width: Dimenssions.height20 * 3,
                                  )),
                              SizedBox(
                                width: Dimenssions.width20,
                              ),
                              const Text("Welcome Back! \n User fullname"),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: Dimenssions.height10,
              ),
              SizedBox(
                height: Dimenssions.height20 * 10,
                width: Dimenssions.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: Dimenssions.height20 * 10,
                          width: Dimenssions.width - 20,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/images/amazon.jpg",
                                  )),
                              borderRadius:
                                  BorderRadius.circular(Dimenssions.radius20)),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                child: Text(
                  "Track your package : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimenssions.font20 + 3),
                ),
              ),
              SizedBox(
                height: Dimenssions.height10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimenssions.radius30),
                  color: Colors.grey,
                ),
                height: Dimenssions.height20 * 10,
                width: Dimenssions.width,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        //google maps here
                        child: GestureDetector(
                          onTap: () {
                            // going to the details of the trip
                          },
                          child: GoogleMap(
                            mapType: MapType.terrain,
                            initialCameraPosition: const CameraPosition(
                             zoom: 100,
                              
                              target: LatLng(37, 10.991030),
                            ),
                           
                            
                            onMapCreated: (GoogleMapController controller) {
                              setState(() {
                                _mapcontroller = controller;
                              });
                                _mapcontroller = controller;

                              
                            },
                             onCameraMove: (position) {
                              new_position = position;
                            },

                            onCameraIdle: () {
                              
                            },
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: Dimenssions.width,
                          height: Dimenssions.height20 * 3,
                          decoration: BoxDecoration(
                            color: AppColors.iconColor.withOpacity(0.7),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Dimenssions.width20 * 2,
                              ),
                              const Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Click to see your package",
                                    style:
                                        TextStyle(color: AppColors.insidetextcolor),
                                  )),
                              const Expanded(
                                  flex: 1, child: Icon(Icons.arrow_forward))
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              // displaying the text Transporteur and view more
              SizedBox(
                height: Dimenssions.height20,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                    child: Text(
                      "Transporter : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimenssions.font20 + 3),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "view more ",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: Dimenssions.font20-4,
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),
          
              /// list of transporteurs
              /// displaying the list of transporteur in random order every time the user use the application
              SizedBox(
                height: Dimenssions.height20 * 4,
                width: Dimenssions.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // list of transporteurs length
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: Dimenssions.LRpadmarg10 / 2,
                            right: Dimenssions.LRpadmarg10 / 2),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                100),
                                 // Adjust the radius to match the container's borderRadius
                            child: Image.network(
                              "${AppConstant.Transimage}/${controller.Transporteurs[index].profilePicture}",
                              height: Dimenssions.height20 * 6,
                              width: Dimenssions.width20 * 4,
                               fit: BoxFit.cover,
                            )),
                      );
                    }),
              ),
              SizedBox(
                height: Dimenssions.height20,
              ),

              // this space to display charts 
              

            ]),
          )
         ,
      );
    
        
      },)
      ,);
  }
}
