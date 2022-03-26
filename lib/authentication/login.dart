import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwanza_app/authentication/signup.dart';
import 'package:provider/provider.dart';
import 'authentication_services.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late FirebaseAuth _firebaseAuth;


  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Login",
                      style: GoogleFonts.acme(
                        textStyle: TextStyle(
                          color: Color.fromARGB(240, 1, 9, 24),
                          letterSpacing: 1.0,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login to parent account",
                      style: GoogleFonts.acme(
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 95, 95, 224),
                            letterSpacing: 1.0),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          label: Text(
                            "Email",
                            style: GoogleFonts.acme(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 29, 29, 37),
                                  letterSpacing: 1.0),
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          label: Text(
                            "Password",
                            style: GoogleFonts.acme(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 29, 29, 37),
                                  letterSpacing: 1.0),
                            ),
                          ),
                        ),
                      ),

                      // inputFile(label: "Email"),
                      // inputFile(label: "Password", obscureText: true)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(),
                      // border: const Border(
                      //   bottom: BorderSide(color: Colors.black),
                      //   top: BorderSide(color: Colors.black),
                      //   left: BorderSide(color: Colors.black),
                      //   right: BorderSide(color: Colors.black),
                      // )
                    ),
                    child: MaterialButton(
                      minWidth: 120,
                      height: 40,
                      onPressed: (){
                        
                        context.read<AuthenticationService>().signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                      },
                      color: const Color.fromARGB(255, 29, 80, 189),
                      // elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                right: 12, top: 6, bottom: 6),
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                          Text('Loading'),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      autofocus: true,
                      child: Text(
                        "Create Account (Sign Up)",
                        style: GoogleFonts.fahkwang(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 105, 105, 204),
                            letterSpacing: 1.0,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 100, bottom: 100),
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/elly.png"),
                        fit: BoxFit.fitHeight),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
