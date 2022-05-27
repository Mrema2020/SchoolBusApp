import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kwanza_app/authentication/authentication_services.dart';
import 'package:kwanza_app/markers/location.dart';
import 'package:kwanza_app/markers/markers.dart';
import 'package:kwanza_app/model/busdetails.dart';
import 'package:kwanza_app/pages/interface.dart';
import 'package:kwanza_app/pages/mappage.dart';
import 'package:kwanza_app/pages/welcome.dart';
import 'package:kwanza_app/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-6.771268271773868, 39.239895301958086),
    zoom: 15.5,
  );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController newGoogleMapController;

  static LatLng _bus = LatLng(-6.771268271773868, 39.239895301958086);
  static LatLng _bus2 = LatLng(-6.771268271773868, 38.239895301958086);

  Position? currentPosition;

  var geolocator = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      drawerScrimColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber[400],
        title: Text(
          'School Bus App',
          style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0), letterSpacing: 1.0),
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 242, 245, 65),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              onDetailsPressed: (() {}),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 84, 94, 122),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(9))),
              currentAccountPicture: const Icon(
                Icons.account_circle,
                size: 80,
                color: Colors.white,
              ),
              arrowColor: Colors.black,
              accountName: Text(
                'Mac Donald',
                style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 232, 232, 236),
                      letterSpacing: 1.0),
                ),
              ),
              accountEmail: Text(
                'S o m e b o d y @ gmail.gk',
                style: GoogleFonts.acme(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 229, 229, 233),
                      letterSpacing: 1.0),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Profile',
                style: GoogleFonts.acme(),
              ),
              // ignore: prefer_const_constructors
              leading: Icon(
                Icons.person_outline,
                color: const Color.fromARGB(255, 6, 5, 7),
                size: 20,
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InterfaceScreen())),
            ),
            Divider(
              thickness: 1.5,
              endIndent: 4,
              indent: 8,
              color: Colors.green,
            ),
            ListTile(
              title: Text(
                'Bus Details',
                style: GoogleFonts.acme(),
              ),
              leading: const Icon(
                Icons.bus_alert_outlined,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 20,
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BusDetail())),
            ),
            Divider(
              thickness: 1.5,
              endIndent: 4,
              indent: 8,
              color: Colors.green,
            ),
            ListTile(
              title: Text(
                'Settings',
                style: GoogleFonts.acme(),
              ),
              // ignore: prefer_const_constructors
              leading: Icon(
                Icons.settings_outlined,
                color: const Color.fromARGB(255, 6, 5, 7),
                size: 20,
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Setting())),
            ),
            Divider(
              thickness: 1.5,
              endIndent: 4,
              indent: 8,
              color: Colors.green,
            ),
            ListTile(
              title: Text(
                'Report kid absence',
                style: GoogleFonts.acme(),
              ),
              // ignore: prefer_const_constructors
              leading: Icon(
                Icons.sms_outlined,
                color: const Color.fromARGB(255, 6, 5, 7),
                size: 20,
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReportScreen())),
            ),
            Divider(
              thickness: 1.5,
              endIndent: 4,
              indent: 8,
              color: Colors.green,
            ),
            ListTile(
              title: Text(
                'About us',
                style: GoogleFonts.acme(),
              ),
              leading: const Icon(
                Icons.info_outline,
                color: Color.fromARGB(255, 3, 3, 3),
                size: 20,
              ),
              onTap: () => showAboutDialog(
                context: context,
                applicationName: 'School Bus Tracking App',
                applicationVersion: '1.0',
                applicationLegalese: '2022',
              ),
            ),
            Divider(
              thickness: 1.5,
              endIndent: 4,
              indent: 8,
              color: Colors.green,
            ),
            ListTile(
              title: Text(
                'Logout',
                style: GoogleFonts.acme(),
              ),
              leading: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 2, 2, 3),
                size: 20,
              ),
              onTap: () {
                context.read<AuthenticationService>().signOut();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
                    // markers: {busMarker, busMarker2},
                    mapType: MapType.terrain,
                    initialCameraPosition: HomeScreen._initialCameraPosition,
                    // trafficEnabled: true,
                    myLocationEnabled: true,
                    compassEnabled: true,
                    buildingsEnabled: true,
                    mapToolbarEnabled: true,
                    // markers: getMarkers(),
                  ),
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 30,
                width: 100,
                child: Container(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: (() {}),
                        highlightColor: Colors.red,
                        child: Text(
                          'ETA 25min',
                          style: GoogleFonts.dmSans(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 152, 173, 209)),
                ),
              ),
            ],
          ),
          // FloatingActionButton(
          //     onPressed: () {}, child: const Icon(Icons.icecream))
        ],
      ),
    );
  }

//   Marker busMarker = Marker(
//       markerId: const MarkerId("bus"),
//       position: _bus,
//       infoWindow: InfoWindow(title: "bus"),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose));
//   Marker busMarker2 = Marker(
//       markerId: const MarkerId("bus"),
//       position: _bus2,
//       infoWindow: InfoWindow(title: "bus"),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose));
//

  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();

  //   if (!serviceEnabled) {
  //     return Future.error('Location Services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();

  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();

  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permission is denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permission is permanent denied, we can not request permission');
  //   }

  //   return await Geolocator.getCurrentPosition();
  // }
}

class Marker {
  String gps;
  late double latitude;
  late double longitude;

  Marker({required this.gps, required this.latitude, required this.longitude});

  Marker.fromJson(this.gps, Map data) {
    latitude = data['latitude'];
    longitude = data['longitude'];
  }
}

late List<Marker> _markers;

// Get the markers from database for a local collection.
Future<List<Marker>> getMarkers() async {
  _markers.clear();
  var _dbRef = FirebaseDatabase.instance.ref().once();
  await _dbRef.then(
    (dataSnapShot) async {
      // Access the markers from database.
      Map<dynamic, dynamic> mapMarkers =
          (dataSnapShot).snapshot.value as Map<Object?, dynamic>;

      // Get the markers in a local collection.
      mapMarkers.forEach(
        (key, value) {
          Marker marker = Marker.fromJson(key, value);
          _markers.add(Marker(
              gps: key,
              latitude: double.parse(marker.latitude.toString()),
              longitude: double.parse(marker.longitude.toString())));
        },
      );
    },
  );
  return _markers;
}
