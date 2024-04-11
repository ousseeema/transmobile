// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/repository/client/ClientRepo.dart';
import 'package:transmobile/view/utils/shared.dart';

class HomeController extends GetxController {
  List<TripModel> alltrips = [];
  List<TripModel> trips = [
    TripModel(
        id: "445453453",
        transporter: TransporterModel(id: "zaadqscqc", fullName: "fullName", email: "email", phoneNumberA: "phoneNumberA", phoneNumberB: "phoneNumberB", DestinationAddress: "DestinationAddress", localAddress: "localAddress", carBrand: "carBrand", carSerieNumber: "carSerieNumber", listCountry1: "listCountry1", listCountry2: "listCountry2", homePickUps: true, homeDelivery: false, priceKg: 10, parsols: true, parsolsSite: ["amazon"], Adresse_Parsols: "Adresse_Parsols", numberofTrips: 10, numberofClients: 10, numberofPackages: 11, role: "role", totalRevenue: 1000, verified: true, profilePicture: "profilePicture", pro: true, createdAt: "414/575/58585", comments: []),
        citys: [
          City(id: "lzmkdqsdqsd",
              city: "Djerba",
              dateofpassage:' DateTime(2024, 3, 28)',
              done: true),
                
          City(id: "lzmkdqsdqsd",
              city: "sfax",
              dateofpassage:' DateTime(2024, 3, 28)',
              done: false),
              City(id: "lzmkdqsdqsd",city: "lyon", dateofpassage: 'DateTime(2024, 3,28)',done: false) 
        ],
        homePickUp: true,
        homeDelivery: true,
        packages: [],
        isDone: false,
        createdAt:'DateTime(2024,14,14)'),
        TripModel(
        id: "445453453",
        transporter: TransporterModel(id: "zaadqscqc", fullName: "fullName", email: "email", phoneNumberA: "phoneNumberA", phoneNumberB: "phoneNumberB", DestinationAddress: "DestinationAddress", localAddress: "localAddress", carBrand: "carBrand", carSerieNumber: "carSerieNumber", listCountry1: "listCountry1", listCountry2: "listCountry2", homePickUps: true, homeDelivery: false, priceKg: 10, parsols: true, parsolsSite: ["amazon"], Adresse_Parsols: "Adresse_Parsols", numberofTrips: 10, numberofClients: 10, numberofPackages: 11, role: "role", totalRevenue: 1000, verified: true, profilePicture: "profilePicture", pro: true, createdAt: "414/575/58585", comments: []),
        citys: [
          City(id: "lzmkdqsdqsd",
              city: "Djerba",
              dateofpassage: 'DateTime(2024, 3, 28)',
              done: false),
          City(id: "lzmkdqsdqsd",
              city: "sfax",
              dateofpassage: 'DateTime(2024, 3, 28)',
              done: false),
              City(id: "lzmkdqsdqsd",city: "lyon", dateofpassage: 'DateTime(2024, 3,28)',done: true) 
        ],
        homePickUp: true,
        homeDelivery: true,
        packages: [],
        isDone: false,
        createdAt:'DateTime(2024,14,14)'),
        TripModel(
        id: "445453453",
        transporter: TransporterModel(id: "zaadqscqc", fullName: "fullName", email: "email", phoneNumberA: "phoneNumberA", phoneNumberB: "phoneNumberB", DestinationAddress: "DestinationAddress", localAddress: "localAddress", carBrand: "carBrand", carSerieNumber: "carSerieNumber", listCountry1: "listCountry1", listCountry2: "listCountry2", homePickUps: true, homeDelivery: false, priceKg: 10, parsols: true, parsolsSite: ["amazon"], Adresse_Parsols: "Adresse_Parsols", numberofTrips: 10, numberofClients: 10, numberofPackages: 11, role: "role", totalRevenue: 1000, verified: true, profilePicture: "profilePicture", pro: true, createdAt: "414/575/58585", comments: []),
        citys: [
          City(id: "lzmkdqsdqsd",
              city: "Djerba",
              dateofpassage: 'DateTime(2024, 3, 28)',
              done: true),
          City(id: "lzmkdqsdqsd",
              city: "sfax",
              dateofpassage: 'DateTime(2024, 3, 28)',
              done: true),
              City(id: "lzmkdqsdqsd",city: "lyon", dateofpassage: 'DateTime(2024, 3,28)',done: true) 
        ],
        homePickUp: true,
        homeDelivery: true,
        packages: [],
        isDone: false,
        createdAt: 'DateTime(2024,14,14)'),
         TripModel(
        id: "445453453",
        transporter: TransporterModel(id: "zaadqscqc", fullName: "fullName", email: "email", phoneNumberA: "phoneNumberA", phoneNumberB: "phoneNumberB", DestinationAddress: "DestinationAddress", localAddress: "localAddress", carBrand: "carBrand", carSerieNumber: "carSerieNumber", listCountry1: "listCountry1", listCountry2: "listCountry2", homePickUps: true, homeDelivery: false, priceKg: 10, parsols: true, parsolsSite: ["amazon"], Adresse_Parsols: "Adresse_Parsols", numberofTrips: 10, numberofClients: 10, numberofPackages: 11, role: "role", totalRevenue: 1000, verified: true, profilePicture: "profilePicture", pro: true, createdAt: "414/575/58585", comments: []),
        citys: [
          City(
            id: "lzmkdqsdqsd",
              city: "Djerba",
              dateofpassage: 'DateTime(2024, 3, 28)',
              done: true),
          City(
            id: "lzmkdqsdqsd",
              city: "sfax",
              dateofpassage: 'DateTime(2024, 3, 28)',
              done: true),
              City(
                id: "lzmkdqsdqsd",city: "lyon", dateofpassage:' DateTime(2024, 3,28)',done: true) 
        ],
        homePickUp: true,
        homeDelivery: true,
        packages: [],
        isDone: false,
        createdAt: 'DateTime(2024,14,14)'),
        TripModel(
        id: "445453453",
        transporter: TransporterModel(id: "zaadqscqc", fullName: "fullName", email: "email", phoneNumberA: "phoneNumberA", phoneNumberB: "phoneNumberB", DestinationAddress: "DestinationAddress", localAddress: "localAddress", carBrand: "carBrand", carSerieNumber: "carSerieNumber", listCountry1: "listCountry1", listCountry2: "listCountry2", homePickUps: true, homeDelivery: false, priceKg: 10, parsols: true, parsolsSite: ["amazon"], Adresse_Parsols: "Adresse_Parsols", numberofTrips: 10, numberofClients: 10, numberofPackages: 11, role: "role", totalRevenue: 1000, verified: true, profilePicture: "profilePicture", pro: true, createdAt: "414/575/58585", comments: []),
        citys: [
          City(id: "lzmkdqsdqsd",
              city: "Djerba",
              dateofpassage: 'DateTime(2024, 3, 28)',
              done: true),
          City(id: "lzmkdqsdqsd",
              city: "sfax",
              dateofpassage:' DateTime(2024, 3, 28)',
              done: true),
              City(id: "lzmkdqsdqsd",city: "lyon", dateofpassage: 'DateTime(2024, 3,28)',done: true) 
        ],
        homePickUp: true,
        homeDelivery: true,
        packages: [],
        isDone: false,
        createdAt:' DateTime(2024,14,14)'),
 
  ];
  bool isloading = true;
  ClientModel? client;

  Future<void> LoadData() async {
    alltrips = [];
    // this is the responsable if we tap in refresh button this will display the shimmer effect
    isloading = true;
    update();

    // connverting the user data into client model
    
   await shared.getuser().then((value) {
        client = ClientModel.fromJson(jsonDecode(value!));
       });
    // getting the transporter's from the data base
    Response TripsResponse = await ClientRepo().GetAllTrips();
    Response TripResponse = await ClientRepo().GetCurrentTrip();
    // adding the stats endpoint in the future

    if (TripResponse.body["success"] && TripResponse.body["success"]) {
      //all trips
      TripsResponse.body['data'].forEach((trip) =>
          alltrips.add(TripModel.fromJson(trip)));
          //current trip
      TripResponse.body["data"]
          .forEach((trip) => trips.add(TripModel.fromJson(trip)));

      isloading = false;
      update();
    } else {
      Get.snackbar("Error", "Error while getting data , Try reloading the page",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
