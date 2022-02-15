import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/main.dart';

import 'methods.dart';

class signUp extends StatefulWidget {
  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordR = TextEditingController();

  late String userName, email, password, passwordR;
  // late String firstname, lastname, personalPhone, homePhone;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //       width: 300,
              //       child: TextField(
              //         onChanged: (val){
              //           firstname=val;
              //         },
              //           controller: _firstName,
              //           obscureText: false,
              //           keyboardType: TextInputType.name,
              //           decoration: const InputDecoration(
              //             icon: Icon(Icons.person, color: Colors.deepPurple),
              //             focusedBorder: OutlineInputBorder(
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(15)),
              //                 borderSide: BorderSide(
              //                     color: Colors.deepPurple, width: 2)),
              //             enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.all(Radius.circular(15)),
              //               borderSide:
              //                   BorderSide(color: Colors.deepPurple, width: 2),
              //             ),
              //             labelText: "your First Name",
              //             labelStyle: TextStyle(
              //               color: Color.fromARGB(200, 155, 29, 247),
              //             ),
              //             filled: true,
              //           ))),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: SizedBox(
              //       width: 300,
              //       child: TextField(
              //           onChanged: (val){
              //            lastname=val;
              //           },
              //           controller: _lastName,
              //           obscureText: false,
              //           keyboardType: TextInputType.name,
              //           decoration: const InputDecoration(
              //             icon: Icon(Icons.person, color: Colors.deepPurple),
              //             focusedBorder: OutlineInputBorder(
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(15)),
              //                 borderSide: BorderSide(
              //                     color: Colors.deepPurple, width: 2)),
              //             enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.all(Radius.circular(15)),
              //               borderSide:
              //                   BorderSide(color: Colors.deepPurple, width: 2),
              //             ),
              //             labelText: "your Last Name",
              //             labelStyle: TextStyle(
              //               color: Color.fromARGB(200, 155, 29, 247),
              //             ),
              //             filled: true,
              //           ))),
              // ),
              // Center(
              //   child: Row(
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.all(8.0),
              //         child: SizedBox(
              //             width: 150,
              //             child: TextField(
              //                 onChanged: (val){
              //                   personalPhone=val;
              //                 },
              //                 controller: _personalPhone,
              //                 obscureText: false,
              //                 keyboardType: TextInputType.phone,
              //                 decoration: const InputDecoration(
              //                   icon:
              //                       Icon(Icons.phone, color: Colors.deepPurple),
              //                   focusedBorder: OutlineInputBorder(
              //                       borderRadius:
              //                           BorderRadius.all(Radius.circular(15)),
              //                       borderSide: BorderSide(
              //                           color: Colors.deepPurple, width: 2)),
              //                   enabledBorder: OutlineInputBorder(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(15)),
              //                     borderSide: BorderSide(
              //                         color: Colors.deepPurple, width: 2),
              //                   ),
              //                   labelText: "your phone",
              //                   labelStyle: TextStyle(
              //                     color: Color.fromARGB(200, 155, 29, 247),
              //                   ),
              //                   filled: true,
              //                 ))),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.all(8.0),
              //         child: SizedBox(
              //             width: 150,
              //             child: TextField(
              //                 onChanged: (val){
              //                   homePhone=val;
              //                 },
              //                 controller: _homePhone,
              //                 obscureText: false,
              //                 // onChanged: (text) {
              //                 //   setState(() {
              //                 //     homephone = text;
              //                 //   });
              //                 // },
              //                 keyboardType: TextInputType.phone,
              //                 decoration: const InputDecoration(
              //                   icon:
              //                       Icon(Icons.phone, color: Colors.deepPurple),
              //                   focusedBorder: OutlineInputBorder(
              //                       borderRadius:
              //                           BorderRadius.all(Radius.circular(15)),
              //                       borderSide: BorderSide(
              //                           color: Colors.deepPurple, width: 2)),
              //                   enabledBorder: OutlineInputBorder(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(15)),
              //                     borderSide: BorderSide(
              //                         color: Colors.deepPurple, width: 2),
              //                   ),
              //                   labelText: "your home phone",
              //                   labelStyle: TextStyle(
              //                     color: Color.fromARGB(200, 155, 29, 247),
              //                   ),
              //                   filled: true,
              //                 ))),
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Create your Account',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                    width: 300,
                    child: TextField(
                        onChanged: (value1) {
                          userName = value1;
                        },
                        controller: _userName,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon:
                              Icon(Icons.person_add, color: Colors.deepPurple),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.deepPurple, width: 2),
                          ),
                          labelText: "User Name",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(200, 155, 29, 247),
                          ),
                          filled: true,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                    width: 300,
                    child: TextField(
                        onChanged: (value1) {
                          email = value1;
                        },
                        controller: _email,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email_rounded,
                              color: Colors.deepPurple),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.deepPurple, width: 2),
                          ),
                          labelText: "your EmailAddress",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(200, 155, 29, 247),
                          ),
                          filled: true,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                    width: 300,
                    child: TextField(
                        onChanged: (value2) {
                          password = value2;
                        },
                        controller: _password,
                        obscureText: true,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.vpn_key, color: Colors.deepPurple),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.deepPurple, width: 2),
                          ),
                          labelText: "your Password",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(200, 155, 29, 247),
                          ),
                          filled: true,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                child: SizedBox(
                    width: 300,
                    child: TextField(
                        onChanged: (value2) {
                          passwordR = value2;
                        },
                        controller: _passwordR,
                        obscureText: true,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.vpn_key, color: Colors.deepPurple),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.deepPurple, width: 2),
                          ),
                          labelText: "Repeat Password'",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(200, 155, 29, 247),
                          ),
                          filled: true,
                        ))),
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      if (password == passwordR) {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email.trim(), password: password);
                        if (newUser != null) {
                          _userName.clear();
                          _email.clear();
                          _password.clear();
                          _passwordR.clear();
                          Navigator.pushReplacementNamed(
                              context, MyApp.settings);
                        }
                      } else {
                        // _showSnackBarForP();
                      }
                    } catch (e) {
                      print(e);
                    }
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => WelcomePage(
                    //         name: _firstName.text,
                    //         email: _email.text,
                    //         phone: _personalPhone.text)));
                  },
                  child: Text('Next')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyApp.settings);
                  },
                  child: Text('test'))
              // Padding(
              //   padding: const EdgeInsets.only(top: 10),
              //   child: RaisedButton(
              //     onPressed: () async {
              //       if (_keyUserName.currentState.validate() &&
              //           _keyEmail.currentState.validate() &&
              //           _keyPassword.currentState.validate() &&
              //           _keyPasswordR.currentState.validate()) {
              //         if (createPassword == createPasswordR) {
              //           try {
              //             await _auth
              //                 .createUserWithEmailAndPassword(
              //                 email: createEmail,
              //                 password: createPassword)
              //                 .then((username) {
              //               username.user
              //                   .updateProfile(displayName: createName);
              //               getCurrentUserId();
              //               print(getCurrentUserId());
              //               if (dropdownValue == 'Doctor') {
              //                 Navigator.pushReplacementNamed(
              //                     context, MyApp.DOCTOR_PROFILE);
              //                 //  _controller.clear();
              //               } else {
              //                 Navigator.pushReplacementNamed(
              //                     context, MyApp.PATIENT_SELECT);
              //               }
              //             });
              //           } catch (e) {
              //             print(e);
              //             getMessageFromErrorCode(e.code);
              //             _showSnackBar(e.code);
              //           }
              //         } else
              //           _showSnackBarForP();
              //       } else {
              //         //please fix the errors
              //       }
              //     },
              //     color: Colors.orange,
              //     child: Text(
              //       'Next',
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
