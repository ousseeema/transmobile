// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class CostumeReviewContainer extends StatelessWidget {
  int rating;
  String Comment;
  String createdAt;
  String username;
  String imageUrl;
  CostumeReviewContainer(
      {super.key,
      required this.Comment,
      required this.createdAt,
      required this.username,
      required this.imageUrl,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimenssions.height20*7,
      decoration: BoxDecoration(
          color: AppColors.insidetextcolor,
          borderRadius: BorderRadius.circular(Dimenssions.radius10),
          boxShadow:  [
            BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 4,
              offset: const Offset(4, 8), // Shadow position
            ),
          ]),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // displaying the name , the photo and the rating
          Padding(
            padding:  EdgeInsets.only(top: Dimenssions.TBpadmarg10,left: Dimenssions.LRpadmarg10),
            child: Row(
            
              children: [
                
                // photo
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      100), // Adjust the radius to match the container's borderRadius
                  child: Image.network(
                    "${AppConstant.Clientimage}${imageUrl}",
                    fit: BoxFit.cover,
                    height: Dimenssions.height20 * 2.5,
                    width: Dimenssions.width30 * 1.5,
                  ),
                ),
                SizedBox(
                  width: Dimenssions.width20,
                ),
                // displaying the name and date
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedTextKit(repeatForever: true, animatedTexts: [
                      ColorizeAnimatedText(username,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimenssions.font20 - 4),
                          colors: [
                            Colors.purple,
                            Colors.blue,
                            Colors.yellow,
                            Colors.red,
                          ])
                    ]),
                   
                    Text(
                      createdAt.substring(0, 10),
                      style: const TextStyle(
                          color: AppColors.hintTextColor,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                    height: Dimenssions.height20 * 2,
                    width: Dimenssions.width30 * 4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (_, index) {
                          return Icon(
                            Icons.star_rate_rounded,
                            color: index >= rating ?   Colors.grey:Colors.yellow,
                          );
                        })),
                        SizedBox(width: Dimenssions.width10,)
              ],
            ),
          ),
         
          Padding(
            padding:  EdgeInsets.only(top: Dimenssions.TBpadmarg10,left: Dimenssions.LRpadmarg10*2),
            child: Text(
              Comment,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 3,
            ),
          )
        ],
      ),
    );
  }
}
