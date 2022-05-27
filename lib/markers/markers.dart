// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';


// class Marker {
//   String gps;
//   late double latitude;
//   late double longitude;

//   Marker(
//       {required this.gps, required this.latitude, required this.longitude});

//   Marker.fromJson(this.gps, Map data) {
//     latitude = data['latitude'];
//     longitude = data['longitude'];
//   }
// }
//  late List<Marker> _markers;
 
//  // Get the markers from database for a local collection.
//   Future<List<Marker>> getMarkers() async {
//     _markers.clear();
//     var _dbRef = FirebaseDatabase.instance.ref().once();
//     await _dbRef.then(
//       (dataSnapShot) async {
//         // Access the markers from database.
//         Map<dynamic, dynamic> mapMarkers = dataSnapShot.value;

//         // Get the markers in a local collection.
//         mapMarkers.forEach(
//           (key, value) {
//             Marker marker = Marker.fromJson(key, value);
//             _markers.add(Marker(
//                 gps: key,
//                 latitude: double.parse(marker.latitude.toString()),
//                 longitude: double.parse(marker.longitude.toString())));
//           },
//         );
//       },
//     );
//     return _markers;
//   }

// //  body: Padding(
// //         padding: EdgeInsets.all(8),
// //         //Get the markers as collection and update the Maps widget.
// //         child: FutureBuilder(
// //           future: getMarkers(),
// //           builder: (context, snapshot) {
// //             if (snapshot.hasData) {
// //               return SfMaps(
// //                 layers: <MapLayer>[
// //                   MapShapeLayer(
// //                     source: _dataSource,
// //                     initialMarkersCount: _markers.length,
// //                     markerBuilder: (BuildContext context, int index) {
// //                       return MapMarker(
// //                         latitude: _markers[index].latitude,
// //                         longitude: _markers[index].longitude,
// //                       );
// //                     },
// //                   ),
// //                 ],
// //               );
// //             }
// //             return Text('Loading');
// //           },
// //         ),
// //       ),
