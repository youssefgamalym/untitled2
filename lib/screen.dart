import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart ';

class screen extends StatefulWidget {
  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('select'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: CircleAvatar(
                        child: Image.asset('images/smarthome.png')),
                  ),
                ),
              ),
              // ListTile(
              //   leading: Icon(Icons.logout, color: Colors.deepPurple),
              //   title: Text('Log out'),
              //   onTap: () {
              //     Navigator.pushNamed(context, 'login');
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.info_outline, color: Colors.deepPurple),
                title: Text('about'),
                onTap: () {
                  Navigator.pushNamed(context, 'home');
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.deepPurple),
                title: Text('Log out'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'home');
                  // Navigator.pushNamed(context, 'home');
                },
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'control');
                  },
                  child: Text('control'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'routine');
                    },
                    child: Text('Routine')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
