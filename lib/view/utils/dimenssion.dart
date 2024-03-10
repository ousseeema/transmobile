import 'package:get/get.dart';

class  Dimenssions{

  static double width = Get.context!.width;
  static double height = Get.context!.height;

  // *dynamic height

  static double height10 = height / 85;
  static double height20 = height / 41;

// *dynamic width
  static double width10 = width / 41;
  static double width20 = width / 21;
  static double width30 = width / 14;

//* dynamic radius

  static double radius10 = height / 80;
  static double radius20 = radius10 * 2;
  static double radius30 = radius10 * 3;
  static double radius40 = radius10 * 4;

  //* dynamic fontsizes
  static double font10 = height / 85;
  static double font20 = font10 * 2;
  static double font30 = font10 * 3;
  static double font40 = font10 * 4;

  //! dynamic paading and margin : TOP AND BOTTOM
  static double TBpadmarg10 = height / 85;
  static double TBpadmarg20 = TBpadmarg10 * 2;
  static double TBpadmarg30 = TBpadmarg10 * 3;
  //!DYNAMIC PADDING AND MARGIN : LEFT AND RIGHT
  static double LRpadmarg10 = width / 41;
  static double LRpadmarg20 = LRpadmarg10 * 2;
  static double LRpadmarg30 = LRpadmarg10 * 3;
 

   //! splach screen logo size 
   static double splachheight = height/50;
   static double splachwidth = width/50;


   //* icons size 
   static double icon16 = height/53;
   static double icon24 = height/32;



}