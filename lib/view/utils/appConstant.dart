// ignore_for_file: non_constant_identifier_names
class AppConstant  {
  static String baseurl = "http://192.168.1.22:3000/api/v0";
   static String socekturl = "http://192.168.1.22:3000";
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
  static String usergetCurrentTrips = "/clients/currentTrips";
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
  static String transacceptDemande = "/transporteurs/acceptDemande/";
  static String TransrefuseDemande = "/transporteurs/refuseDemande/";
  static String Transgetalldemande = "/transporteurs/getAllDemande";
  static String TransaddTrip = "/transporteurs/addtrip";
  static String TransupdateTrip = "/transporteurs/updateTrip/";
  static String TransDeleteTrip = "/transporteurs/deleteTrip/";
  static String TransAddsinglePackage = "/transporteurs/addSinglepackage/";
  static String TransgetAllTripInHistory = "/transporteurs/getAlltrips";
  static String TransaddTriptohistory = "/transporteurs/addtriptohistory/";
  static String getCurrentTransporteur = "/transporteurs/getCurrentTransporter";
static String getCurrentTrip = "/transporteurs/getCurrentTrip";
static String TransGetListOfMessage = "/transporteurs/getListofMessage";
static String TransGetverified = "/transporteurs/Getverified";
static String TransContactAdmin = "/transporteurs/contactAdmin";
static String TransGetAllverificationDemande = "/transporteurs/getallverifictionDemande";
static String TranschangePassword = "/transporteurs/changepassword";
static String TranschangeEmail = "/transporteurs/changeemail";
static String TransgetAllPackage = "/transporteurs/getAllPackage";



 
 
  
 /// images path
  static String Clientimage ="${socekturl}/Images/private/users/";
    static String Transimage ="${socekturl}/Images/private/transporteurs";
      static String Packagesimage ="${socekturl}/Images/packages/";
  static String Passportimage ="${socekturl}/Images/passport/";




}
