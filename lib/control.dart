import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'package:toggle_switch/toggle_switch.dart';

class control extends StatefulWidget {
  const control({Key? key}) : super(key: key);

  @override
  _controlState createState() => _controlState();
}

class _controlState extends State<control> {
  final Telephony telephony = Telephony.instance;

  final CollectionReference info =
      FirebaseFirestore.instance.collection('user info');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String num;
  late String msgch1 = "Ch1_OFF", msgch2 = 'Ch2_OFF';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Control"),
      ),
      drawer: Drawer(),
      body: FutureBuilder<DocumentSnapshot>(
        future: info.doc(getCurrentUserId()).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Somthing went wrong');
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text('Document des not exist');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Center(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${data['Control 1']}',
                    style: TextStyle(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ToggleSwitch(
                      minWidth: 90.0,
                      cornerRadius: 50.0,
                      activeBgColors: [
                        [Colors.green[800]!],
                        [Colors.red[800]!]
                      ],
                      animate: true,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: ['ON', 'OFF'],
                      radiusStyle: true,
                      onToggle: (index) {
                        // print('switched to: $index');
                        if (index == 0) {
                          msgch1 = "Ch1_ON";
                        } else if (index == 1) {
                          msgch1 = "Ch1_OFF";
                        }
                      },
                    ),
                  ),
                  Text(
                    '${data['Control 2']}',
                    style: TextStyle(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ToggleSwitch(
                      minWidth: 90.0,
                      cornerRadius: 50.0,
                      activeBgColors: [
                        [Colors.green[800]!],
                        [Colors.red[800]!]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: ['ON', 'OFF'],
                      radiusStyle: true,
                      onToggle: (index) {
                        if (index == 0) {
                          msgch2 = "Ch2_ON";
                        } else if (index == 1) {
                          msgch2 = "Ch2_OFF";
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        num = data['Home Phone'];
                        _sandSMS(msgch1, msgch2, num);
                      },
                      child: Text('save'))
                ],
              ),
            ));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  getCurrentUserId() {
    final pid = _auth.currentUser?.uid;
    return pid;
  }

  _sandSMS(msg1, msg2, phone) async {
    telephony.sendSms(to: phone, message: '$msg1:$msg2');
  }
}
