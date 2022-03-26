import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kwanza_app/authentication/authentication_services.dart';
import 'package:kwanza_app/authentication/profile.dart';
import 'package:kwanza_app/model/profile.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  late GoogleMapController newGoogleMapController;

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-6.756370, 39.240800),
    zoom: 25.5,
  );

  Position? currentPosition;
  var geolocator = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber[400],
          title: Text(
            'School bus app',
            style: GoogleFonts.acme(
              textStyle: TextStyle(
                  color: Color.fromARGB(255, 16, 14, 141), letterSpacing: 1.0),
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 242, 245, 65),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                onDetailsPressed: (() {}),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 84, 94, 122)),
                currentAccountPicture: Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.white,
                ),
                arrowColor: Colors.black,
                accountName: Text(
                  'Elvis MREMA',
                  style: GoogleFonts.acme(
                    textStyle: TextStyle(
                        color: Color.fromARGB(255, 232, 232, 236),
                        letterSpacing: 1.0),
                  ),
                ),
                accountEmail: Text(
                  'elvismrema9@gmail.com',
                  style: GoogleFonts.acme(
                    textStyle: TextStyle(
                        color: Color.fromARGB(255, 229, 229, 233),
                        letterSpacing: 1.0),
                  ),
                ),
              ),
              // DrawerHeader(
              //   child: Icon(
              //     Icons.account_circle,
              //     size: 100,
              //     color: Color.fromARGB(255, 58, 44, 177),
              //   ),
              //   // Text('Welcome to Bus App'),

              //   decoration: const BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(
              //         color: Color.fromARGB(255, 29, 31, 170),
              //         width: 2,
              //       ),
              //     ),
              //     color: Colors.blue,
              //   ),
              // ),
              ListTile(
                title: Text(
                  'Profile',
                  style: GoogleFonts.acme(),
                ),
                // ignore: prefer_const_constructors
                leading: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 6, 5, 7),
                  size: 20,
                ),
                onLongPress: () => ProfilePage(),
              ),
              ListTile(
                title: Text(
                  'Bus Details',
                  style: GoogleFonts.acme(),
                ),
                leading: const Icon(
                  Icons.bus_alert_sharp,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 20,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'About us',
                  style: GoogleFonts.acme(),
                ),
                leading: const Icon(
                  Icons.ac_unit,
                  color: Color.fromARGB(255, 3, 3, 3),
                  size: 20,
                ),
                onTap: () => showAboutDialog(
                    context: context,
                    applicationName: 'School Bus Tracker',
                    applicationVersion: '1.0',
                    applicationLegalese: '2022'),
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
            const GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: _initialCameraPosition,
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.2,
              maxChildSize: 0.8,
              minChildSize: 0.2,
              expand: true,
              builder:
                  ((BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 20, 20, 20),
                    border: Border.fromBorderSide(BorderSide.none),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Scrollbar(
                    isAlwaysShown: false,
                    radius: const Radius.circular(8),
                    child: ListView.builder(
                      itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(Icons.watch_later,
                        color: Colors.amber,),
                        title: Text('EAT for Bus $index',
                        style: GoogleFonts.acme(
                    textStyle: TextStyle(
                        color: Color.fromARGB(255, 240, 236, 2),
                        letterSpacing: 1.0),
                  ),),
                        // tileColor: Colors.yellow,
                      );
                    }),
                  ),
                );
              }),
            )
            // Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(120.0),
            //       child: Center(
            //         child: FloatingActionButton(
            //             backgroundColor: Colors.blue,
            //             onPressed: (){},
            //             // Navigator.push(
            //             //     context,
            //             //     MaterialPageRoute(
            //             //         builder: (context) => Profile8Page())
            //             //         ),
            //             child: Icon(
            //               Icons.location_on,
            //               semanticLabel: 'Track bus',
            //               textDirection: TextDirection.ltr,
            //             )),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ));
  }
}
