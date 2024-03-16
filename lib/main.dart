import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:navigate/address_details.dart';
import 'package:navigate/map_screen.dart';
import 'package:navigate/phone.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter user location ',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const MyPhone(),
    );
  }
}

//MyHomePage(title: 'Flutter user location')

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.controller});

  final String title;
  final TextEditingController controller;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late String lat;
  late String long;
  late String add;


  String latt="";
  String longg="";
  String address = "";
  String pp="";
  getcurr() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    }
    else {
      Position currentposition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      log("Latitude=${currentposition.latitude.toString()}");
      log("Longitude=${currentposition.longitude.toString()}");

      latt = currentposition.latitude.toString();
      longg = currentposition.longitude.toString();
      pp=widget.controller.text;
      ////
      List<Placemark> placemarks = await placemarkFromCoordinates(currentposition.latitude, currentposition.longitude);

      address = placemarks[0].street! + " " + placemarks[0].country!;
      log("Adddd : $address");
        for(int i=0; i<placemarks.length; i++) {
          print("INDEX $i ${placemarks[i]}");
        }
    }
  }

  String locationMessage = 'Current user Location';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
               locationMessage,
              style: TextStyle(
                fontSize: 30,
              ),
            ),


            ////-----


            ElevatedButton(onPressed: (){
              // _getCurrentLocation().then((value) {
              //   lat = '${value.latitude}';
              //   long = '${value.longitude}';
              //   setState(() {
              //     locationMessage = 'Latitude: $lat, Longitude: $long';
              //   });
              //   // _liveLocation();
              // });

              getcurr();
              lat = '$latt';
              long = '$longg';
              add = '$address';
              setState(() {
                locationMessage = 'Latitude: $lat, Longitude: $long, Address: $add';
              });
                //getAddress(28.6312, 77.3709);
            },
          ////----

            // ElevatedButton(onPressed: () async{
            //   Position position = await _getGeoLocationPosition();
            //   location ='Lat: ${position.latitude} , Long: ${position.longitude}';
            //   GetAddressFromLatLong(position);
            // },

                child:
            Text('get current location',)),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute (builder: (context) => MapScreen(lati: double.parse(lat), longi: double.parse(long))));
            }, child: Text('Open Google Map')),

            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute (builder: (context) => AddressDetails(addr: address, l1: latt, l2: longg, p: pp,)));
            }, child: Text('Add more address details')),
          ],
        ),
      ),
    );
  }
}
