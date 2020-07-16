import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Dod extends StatefulWidget {
  Dod1 createState() => Dod1();
}

class Dod1 extends State<Dod> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bluesoft",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Precaution"),
        ),
        body: getListView(),
      ),
    );
  }

// ignore: missing_return
  Widget getListView() {
    // ignore: unused_local_variable
    var listView = ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 10.0, right: 5.0, top: 10.0, bottom: 10.0),
                      child: Row(children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Consult A \nDoctor\nIf Sick!!",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12.5,
                                  fontFamily: 'KronaOne',
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  "Click her to buy medicines",
                                  style: TextStyle(
                                      color: Colors.amber, fontSize: 10.0),
                                ),
                                onTap: () => launch('https://www.medlife.com/'),
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(30.0),
                        child: GestureDetector(
                          child: Image(
                            alignment: Alignment.center,
                            image: AssetImage('image/doctor.png'),
                          ),

                          //link for doctor /medicine
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 40.0),
                      padding: EdgeInsets.only(left: 10.0),
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('image/mask.png'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 5.0, right: 10.0, top: 10.0, bottom: 10.0),
                      child: Row(children: <Widget>[
                        Text(
                          "Wear Mask \nWhenever \nGoing Out \nIn Public",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 9.0,
                            fontFamily: 'KronaOne',
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 40.0, right: 5.0, top: 10.0, bottom: 10.0),
                      child: Row(children: <Widget>[
                        Text(
                          "Avoid!!\nUsing Public\nTransport",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.blue,
                            // fontSize: 15.0,
                            fontFamily: 'KronaOne',
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 90,
                      height: 90,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(30.0),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('image/travel.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(35.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 40.0, right: 2.0),
                      padding: EdgeInsets.all(5.0),
                      width: 115,
                      height: 115,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(30.0),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('image/socialdistance.png'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 40.0, right: 10.0, top: 10.0, bottom: 10.0),
                      child: Row(children: <Widget>[
                        Text(
                          "Avoid \nClose Contact\nWith Anyone",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.0,
                            fontFamily: 'KronaOne',
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 10.0, right: 5.0, top: 10.0, bottom: 10.0),
                      child: Row(children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Clean Your\nVegetables\nBefore\nUsing Them!!",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13.0,
                                  fontFamily: 'KronaOne',
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  "Click her to buy vegetables",
                                  style: TextStyle(
                                      color: Colors.amber, fontSize: 10.0),
                                ),
                                onTap: () =>
                                    launch('https://www.bigbasket.com/'),
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 90,
                      height: 90,
                      child: GestureDetector(
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(30.0),
                          child: Image(
                            alignment: Alignment.center,
                            image: AssetImage('image/vegetables.png'),
                          ),
                        ),
                        onTap: () => launch('https://www.medlife.com/'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(15.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 40.0),
                      padding: EdgeInsets.all(9.8),
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('image/hands.png'),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(right: 10.0, top: 12.0, bottom: 12.0),
                      child: Row(children: <Widget>[
                        Text(
                          "Wash Your\nhands\nRegularly!",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 9.0,
                            fontFamily: 'KronaOne',
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(15.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        left: 15.0,
                        right: 10.0,
                      ),
                      child: Row(children: <Widget>[
                        Text(
                          "Sneezing\nInto Your\nElbows",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 8.0,
                            fontFamily: 'KronaOne',
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20.0,
                      ),
                      padding: EdgeInsets.all(10.0),
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(30.0),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('image/sneezing.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 40.0),
                      padding: EdgeInsets.all(10.0),
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(30.0),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('image/stayhome.png'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Row(children: <Widget>[
                        Text(
                          "Stay Home!\nStay Safe!",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12.0,
                            fontFamily: 'KronaOne',
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(40.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 50.0, right: 40.0, top: 20.0, bottom: 20.0),
                      child: Row(children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Use Digital Payment",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 28.0,
                                  fontFamily: 'KronaOne',
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  "Click her to pay",
                                  style: TextStyle(
                                      color: Colors.amber, fontSize: 20.0),
                                ),
                                onTap: () => launch('https://paytm.com/'),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40.0, right: 5.0),
                          padding: EdgeInsets.all(10.0),
                          width: 150,
                          height: 150,
                          child: GestureDetector(
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(30.0),
                              child: Image(
                                alignment: Alignment.center,
                                image: AssetImage('image/digital-wallet.png'),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
    return listView;
  }
}
