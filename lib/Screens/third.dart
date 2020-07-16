import 'package:flutter/material.dart';

import 'fourth.dart';

class ThirdQuestion extends StatefulWidget {
  final List<String> option1;
  final String age;
  final String startTime;
  final String location;

  ThirdQuestion({this.age, this.startTime, this.location, this.option1});

  @override
  State<StatefulWidget> createState() {
    return _ThirdQuestion();
  }
}

class ActorFilterEntry {
  const ActorFilterEntry(this.name);

  final String name;
}

class _ThirdQuestion extends State<ThirdQuestion> {
  bool isVisibleForNoneBtn = true;
  bool isVisibleForNextBtn = false;

  //Filters
  final List<ActorFilterEntry> _cast = <ActorFilterEntry>[
    const ActorFilterEntry('Fatigue'),
    const ActorFilterEntry('Headache'),
    const ActorFilterEntry('Diarrhea'),
    const ActorFilterEntry('Nausea'),
  ];
  List<String> _filters = <String>[];

  Iterable<Widget> get actorWidgets sync* {
    for (final ActorFilterEntry actor in _cast) {
      yield Padding(
        padding: const EdgeInsets.only(left: 8, right: 80, top: 8, bottom: 8),
        child: FilterChip(
          backgroundColor: Colors.white,
          selectedColor: Colors.grey[300],
          elevation: 5,
          label: Text(
            actor.name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          selected: _filters.contains(actor.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(actor.name);
                isVisibleForNextBtn = true;
                isVisibleForNoneBtn = false;
                print("'Look for: ${_filters.join(', ')}'");
              } else {
                _filters.removeWhere((String name) {
                  print("'Look for: ${_filters.join(', ')}'");
                  isVisibleForNextBtn = false;
                  isVisibleForNoneBtn = true;
                  return name == actor.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.age);
    debugPrint(widget.option1.toString());

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
                  "Do you have any of the following symptoms?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(
                    children: actorWidgets.toList(),
                  ),

                  //None of the above
                  Visibility(
                    visible: isVisibleForNoneBtn,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: ChoiceChip(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        label: Text(
                          "None of the above",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        selected: false,
                        onSelected: (selected) {
                          navigateToScreen();
                        },
                      ),
                    ),
                  ),

                  //Next Button
                  Visibility(
                    visible: isVisibleForNextBtn,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: RaisedButton(
                        elevation: 5,
                        color: Colors.white,
                        onPressed: () {
                          navigateToScreen();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.blue[900]),
                        ),
                      ),
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

  void navigateToScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FourthQuestion(
                  age: widget.age,
                  startTime: widget.startTime,
                  location: widget.location,
                  option1: widget.option1,
                  option2: _filters,
                )));
  }
}
