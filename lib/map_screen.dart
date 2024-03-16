import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final double lati;
  final double longi;
  // final String addr;
  const MapScreen({super.key, required this.lati, required this.longi});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  // void addCustomIcon(){
  //   BitmapDescriptor.fromAssetImage(ImageConfiguration(), assetName)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // Center(
      //
      //   child:Column(
      //     children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.lati, widget.longi),
                // jiit : 28.6312, 77.3709
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: MarkerId("demo"),
                  position: LatLng(widget.lati, widget.longi),
                  draggable: true,
                  onDragEnd: (value) {

                  },
                  icon: markerIcon,
                ),
              },
            ) ,
            // ElevatedButton(onPressed: (){}, child: Text(
            //
            //     'add more details :)',
            // ))
      //     ],
      //   )
      //
      // )

    );
  }
}
