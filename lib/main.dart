import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kwanza_app/authentication/authentication_services.dart';
import 'package:kwanza_app/model/map.dart';
import 'package:kwanza_app/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kwanza_app/pages/welcome.dart';
import 'package:provider/provider.dart';
import 'authentication/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges, 
          initialData: null 
          ),
      ],
      child: MaterialApp(
      title: 'School Bus App',
      theme: ThemeData(
        
        primarySwatch: Colors.red,
      ),
       debugShowCheckedModeBanner: false,
      home: const AuthenticationWrapper()
    ),
    );
  }
}


class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null){
      return const HomeScreen();
      }
     return LoginPage(); 
  }
}
