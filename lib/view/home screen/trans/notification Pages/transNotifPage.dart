import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/transporteur/notificationController.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransNotificationScreen extends StatefulWidget {
  const TransNotificationScreen({super.key});

  @override
  State<TransNotificationScreen> createState() => _TransNotificationScreenState();
}

class _TransNotificationScreenState extends State<TransNotificationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: GetBuilder<TransnotificationController>(builder: (controller){
      return SafeArea(
        child: Column(children: [ 
          SizedBox(height: Dimenssions.height20,),
          CostumeAnimatedText(text: "Notification Page"),
          SizedBox(height: Dimenssions.height10,),
          TabBar(
              indicatorColor: Colors.black,
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: AppColors.mainTextColor,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.file_open_rounded,
                        color: AppColors.iconColor,
                      ),
                     
                      CostumeAnimatedText(text: "Demandes Section")
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.notifications,
                        color: AppColors.iconColor,
                      ),
                  
                      CostumeAnimatedText(text: "Notifications Section")
                    ],
                  ),
                ),
                
              ]),
              SizedBox(
            height: Dimenssions.height10,
          ),
          Expanded(
            child: TabBarView(controller: _tabController, 
            children: [
               
            
            ]),
          )


      ],));
    }),
    );
  }
}