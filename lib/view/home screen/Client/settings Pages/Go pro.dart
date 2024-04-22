import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:text_area/text_area.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/components/button.dart';
import 'package:transmobile/view/components/demandeVerificationContainer.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class GoPro extends StatefulWidget {
  const GoPro({super.key});

  @override
  State<GoPro> createState() => _GoProState();
}

class _GoProState extends State<GoPro> with SingleTickerProviderStateMixin {
  Widget sendRequestContainer() {
    return GetBuilder<SettingController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.only(
            left: Dimenssions.LRpadmarg20, right: Dimenssions.LRpadmarg20),
        child: controller.getverified_Loading? const Center(
          child: CircularProgressIndicator(),
        ):
         Column(
          children: [
            SizedBox(height: Dimenssions.height20*4,),
            GestureDetector(
              onTap: () {
                // add passport photo from the gallery
                controller.PickimagePassportFromGallery();
              },
              child: Container(
                height: Dimenssions.height20 * 11,
                decoration: BoxDecoration(
                    border: const DashedBorder.fromBorderSide(
                      dashLength: 10,
                      side: BorderSide(color: Colors.blue, width: 1),
                    ),
                    color: Colors.blue[100]!.withOpacity(0.4)),
                child: controller.passportimage == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_download_outlined,
                              size: Dimenssions.icon24 * 3,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              height: Dimenssions.height20,
                            ),
                            AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  FadeAnimatedText(
                                    'Tap to upload passport image',
                                    textStyle: TextStyle(
                                        color: Colors.blue,
                                        fontSize: Dimenssions.font20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ])
                          ],
                        ),
                      )
                    : Image.file(
                        controller.passportimage!,
                        fit: BoxFit.fill,
                        width: Dimenssions.width,
                        height: Dimenssions.height20 * 11,
                      ),
              ),
            ),
            SizedBox(
              height: Dimenssions.height20,
            ),
            Row(
              children: [
                const Icon(
                  BoxIcons.bx_chat,
                  color: AppColors.iconColor,
                ),
                SizedBox(
                  width: Dimenssions.width10,
                ),
                CostumeAnimatedText(text: "Message to the admin :")
              ],
            ),
            SizedBox(
              height: Dimenssions.height10,
            ),
            TextArea(
              validation: true,
              borderRadius: 10,
              borderColor: const Color(0xFFCFD6FF),
              textEditingController: controller.messageController,
             
              errorText: 'Please type a reason!',
            ),
            SizedBox(
              height: Dimenssions.height20 * 4,
            ),
            GestureDetector(
              onTap: () {
                // sending the passpôrt image and the message to the admin
                controller.SendverfRequest();
              },
              child: CostumeButton(
                  height: Dimenssions.height10 * 5,
                  width: Dimenssions.width30 * 9,
                  text: "Send request"),
            )
          ],
        ),
     
        );
    });
  }

  Widget historyContainer() {
    return SizedBox(
      child: GetBuilder<SettingController>(builder: (controller) {
        return ListView.builder(
          itemCount:  controller.verifiDemandes.length,
          itemBuilder: (context, index) {

            return demandeverificationContainer(
              message: controller.verifiDemandes[index].message,
              approved: controller.verifiDemandes[index].approved,
              imageurl: controller.verifiDemandes[index].passport_image,
              created_at: controller.verifiDemandes[index].createdAt,

            );
          });
      },)
    );
  }

  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
   Future.delayed(Duration.zero,(){
     Get.find<SettingController>().GetverifiedDemandes();
   });
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SettingController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: SizedBox(
                height: Dimenssions.height,
                width: Dimenssions.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimenssions.height10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Dimenssions.width10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back))
                      ],
                    ),
                    TabBar(
                        indicatorColor: AppColors.iconColor,
                        controller: _tabController,
                        labelColor: AppColors.mainTextColor,
                        unselectedLabelColor: AppColors.hintTextColor,
                        tabs: [
                          Tab(
                            child: Row(
                              children: [
                                const Icon(
                                  EvaIcons.file_outline,
                                  color: AppColors.iconColor,
                                ),
                                SizedBox(
                                  width: Dimenssions.width10,
                                ),
                                CostumeAnimatedText(text: "Demande Request")
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.history,
                                  color: AppColors.iconColor,
                                ),
                                SizedBox(
                                  width: Dimenssions.width10,
                                ),
                                CostumeAnimatedText(text: "History")
                              ],
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: Dimenssions.height10,
                    ),
                    Expanded(
                        child: TabBarView(
                      controller: _tabController,
                      children: [
                        sendRequestContainer(),
                        historyContainer(),
                      ],
                    )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
