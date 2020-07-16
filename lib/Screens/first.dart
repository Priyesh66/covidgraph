import 'package:flutter/material.dart';

import 'second.dart';

class FirstQuestion extends StatefulWidget {
  final String startTime;
  final String location;

  FirstQuestion({this.startTime, this.location});

  @override
  State<StatefulWidget> createState() {
    return _FirstQuestion();
  }
}

class _FirstQuestion extends State<FirstQuestion> {
  String age = "";

  showChosenChip(String choice) {
    print("Location at First Screen " + widget.location);
    print("User has selected $choice");
  }

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
                    )),
                margin: EdgeInsets.all(5.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 0, top: 10, bottom: 10),
                  child: Text(
                    "Hello, there 👋 We understand times are tough and everyone is panicking.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
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
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Text(
                    "But we are here to help ease it out for you!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
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
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 15, top: 10, bottom: 10),
                  child: Text(
                    "Our coronavirus self-assessment scan has been developed on the basis of guidelines from the WHO",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
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
                    "What is your age?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              //Options
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
                          "Below 18",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        selected: false,
                        onSelected: (selected) {
                          setState(() {
                            age = "Below 18";
                            showChosenChip(age);
                            navigateToScreen();
                          });
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
                          "Between 18 to 65",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        selected: false,
                        onSelected: (selected) {
                          setState(() {
                            age = "Between 18 to 65";
                            showChosenChip(age);
                            navigateToScreen();
                          });
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
                          " Above 65",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w900,
                        ),
                        selected: false,
                        onSelected: (selected) {
                          setState(() {
                            age = "Above 65";
                            showChosenChip(age);
                            navigateToScreen();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
    //);
  }

  void navigateToScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondQuestion(
                age: age,
                startTime: widget.startTime,
                location: widget.location)));
  }
}
