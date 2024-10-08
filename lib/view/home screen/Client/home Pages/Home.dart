// ignore_for_file: unused_field, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/controller/homeScreen/Client/homeController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Client%20components/linechart.dart';
import 'package:transmobile/view/Client%20components/shimmerClient.dart';
import 'package:transmobile/view/home%20screen/Client/home%20Pages/Maps.dart';
import 'package:transmobile/view/home%20screen/Client/home%20Pages/allTripsList.dart';
import 'package:transmobile/view/home%20screen/Client/search%20Pages/detailsResult.dart';
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
  void initState() {
    // always wwhen the  this page open wee get the data from the server
    Future.delayed(Duration.zero).then(
      (value) {
        Get.find<HomeController>().LoadData();
      },
    );

    super.initState();
    // always wwhen the  this page open wee get the data from the server
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return RefreshIndicator(
            onRefresh: () async {
              await controller.LoadData();
            },
            child: controller.isloading
                ?
                // animation while loading
                // shimmer effect
                const ClientShimmerEffect()
                : SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                              bottomLeft: Radius.circular(
                                                  Dimenssions.radius40),
                                              bottomRight: Radius.circular(
                                                  Dimenssions.radius40))),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: Dimenssions.width30,
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                100), // Adjust the radius to match the container's borderRadius
                                            child: Image.network(
                                              "${AppConstant.Clientimage}${controller.client!.profilePicture}",
                                              fit: BoxFit.cover,
                                              height: Dimenssions.height20 * 3,
                                              width: Dimenssions.width30 * 2,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimenssions.width20,
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(
                                                height:
                                                    Dimenssions.height20 * 1.5,
                                              ),
                                              CostumeAnimatedText(
                                                  text: "Welcome Back! "),
                                              CostumeAnimatedText(
                                                text: controller
                                                    .client!.fullName!,
                                                color:
                                                    AppColors.insidetextcolor,
                                              ),
                                            ],
                                          ),
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
                            // list of the sites displayed in list view builder
                            height: Dimenssions.height20 * 10,
                            width: Dimenssions.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.get_site_images.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.launchURL(index);
                                      },
                                      child: Container(
                                        height: Dimenssions.height20 * 10,
                                        width: Dimenssions.width - 20,
                                        decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 4,
                                                offset: Offset(
                                                    4, 8), // Shadow position
                                              ),
                                            ],
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                // image displayed
                                                image: AssetImage(
                                                  "assets/images/${controller.get_site_images[index]}",
                                                )),
                                            borderRadius: BorderRadius.circular(
                                                Dimenssions.radius20)),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: Dimenssions.height20,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: Dimenssions.LRpadmarg20),
                            child: CostumeAnimatedText(
                              text: "Track your package : ",
                              weight: FontWeight.bold,
                              fontSize: Dimenssions.font20 + 3,
                            ),
                          ),
                          SizedBox(
                            height: Dimenssions.height10,
                          ),

                          GestureDetector(
                            onTap: () {
                              // if the user has a trip go to the next page else dispaly error message
                              if (controller.trips.isNotEmpty) {
                                Get.to(() => const Maps());
                              } else {
                                Get.snackbar(
                                  "No trips",
                                  "Sorry but no Trips found",
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimenssions.radius30),
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
                                      child: GoogleMap(
                                        zoomControlsEnabled: false,
                                        mapType: MapType.terrain,
                                        initialCameraPosition:
                                            const CameraPosition(
                                          target: LatLng(37, 10.991030),
                                        ),
                                        onMapCreated:
                                            (GoogleMapController controller) {
                                          _mapcontroller = controller;
                                        },
                                        onCameraMove: (position) {
                                          new_position = position;
                                        },
                                        onCameraIdle: () {},
                                      )),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        width: Dimenssions.width,
                                        height: Dimenssions.height20 * 3,
                                        decoration: BoxDecoration(
                                          color: AppColors.iconColor
                                              .withOpacity(0.7),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: Dimenssions.width20 * 2,
                                            ),
                                            Expanded(
                                                flex: 3,
                                                child: CostumeAnimatedText(
                                                  text:
                                                      "Click to see your package",
                                                  color:
                                                      AppColors.insidetextcolor,
                                                )),
                                            const Expanded(
                                                flex: 1,
                                                child:
                                                    Icon(Icons.arrow_forward))
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          // displaying the text Transporteur and view more
                          SizedBox(
                            height: Dimenssions.height20,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Dimenssions.LRpadmarg20),
                                child: CostumeAnimatedText(
                                    text: "Transporter : ",
                                    weight: FontWeight.bold,
                                    fontSize: Dimenssions.font20 + 3),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const AllTripsListScreen());
                                },
                                child: Text(
                                  "View more",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: Dimenssions.font20 - 5,
                                    color: Colors.grey,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Dimenssions.width20,
                              )
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
                                itemCount: controller.alltrips.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimenssions.LRpadmarg10 / 2,
                                        right: Dimenssions.LRpadmarg10 / 2),
                                    child: index == 4
                                        ? GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  () =>
                                                      const AllTripsListScreen(),
                                                  transition: Transition.fade,
                                                  duration: const Duration(
                                                      seconds: 1));
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Container(
                                                height:
                                                    Dimenssions.height20 * 6,
                                                width: Dimenssions.width20 * 4,
                                                color: AppColors.buttonColor
                                                    .withOpacity(0.3),
                                                child: const Center(
                                                  child: Icon(
                                                      Icons.plus_one_outlined),
                                                ),
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              Get.find<DetailsResult>()
                                                  .selectedtrip(controller
                                                      .alltrips[index]);
                                              Get.to(
                                                () => const detailsResult(),
                                                transition: Transition.fade,
                                              );
                                            },
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                // Adjust the radius to match the container's borderRadius
                                                child: Image.network(
                                                  "${AppConstant.Transimage}/${controller.alltrips[index].transporter.profilePicture}",
                                                  height:
                                                      Dimenssions.height20 * 6,
                                                  width:
                                                      Dimenssions.width20 * 4,
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: Dimenssions.height20*2,
                          ),
                          Center(
                            child: CostumeAnimatedText(
                                    text: "Packages  ",
                                    weight: FontWeight.bold,
                                    fontSize: Dimenssions.font20 + 3),
                          ),
                          SizedBox(height: Dimenssions.height20,),

                          // this space to display charts
                          Container(
                            margin:  EdgeInsets.all(Dimenssions.LRpadmarg20),
                            height: Dimenssions.height20*20,
                            width: Dimenssions.width,
                            child: BarChartSample()),
                            SizedBox(height: Dimenssions.height20*3,)








                        ]),
                  ),
          );
        },
      ),
    );
  }
}
