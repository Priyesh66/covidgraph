import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'first.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String location = "";
  DateTime date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(51.0),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Please press the Chat button on the bottom right to start with your Self-Assessment Test",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[600],
          child: Icon(Icons.chat),
          onPressed: () {
            //getTimeStamp();
            //userLocation();
            convertLocationToString();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FirstQuestion(
                        startTime: formatTimeOfDay(TimeOfDay.now()),
                        location: location)));
          },
        ));
  }

  getTimeStamp() {
    date = DateTime.now();
    print(DateTime.now());
  }

  Future<String> userLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    return position.toString();
    //convertLocationToString();
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    print(format.format(dt));
    return format.format(dt);
  }

  void convertLocationToString() {
    userLocation().then((value) {
      setState(() {
        print(value);
        location = value;
        print("users location tracked " + location);
      });
    });
  }
}
