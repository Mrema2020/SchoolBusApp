import 'package:flutter/material.dart';

class InterfaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawerScrimColor: Colors.black,
      backgroundColor: Color.fromARGB(255, 196, 193, 173),
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Color.fromARGB(255, 180, 164, 17),
          actions: [
            IconButton(
            icon: Icon(Icons.notifications_active_outlined),
            onPressed: (){},
          ),
          ],
        ),
        drawer: Drawer(
          semanticLabel: 'Drawer',
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(),
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Child profile'),
                    SizedBox(
                      height: 1.5,
                    ),
                    Container(
                      height: 150,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromARGB(255, 92, 235, 39),
                      ),
                      child: Card(
                        child: ListTile(
                            isThreeLine: true,
                            leading: Icon(Icons.person),
                            title: Text('Beatus Mlinga'),
                            subtitle: Text('Kwanza International School')),
                        color: Color.fromARGB(255, 92, 235, 36),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Guadian Profile'),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      height: 150,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromARGB(255, 235, 77, 129),
                      ),
                      child: Card(
                          color: Color.fromARGB(255, 235, 77, 129),
                          elevation: 8,
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Mabula Mlinga'),
                            subtitle: Text('Guadian Profile'),
                          )),
                    ),
                   
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Icon(Icons.bus_alert_outlined),),
        );
  }
}
