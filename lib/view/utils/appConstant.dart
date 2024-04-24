// ignore_for_file: non_constant_identifier_names



import 'package:transmobile/view/utils/shared.dart';

class AppConstant  {


  
  static String baseurl = "http://192.168.100.20:3000/api/v0";
  // client auth endpoints
  static String loginUser = "/authClient/signin";
  static String signup1Client = "/authClient/signup1";
  static String signup2Client = "/authClient/signup2";
  static String forgotpasswordClient = "/authClient/forgotpassword";
  static String resetpasswordClient = "/authClient/resetpassword";
  static String resendverificationcodeClient ="/authClient/resendverificationcode";

  // transporteur auth endpoints
  static String loginTrans = "/authTransporteur/signin";
  static String signup1Trans = "/authTransporteur/signup1";
  static String signup2Trans = "/authTransporteur/signup2";
  static String forgotpasswordTrans = "/authTransporteur/forgotpassword";
  static String resetpasswordTrans = "/authTransporteur/resetpassword";
  static String resendverificationcodeTrans = "/authTransporteur/resendverificationcode";

  // client other endpoints
  static String getalltrips = "/clients/getalltrips";
  static String updatesuser = "/clients/updateUserDetails";
  static String updatePicUser = "/clients/uploadProfilePicture";
  static String usergetAllTransporter = "/clients/getAllTransporteur";
  static String usersearchTrip = "/clients/searchtrip";
  static String usersendrequest = "/clients/sendrequest";
  static String usergetverified = "/clients/getverified";
  static String getAllDemande = "/clients/getalldemande";
  static String userAddReview = "/clients/addreview/:id";
  static String getCurrentTrips = "/clients/currentTrips";
   static String changeuseremail = "/clients/changeuseremail";
     static String changeuserpassword = "/clients/changepassword";
     static String GetalldemandesVerifi = "/clients/GetverificationDemandesList";
  // transporteur other endpoints

  static String updateTrans = "/transporteur/updateTransporteurDetails";
  static String updatepicTrans = "/transporteur/uploadProfilePicture";
  static String Transgetallpackage = "/transporteur/getAllPackage";
  static String transacceptDemande = "/transporteur/acceptDemande/:id";
  static String TransrefuseDemande = "/transporteur/refuseDemande/:id";
  static String Transgetalldemande = "/transporteur/getAllDemande";
  static String TransaddTrip = "/transporteur/addtrip";
  static String TransupdateTrip = "/transporteur/updateTrip/:id";
  static String TransDeleteTrip = "/transporteur/deleteTrip/:id";
  static String TransAddsinglePackage = "/transporteur/addSinglepackage/:id";
  static String TransgetAllTrip = "/transporteur/getAlltrips";
  static String TransaddTriptohistory = "/transporteur/addtriptohistory/:id";

  /// images path
  static String Clientimage ="http://192.168.100.20:3000/Images/private/users/";
    static String Transimage ="http://192.168.100.20:3000/Images/private/transporteurs";
      static String Packagesimage ="http://192.168.100.20:3000/Images/private/packages/demandeimage/";
        static String Passportimage ="http://192.168.100.20:3000/Images/passport/";




}
