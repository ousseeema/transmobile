import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/view/utils/appConstant.dart';

class MessageController extends GetxController{


 bool messageLoader = true;
  void GetAllMessages()async{
    Response allMessage= await Get.find<UserApi>().GetRequest(AppConstant.getListOfMessage)
    

    if(allMessage.body['success'] == true){
      
    }
  }



}