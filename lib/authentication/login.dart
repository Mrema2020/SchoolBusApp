import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwanza_app/authentication/signup.dart';
import 'package:provider/provider.dart';
import 'authentication_services.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/background2.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: SizedBox(
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
                        //   "Login",
                        //   style: GoogleFonts.acme(
                        //     textStyle: const TextStyle(
                        //       color: Color.fromARGB(238, 231, 231, 227),
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
                          "Login to parent account",
                          style: GoogleFonts.acme(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 187, 240, 167),
                                letterSpacing: 1.0),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 1,
                              controller: emailController,
                              decoration: InputDecoration(
                                label: Text(
                                  "Email",
                                  style: GoogleFonts.acme(
                                    textStyle: const TextStyle(
                                        color: Color.fromARGB(255, 29, 29, 37),
                                        letterSpacing: 1.0),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                fillColor: Color.fromARGB(255, 231, 222, 222),
                                filled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              obscureText: _secureText,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  label: Text(
                                    "Password",
                                    style: GoogleFonts.acme(
                                      textStyle: const TextStyle(
                                          color: Color.fromARGB(255, 29, 29, 37),
                                          letterSpacing: 1.0),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 3,
                                      )),
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

                            // inputFile(label: "Email"),
                            // inputFile(label: "Password", obscureText: true)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(),
                        ),
                        child: MaterialButton(
                          textColor: Colors.white,
                          minWidth: 120,
                          height: 40,
                          onPressed: () {
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
                          child: Text(
                            'Login',
                            style: GoogleFonts.acme(
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 29, 29, 37),
                                  letterSpacing: 1.0),
                            ),
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
                            "Create Account (Register)",
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
                    
                  ],
                ))
              ],
            ),
          ),
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
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow))),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
