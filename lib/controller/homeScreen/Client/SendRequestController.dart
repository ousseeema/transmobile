import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SendRequestController extends GetxController{
 File? SelectedImage;

Future PickimageFromGallery()async{
   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
     

  if(image == null){
    update();
    return ;
  }
   
     SelectedImage = File(image.path);
     update();
   

}


   
}