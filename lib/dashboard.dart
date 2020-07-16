import 'package:maps2/graph.dart';


import './heatmap.dart';
import 'package:flutter/material.dart';
import './dodonts.dart';
import 'Screens/chat.dart';

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "sample text",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        elevation: 0.0,
        /*actions: <Widget>[
          FlatButton(
            child: Text("Sign Out", style: TextStyle( color: Colors.white,),),
            onPressed: () async {
              try {
                Auth auth = Provider.of(context).auth;
                await auth.signOut();
              } catch (e) {
                print(e);
              }
            },
          )
        ],*/
        leading: Icon(Icons.menu),
      ),
      body: Baselayout(),
    );
  }
}

class Baselayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Good Morning\nUser",
                  style: TextStyle(fontSize: 25.0, color: Colors.blueAccent),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "Risk Level",
                  style: TextStyle(fontSize: 15.0, color: Colors.blueAccent),
                ),
              ],
            ),
//            Tracker(),
            Simplegraph(),
            Safe(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Asses(),
                Contact_tracing(),
              ],
            ),
            Heat_map(),
            Dos_dont(),
          ],
        ));
  }
}

class Tracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.2,
        child: RaisedButton(
          onPressed: () {
            //link page here
          },
          child: Text(
            "tracker details here",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          elevation: 5.0,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class Simplegraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Container(
          decoration: BoxDecoration(color: Colors.white),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.185,

//        child: RaisedButton(
////          padding: EdgeInsets.all(0.0),
////          elevation: 5.0,
////          shape: RoundedRectangleBorder(
////            borderRadius: new BorderRadius.circular(10.0)
////          ),
////          onPressed: () {
////            Navigator.push(context, MaterialPageRoute(builder: (context) {
////              return StatPage();
////            }));
////          },
          child: Graphone()),
    );
  }
}

class Safe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.08,
        child: RaisedButton(
          onPressed: () {
            //link page here
          },
          child: Text(
            "You are safe",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          elevation: 5.0,
          color: Colors.greenAccent,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class Asses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.15,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyHomePage(title: 'Self-Assessment')));
          },
          child: Text(
            "Asses yourself",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          elevation: 5.0,
          color: Colors.greenAccent,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class Contact_tracing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.15,
        child: RaisedButton(
          onPressed: () {
            //link page here
          },
          child: Text(
            "Contact tracing",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          elevation: 5.0,
          color: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class Heat_map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.08,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Heatmap();
            }));
          },
          child: Text(
            "Travel",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          elevation: 5.0,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class Dos_dont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.08,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Dod();
            }));
          },
          child: Text(
            "Dos and Donts",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          elevation: 5.0,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
