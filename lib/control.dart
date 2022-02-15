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
      body: StreamBuilder(
          stream: info.doc(getCurrentUserId().toString()).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              Map<String, dynamic> data = snapshot.data?.data();
              // Map<String, dynamic> data =snapshot.data!.data() as Map<String, dynamic>;

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
                      padding: const EdgeInsets.all(20.0),
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
                        labels: const ['ON', 'OFF'],
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
                        labels: const ['ON', 'OFF'],
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
            return const CircularProgressIndicator();
          }),
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

// var aaa = MaterialApp(
//   home: Scaffold(
//     appBar: AppBar(
//       title: Text("Control"),
//     ),
//     body: Center(
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               onChanged: (val) {
//                 num = val;
//               },
//             ),
//             Text("Ch1"),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ToggleSwitch(
//                 minWidth: 90.0,
//                 cornerRadius: 50.0,
//                 activeBgColors: [
//                   [Colors.green[800]!],
//                   [Colors.red[800]!]
//                 ],
//                 animate: true,
//                 activeFgColor: Colors.white,
//                 inactiveBgColor: Colors.grey,
//                 inactiveFgColor: Colors.white,
//                 initialLabelIndex: 1,
//                 totalSwitches: 2,
//                 labels: ['ON', 'OFF'],
//                 radiusStyle: true,
//                 onToggle: (index) {
//                   // print('switched to: $index');
//                   if (index == 0) {
//                     msgch1 = "Ch1_ON";
//                   } else if (index == 1) {
//                     msgch1 = "Ch1_OFF";
//                   }
//                 },
//               ),
//             ),
//             Text("Ch2"),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ToggleSwitch(
//                 minWidth: 90.0,
//                 cornerRadius: 50.0,
//                 activeBgColors: [
//                   [Colors.green[800]!],
//                   [Colors.red[800]!]
//                 ],
//                 activeFgColor: Colors.white,
//                 inactiveBgColor: Colors.grey,
//                 inactiveFgColor: Colors.white,
//                 initialLabelIndex: 1,
//                 totalSwitches: 2,
//                 labels: ['ON', 'OFF'],
//                 radiusStyle: true,
//                 onToggle: (index) {
//                   if (index == 0) {
//                     msgch2 = "Ch2_ON";
//                   } else if (index == 1) {
//                     msgch2 = "Ch2_OFF";
//                   }
//                 },
//               ),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   _sandsmsch1(msgch1, msgch2);
//                 },
//                 child: Text('save'))
//             // ToggleSwitch(
//             //   minWidth: 90.0,
//             //   minHeight: 70.0,
//             //   initialLabelIndex: 0,
//             //   cornerRadius: 20.0,
//             //   activeFgColor: Colors.white,
//             //   inactiveBgColor: Colors.grey,
//             //   inactiveFgColor: Colors.white,
//             //   totalSwitches: 2,
//             //   icons: [
//             //     Icon(Icons.person),
//             //     // FontAwesomeIcons.solidLightbulb,
//             //   ],
//             //   iconSize: 30.0,
//             //   activeBgColors: [
//             //     [Colors.black45, Colors.black26],
//             //     [Colors.yellow, Colors.orange]
//             //   ],
//             //   animate:
//             //       true, // with just animate set to true, default curve = Curves.easeIn
//             //   curve: Curves
//             //       .bounceInOut, // animate must be set to true when using custom curve
//             //   onToggle: (index) {
//             //     print('switched to: $index');
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     ),
//   ),
// );
