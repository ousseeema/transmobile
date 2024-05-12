import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class notificationsContainer extends StatelessWidget {
  String Data;
  String Name;
  String date;

  notificationsContainer(
      {super.key, required this.Data, required this.Name, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 167, 161, 161),
        borderRadius: BorderRadius.circular(Dimenssions.radius10),
      ),
      margin: EdgeInsets.all(Dimenssions.LRpadmarg10),
      padding: EdgeInsets.only(left: Dimenssions.LRpadmarg20),
      height: Dimenssions.height20 * 5,
      width: Dimenssions.width,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
                100), // Adjust the radius to match the container's borderRadius
            child: Image.network(
              "${AppConstant.Clientimage}users_662960884fd5711489e1ad1c.jpg",
              fit: BoxFit.cover,
              height: Dimenssions.height20 * 3,
              width: Dimenssions.width30 * 1.7,
            ),
          ),
          SizedBox(
            width: Dimenssions.width20,
          ),
          Column(
            children: [
              
              SizedBox(
                height: Dimenssions.height20*2,
              ),
              Text(Data),
            ],
          ),
          SizedBox(
            width: Dimenssions.width20,
          ),
          Text(date)
        ],
      ),
    );
  }
}
