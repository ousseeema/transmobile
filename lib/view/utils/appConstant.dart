// ignore_for_file: non_constant_identifier_names




class AppConstant  {
  static String baseurl = "http://192.168.100.20:3000/api/v0";
   static String socekturl = "http://192.168.100.20:3000";
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
  static String sendReclamationRequest = "/clients/sendReclamationRequest";
    static String getListOfMessage = "/clients/getListOfMessage";
     static String getCurrentUser = "/clients/getcurrentuser";

  // transporteur other endpoints
  

  static String updateTrans = "/transporteurs/updateTransporteurDetails";
  static String updatepicTrans = "/transporteurs/uploadProfilePicture";
  static String Transgetallpackage = "/transporteurs/getAllPackage";
  static String transacceptDemande = "/transporteurs/acceptDemande/:id";
  static String TransrefuseDemande = "/transporteurs/refuseDemande/:id";
  static String Transgetalldemande = "/transporteurs/getAllDemande";
  static String TransaddTrip = "/transporteurs/addtrip";
  static String TransupdateTrip = "/transporteurs/updateTrip/:id";
  static String TransDeleteTrip = "/transporteurs/deleteTrip/:id";
  static String TransAddsinglePackage = "/transporteurs/addSinglepackage/:id";
  static String TransgetAllTripInHistory = "/transporteurs/getAlltrips";
  static String TransaddTriptohistory = "/transporteurs/addtriptohistory/:id";
  static String getCurrentTransporteur = "/transporteurs/getCurrentTransporter";
static String getCurrentTrip = "/transporteurs/getCurrentTrip";
 
 
 
 
 /// images path
  static String Clientimage ="http://192.168.100.20:3000/Images/private/users/";
    static String Transimage ="http://192.168.100.20:3000/Images/private/transporteurs";
      static String Packagesimage ="http://192.168.100.20:3000/Images/packages/";
  static String Passportimage ="http://192.168.100.20:3000/Images/passport/";




}
