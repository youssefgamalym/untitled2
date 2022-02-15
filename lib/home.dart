import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final TextEditingController _emaillogin = TextEditingController();
  final TextEditingController _passwordlogin = TextEditingController();
  late String emaillogin, passwordlogin;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var high = MediaQuery.of(context).size.height;
    var widh = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Welcome ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.deepPurpleAccent),
        body: Container(
          height: high,
          width: widh,
          color: Colors.blue,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    height: 300,
                    child: Image.asset('images/3644294.jpg'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 8),
                    child: SizedBox(
                        width: 300,
                        height: 75,
                        child: TextField(
                            onChanged: (value1) {
                              emaillogin = value1;
                            },
                            controller: _emaillogin,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email, color: Colors.deepPurple),
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
                              labelText: "your Email",
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(200, 155, 29, 247)),
                              filled: true,
                            ))),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: SizedBox(
                        width: 300,
                        height: 75,
                        child: TextField(
                            onChanged: (value2) {
                              passwordlogin = value2;
                            },
                            controller: _passwordlogin,
                            obscureText: true,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              icon:
                                  Icon(Icons.vpn_key, color: Colors.deepPurple),
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
                              labelText: "your Password",
                              labelStyle: TextStyle(
                                color: Color.fromARGB(200, 155, 29, 247),
                              ),
                              filled: true,
                            ))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, 'signUp');
                            Navigator.pushReplacementNamed(
                                context, MyApp.signUp);
                            // Navigator.push(context,MaterialPageRoute(builder: (context) => login()));
                            _emaillogin.clear();
                            _passwordlogin.clear();
                          },
                          child: const Text('Sing UP')),
                      ElevatedButton(
                          onPressed: () async {
                            try {
                              final User =
                                  await _auth.signInWithEmailAndPassword(
                                      email: emaillogin,
                                      password: passwordlogin);
                              if (User != null) {
                                // Navigator.pushNamed(context, 'screen');
                                Navigator.pushReplacementNamed(
                                    context, MyApp.screen);
                                _emaillogin.clear();
                                _passwordlogin.clear();
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                          // Navigator.push(context,MaterialPageRoute(builder: (context) => login()));
                          ,
                          child: const Text('Sign In')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
