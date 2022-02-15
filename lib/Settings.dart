import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

final _keyFirsName = GlobalKey<FormState>();
final _keyLastName = GlobalKey<FormState>();
final _keypersonalPhone = GlobalKey<FormState>();
final _keyhomePhone = GlobalKey<FormState>();

class _SettingsState extends State<Settings> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _personalPhone = TextEditingController();
  final TextEditingController _homePhone = TextEditingController();
  final TextEditingController _ch1 = TextEditingController();
  final TextEditingController _ch2 = TextEditingController();

  late String firstname, lastname, personalPhone, homePhone;
  String ch1 = 'Ch 1', ch2 = 'Ch 2';

  final CollectionReference info =
      FirebaseFirestore.instance.collection('user info');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 40),
              child: Row(
                children: [
                  Form(
                      key: _keyFirsName,
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                            onChanged: (value1) {
                              firstname = value1;
                            },
                            controller: _firstName,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person_add,
                                  color: Colors.deepPurple),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              labelText: "First Name",
                              labelStyle: TextStyle(
                                color: Color.fromARGB(200, 155, 29, 247),
                              ),
                              filled: true,
                            )),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20),
              child: Row(
                children: [
                  Form(
                      key: _keyLastName,
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                            onChanged: (value1) {
                              lastname = value1;
                            },
                            controller: _lastName,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person_add,
                                  color: Colors.deepPurple),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              labelText: "Last Name",
                              labelStyle: TextStyle(
                                color: Color.fromARGB(200, 155, 29, 247),
                              ),
                              filled: true,
                            )),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20),
              child: Row(
                children: [
                  Form(
                      key: _keypersonalPhone,
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                            onChanged: (value1) {
                              personalPhone = value1;
                            },
                            controller: _personalPhone,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person_add,
                                  color: Colors.deepPurple),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              labelText: "Personal Phone",
                              labelStyle: TextStyle(
                                color: Color.fromARGB(200, 155, 29, 247),
                              ),
                              filled: true,
                            )),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20),
              child: Row(
                children: [
                  Form(
                      key: _keyhomePhone,
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                            onChanged: (value1) {
                              homePhone = value1;
                            },
                            controller: _homePhone,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person_add,
                                  color: Colors.deepPurple),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              labelText: "Home Phone",
                              labelStyle: TextStyle(
                                color: Color.fromARGB(200, 155, 29, 247),
                              ),
                              filled: true,
                            )),
                      )),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Name of Controllers',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        onChanged: (val) {
                          ch1 = val;
                        },
                        controller: _ch1,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
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
                          labelText: "Control 1",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(200, 155, 29, 247),
                          ),
                          filled: true,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        onChanged: (val) {
                          ch2 = val;
                        },
                        controller: _ch2,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
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
                          labelText: "Control 2",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(200, 155, 29, 247),
                          ),
                          filled: true,
                        )),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text('continue'),
              onPressed: () {
                var data = {
                  'First Name': firstname,
                  'Last Name': lastname,
                  'Personal Phone': personalPhone,
                  'Home Phone': homePhone,
                  'Control 1': ch1,
                  'Control 2': ch2,
                };
                info.doc(getCurrentUserId()).set(data).catchError((error) {
                  print("Error: $error");
                });
                // info.doc(info.id).set(data).catchError((error) {
                //   print("Error: $error");
                // });
                Navigator.pushReplacementNamed(context, 'screen');
              },
            ),
            ElevatedButton(
                onPressed: () {
                  print(info.id);
                },
                child: Text('tap')),
          ],
        ),
      ),
    );
  }

  getCurrentUserId() {
    final pid = _auth.currentUser?.uid;
    return pid;
  }
}
