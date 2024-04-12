import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/controller/homeScreen/Client/homeController.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/components/transporteurContainer.dart';
import 'package:transmobile/view/home%20screen/Client/search%20Pages/detailsResult.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class AllTripsListScreen extends StatefulWidget {
  const AllTripsListScreen({super.key});

  @override
  State<AllTripsListScreen> createState() => _AllTripsListScreenState();
}

class _AllTripsListScreenState extends State<AllTripsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: CostumeAnimatedText(
                text: "Transporter List",
                fontSize: Dimenssions.font20,
              ),
            ),
            SizedBox(
              height: Dimenssions.height20,
            ),
            SizedBox(
                height: Dimenssions.height - Dimenssions.height20 * 4,
                width: Dimenssions.width,
                child: GetBuilder<HomeController>(
                  builder: (controller) {
                    return ListView.builder(
                        itemCount: controller.alltrips.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.find<DetailsResult>()
                                  .selectedtrip(controller.alltrips[index]);
                              Get.to(() =>  const detailsResult(),
                                              transition: Transition.fade
                                  
                                  
                                   );
                            },
                            child: TransporterContainer(
                                address2: controller.alltrips[index].transporter
                                    .DestinationAddress,
                                phoneNumber1: controller
                                    .alltrips[index].transporter.phoneNumberA,
                                phoneNumber2: controller
                                    .alltrips[index].transporter.phoneNumberB,
                                Country: controller
                                    .alltrips[index].transporter.listCountry1,
                                address1: controller
                                    .alltrips[index].transporter.localAddress,
                                coast: controller
                                    .alltrips[index].transporter.priceKg
                                    .toString(),
                                imageurl: controller
                                    .alltrips[index].transporter.profilePicture,
                                transporteurName: controller
                                    .alltrips[index].transporter.fullName),
                          );
                        });
                  },
                ))
          ],
        ),
      ),
    );
  }
}
