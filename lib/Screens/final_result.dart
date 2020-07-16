import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:maps2/dashboard.dart';

class Result extends StatefulWidget {
  final String age;
  final String startTime;
  final String result;
  final List<String> option1;
  final List<String> option2;
  final List<String> option3;
  final List<String> option4;
  final String ans;
  final String location;
  final String res;

  Result(
      {this.age,
      this.startTime,
      this.location,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.ans,
      this.result,
      this.res});

  @override
  State<StatefulWidget> createState() {
    return _Result();
  }
}

class _Result extends State<Result> {
  final databaseReference = Firestore.instance;

  var date;

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[600],
        title: Text(
          "BlueBot",
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            SizedBox(height: 10),

            //Normal text
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              margin: EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 0, top: 10, bottom: 10),
                child: Text(
                  widget.result,
                  maxLines: null,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: RaisedButton(
                  elevation: 5,
                  color: Colors.white,
                  onPressed: () {
                    count++;
                    debugPrint("End result " + widget.res);
                    date = formatTimeOfDay(TimeOfDay.now());
                    storeData();
                    navigateToScreen();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "End Assessment",
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    print(format.format(dt));
    return format.format(dt);
  }

  void storeData() async {
    print('Success');
    await databaseReference
        .collection("users")
        .document(count.toString())
        .setData({
      "age": widget.age,
      "startTime": widget.startTime,
      "location": widget.location,
      "symptoms1": widget.option1.toString(),
      "symptoms2": widget.option2.toString(),
      "medical_condition": widget.option3.toString(),
      "travel_history": widget.option4.toString(),
      "internation_travel_history": widget.ans,
      "end_time": date,
      "result": widget.res
    });
  }

  void navigateToScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Dash()));
  }
}
