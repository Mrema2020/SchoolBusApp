import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class BusDetail extends StatefulWidget {
  BusDetail({Key? key}) : super(key: key);

  @override
  State<BusDetail> createState() => _BusDetailState();
}

class _BusDetailState extends State<BusDetail> {
  var firestoreDb = FirebaseFirestore.instance.collection("bus").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bus Details",
          style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  letterSpacing: 2.0),
              fontSize: 20,
              fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder(
        stream: firestoreDb,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Padding(
            padding: const EdgeInsets.all(8.0),
            child: const CircularProgressIndicator(
              color: Colors.blue,
            ),

          );
          return ListView.builder(
              itemCount: (snapshot.data! as QuerySnapshot).docs.length,
              itemBuilder: (context, int index) {
                return CustomCard(
                    snapshot: snapshot.data! as QuerySnapshot, index: index);
                // return Text((snapshot.data! as return Text((snapshot.data! as QuerySnapshot).docs[index]['Driver']);QuerySnapshot).docs[index]['Driver']);
              });
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  QuerySnapshot snapshot;
  final int index;

  CustomCard({Key? key, required this.snapshot, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Driver Name',
          ),
          subtitle: Text(snapshot.docs[index]["Driver"]),
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 209, 191, 24),
            radius: 34,
            child: Icon(Icons.person),
          ),
        ),
        const Divider(
          color: Colors.black,
          endIndent: 2,
          thickness: 1.0,
          indent: 8,
        ),
        ListTile(
          title: Text('Driver Contacts'),
          subtitle: Text(snapshot.docs[index]["Driver Contacts"]),
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 209, 191, 24),
            radius: 34,
            child: Icon(Icons.contact_phone_sharp),
          ),
        ),
        Divider(
          color: Colors.black,
          endIndent: 2,
          thickness: 1.0,
          indent: 8,
        ),
        ListTile(
          title: Text('Bus Plate Number'),
          subtitle: Text(snapshot.docs[index]["Bus Number"]),
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 209, 191, 24),
            radius: 34,
            child: Icon(Icons.numbers_sharp),
          ),
        ),
        Divider(
          color: Colors.black,
          endIndent: 2,
          thickness: 1.0,
          indent: 8,
        ),
        ListTile(
          title: Text('Bus Route'),
          subtitle: Text(snapshot.docs[index]["Bus Route"]),
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 209, 191, 24),
            radius: 34,
            child: Icon(Icons.route),
          ),
        ),
        Divider(
          color: Colors.black,
          endIndent: 2,
          thickness: 1.0,
          indent: 8,
        ),
        // Text(snapshot.docs[index].data["Bus Number"])
      ],
    );
  }
}
