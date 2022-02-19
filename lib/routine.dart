import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class routine extends StatefulWidget {
  const routine({Key? key}) : super(key: key);

  @override
  _routineState createState() => _routineState();
}

class _routineState extends State<routine> {
  final Telephony telephony = Telephony.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Routine',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: SelectableText(
                  "Every 12 hours has state of each component to be send to home",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 233, 79, 55)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _sandsmsch1();
                },
                child: Text("Save"))
          ],
        ),
      ),
    );
  }

  _sandsmsch1() async {
    telephony.sendSms(to: '123', message: 'Routine_8');
  }
}
