import 'package:flutter/material.dart';

import 'final_result.dart';

class SixthQuestion extends StatefulWidget {
  final List<String> option1;
  final List<String> option2;
  final List<String> option3;
  final List<String> option4;
  final String age;
  final String startTime;
  final String location;

  SixthQuestion(
      {this.age,
      this.startTime,
      this.location,
      this.option1,
      this.option2,
      this.option3,
      this.option4});

  @override
  State<StatefulWidget> createState() => _SixthQuestion();
}

class _SixthQuestion extends State<SixthQuestion> {
  String ans = "";
  String res = "";
  showChosenChip(String choice) {
    print("User has selected $choice");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.age);
    debugPrint(widget.option1.toString());
    debugPrint(widget.option2.toString());
    debugPrint(widget.option3.toString());
    debugPrint(widget.option4.toString());

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
                  )),
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.only(right: 30.0),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 0, top: 10, bottom: 10),
                child: Text(
                  "Have you traveled anywhere internationally in the last 28-45 days?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: ChoiceChip(
                      backgroundColor: Colors.white,
                      elevation: 5,
                      label: Text(
                        "Yes",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      selected: false,
                      onSelected: (selected) {
                        ans = "Yes";
                        debugPrint("The result is " + calResult());
                        navigateToResult();
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: ChoiceChip(
                      backgroundColor: Colors.white,
                      elevation: 5,
                      label: Text(
                        "No",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      selected: false,
                      onSelected: (selected) {
                        ans = "No";
                        //showChosenChip(ans);
                        debugPrint("The result is " + calResult());
                        navigateToResult();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String calResult() {
    String result = "";
    if ((widget.option1.isNotEmpty) &&
        (widget.option2.isEmpty) &&
        (widget.option3.isEmpty) &&
        (widget.option4.isNotEmpty)) {
      result =
          "Your infection risk is Low. We recommend that you stay at home to avoid any chances of exposure to the Novel Coronavirus."
          "\n \nRetake the Self-Assessment Test if you develop more symptoms or come in contact with a COVID-19 confirmed patient.";
    } else if ((widget.option1.isNotEmpty) &&
        (widget.option2.isNotEmpty) &&
        (widget.option3.isEmpty) &&
        (widget.option4.isNotEmpty)) {
      result =
          "Your infection risk is Medium. We recommend that you stay at home to avoid any chances of greater exposure to the Novel Coronavirus.\n \nIf your symptoms increase, we would recommend you to please visit the nearest covid centre and get yourself tested.";
    } else if ((widget.option1.isNotEmpty) &&
        (widget.option2.isNotEmpty) &&
        (widget.option3.isNotEmpty) &&
        (widget.option4.isNotEmpty)) {
      result =
          "Your infection risk is High. We highly recommend that you visit the nearest covid centre and get yourself tested and also self quarantine yourself at the earliest.";
    } else {
      result =
          "Your infection risk is Low. We recommend that you stay a home to avoid any chances of exposure to the Novel Coronavirus."
          "\n \nRetake the Self-Assessment Test if you develop more symptoms or come in contact with a COVID-19 confirmed patient.";
    }

    return result;
  }

  void navigateToResult() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Result(
                age: widget.age,
                startTime: widget.startTime,
                location: widget.location,
                option1: widget.option1,
                option2: widget.option2,
                option3: widget.option3,
                option4: widget.option4,
                ans: ans,
                result: calResult(),
                res: res)));
  }
}
