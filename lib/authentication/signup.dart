import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'authentication_services.dart';

class SignupPage extends StatefulWidget {

  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   // brightness: Brightness.light,
      //   backgroundColor: const Color.fromARGB(255, 236, 223, 29),
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back_ios,
      //       size: 20,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: SizedBox(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/background3.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(top: 100, bottom: 100),
                      height: 100,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/elly.png"),
                            fit: BoxFit.fitHeight,
                            opacity: 10,
                            
                            ),
                            shape: BoxShape.circle,
                            
                            
                      ),
                    ),
                  // Text(
                  //   "Sign up",
                  //   style: GoogleFonts.acme(
                  //     textStyle: const TextStyle(
                  //       color: Color.fromARGB(240, 1, 9, 24),
                  //       letterSpacing: 1.0,
                  //       fontSize: 28,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 9, 9, 20),
                          letterSpacing: 1.0),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text(
                        "Email",
                        style: GoogleFonts.acme(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 30, 30, 41),
                              letterSpacing: 1.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text(
                        "Username",
                        style: GoogleFonts.acme(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 30, 30, 41),
                              letterSpacing: 1.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                   const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    obscuringCharacter: '*',
                    obscureText: _secureText,
                    controller: passwordController,
                    decoration: InputDecoration(
                        label: Text(
                          "Password",
                          style: GoogleFonts.acme(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 21, 21, 31),
                                letterSpacing: 1.0),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(_secureText
                              ? Icons.remove_red_eye
                              : Icons.security),
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                        )),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(),
                ),
                child: MaterialButton(
                  minWidth: 150,
                  height: 40,
                  onPressed: () {
                    context.read<AuthenticationService>().signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                  },
                  color: const Color.fromARGB(255, 29, 80, 189),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 8, 8, 10),
                          letterSpacing: 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 700,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.acme(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 6, 6, 14),
                            letterSpacing: 1.0),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 16, 75),
                    letterSpacing: 1.0,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
