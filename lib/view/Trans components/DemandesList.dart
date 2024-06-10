import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/transporteur/notificationController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/Trans%20components/demande%20Details%20Page.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class DemandesList extends StatefulWidget {
  const DemandesList({super.key});

  @override
  State<DemandesList> createState() => _DemandesListState();
}

class _DemandesListState extends State<DemandesList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Get.find<TransnotificationController>()
          .GetAlldemandeForCurrentTrip();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransnotificationController>(builder: (controller) {
      return controller.Demande_Loader
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : controller.DemandesLivrasion.isEmpty
              ? Center(
                  child: CostumeAnimatedText(
                    text: "No Demande For The Moment",
                  ),
                )
              : SizedBox(
                  height: Dimenssions.height,
                  width: Dimenssions.width,
                  child: ListView.builder(
                      itemCount: controller.DemandesLivrasion.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.Selected_Demande =
                                controller.DemandesLivrasion[index];
                            Get.to(() => const DemandeDetails_Container());
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: Dimenssions.LRpadmarg10,
                                left: Dimenssions.LRpadmarg10,
                                right: Dimenssions.LRpadmarg10),
                            height: Dimenssions.height20 * 4,
                            width: Dimenssions.width30 * 7,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimenssions.radius20),
                                color: Colors.grey[300]),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Dimenssions.width20,
                                ),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        100), // Adjust the radius to match the container's borderRadius
                                    child: Image.network(
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const CircularProgressIndicator();
                                      },
                                      "${AppConstant.Clientimage}/${controller.DemandesLivrasion[index].client.profilePicture}",
                                      fit: BoxFit.cover,
                                      height: Dimenssions.height20 * 3,
                                      width: Dimenssions.width30 * 2,
                                    )),
                                SizedBox(
                                  width: Dimenssions.width20,
                                ),
                                Text(
                                    "${controller.DemandesLivrasion[index].client.fullName}"),
                                SizedBox(
                                  width: Dimenssions.width10,
                                ),
                                Text(controller
                                    .DemandesLivrasion[index].client.createdAt!
                                    .substring(0, 10)),
                                SizedBox(
                                  width: Dimenssions.width10,
                                ),
                                SizedBox(width: Dimenssions.width30*2,
                                child: !controller.DemandesLivrasion[index].accepted &&
                                        !controller
                                            .DemandesLivrasion[index].refused
                                    ? CostumeAnimatedText(
                                        text: "Waiting ",
                                        color: Colors.white,
                                      )
                                    : controller
                                            .DemandesLivrasion[index].accepted
                                        ? CostumeAnimatedText(
                                            text: "Accepted",
                                            color: Colors.green,
                                          )
                                        : CostumeAnimatedText(
                                            text: 'Rejected',
                                            color: Colors.red,
                                          ),)
                              ],
                            ),
                          ),
                        );
                      }),
                );
    });
  }
}
