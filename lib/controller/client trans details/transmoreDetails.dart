

import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transmobile/repository/transDetailsRepo.dart';

class transDetaislController extends GetxController{

 File? selectedImage ;
  String? phone_Numeber1 ;
  String? phone_Numeber2 ;
  

Future PickimageFromGallery()async{
   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
     

  if(image == null){
    update();
    return ;
  }
   
     selectedImage = File(image.path);
     update();
   

}






   




}