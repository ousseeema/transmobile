
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class autoPlaces extends StatelessWidget {
  Icon icon ;
  String hintText ;
  String labelText ;
  autoPlaces({super.key, required this.icon, required this.hintText, required this.labelText});

  @override
  Widget build(BuildContext context) {
    TextEditingController googlecontroller = TextEditingController();
    return Padding(
      padding:  EdgeInsets.only(left: Dimenssions.LRpadmarg20, right: Dimenssions.LRpadmarg20),
      child: GooglePlaceAutoCompleteTextField(
      
                googleAPIKey: "AIzaSyBkKs82L66jBg20jlFOGMwJL6oljrKGDV8",
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimenssions.radius20)
                  ),
                inputDecoration:  InputDecoration(
                   
                  hintText: hintText,
                  labelText: labelText,
                  border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(Dimenssions.radius20)

                  ),
                  prefixIcon: icon,
                  labelStyle: const TextStyle(
                    color: AppColors.mainTextColor
                  ),
                  
                  errorBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(Dimenssions.radius20)

                  ),
                  focusedErrorBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(Dimenssions.radius20)

                  ),
                  focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(Dimenssions.radius20)

                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimenssions.radius20)

      
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimenssions.radius20)
                  )
      
                ),
               getPlaceDetailWithLatLng: (Prediction prediction) {
             // this method will return latlng with place detail
            print("placeDetails" + prediction.lng.toString());
            }, 
               itemClick: (Prediction prediction) {
             googlecontroller.text=prediction.description!;
              googlecontroller.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
            },
              textEditingController: googlecontroller,
              seperatedBuilder:const  Divider(),
               containerHorizontalPadding: 10,
               itemBuilder:(context, index, Prediction prediction){
                return Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.location_on),
                   const  SizedBox(
                      width: 7,
                    ),
                    Expanded(child:  Text("${prediction.description??""}"))
                  ],
                ),
              );
               } ,
             
        
               
               ),
    );
  }
}