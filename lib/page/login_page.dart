import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foody_business/page/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatelessWidget {
  late TextEditingController _controllerEmail = TextEditingController();
  late TextEditingController _controllerPassword = TextEditingController();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.black,
                Colors.black54,
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 150,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 325,
                height: 520,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Image(
                      image: AssetImage('assets/logo_black.png'),
                      width: 200,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Please Login to Your Account",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 260,
                      height: 60,
                      child: TextField(
                        controller: _controllerEmail,
                        onChanged: (String value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.envelope,
                              color: Colors.black26,
                            ),
                            labelText: "Email Address",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 260,
                      height: 60,
                      child: TextField(
                        controller: _controllerPassword,
                        obscureText: true,
                        onChanged: (String value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.eyeSlash,
                              color: Colors.black26,
                            ),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: signIn,
                      //TODO: Text with warning if the password or login is incorrect
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.black,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim());
  }
}
