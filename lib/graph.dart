import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:http/http.dart' as http;
import 'package:maps2/ui/pages/homepage.dart';



//void graph() => runApp(new MaterialApp(
//  home: new HomePage(),
//));

class Graphone extends StatefulWidget {
  @override
  GraphState createState() => GraphState();
}

class GraphState extends State<Graphone> {
  final String url = "https://api.covid19india.org/data.json";

  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['cases_time_series'];
    });
    return "Success";
  }
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(3.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)
          ),
        onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          },
      color: Colors.white,
      child: new ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data == null ? 0 : 1,
          reverse: false,
          itemBuilder: (BuildContext context, int index) {
            index = data.length-1;
            return new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: <Widget>[
                    SizedBox(height: 10.0,),
                    Text('Daily', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 10.0)),
                    Text('Confirmed', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12.0)),
                    SizedBox(height: 10.0,),
                    Text(data[index]['dailyconfirmed'], style: TextStyle(color: Colors.red, fontSize: 23.0),),
                    SizedBox(height: 10.0,),
                    new Container(
                        width: 60.0,
                        height: 30.0,
                        child:  new Sparkline(data: [double.parse(data[index-6]["dailyconfirmed"]), double.parse(data[index-5]["dailyconfirmed"]), double.parse(data[index-4]["dailyconfirmed"]), double.parse(data[index-3]["dailyconfirmed"]), double.parse(data[index-2]["dailyconfirmed"]), double.parse(data[index-1]["dailyconfirmed"]), double.parse(data[index]["dailyconfirmed"])],
                          pointsMode: PointsMode.last,
                          pointSize: 6.0,
                          pointColor: Colors.red,
                          lineColor: Colors.red,
                          fillMode: FillMode.below,
                          fillColor: Colors.red[50],),
                        padding: const EdgeInsets.all(1.0)),

                  ],
                ),
                SizedBox(width: 10.0),
                Column(
                  children: <Widget>[
                    SizedBox(height: 10.0,),
                    Text('Daily', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 10.0)),
                    Text('Deceased', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12.0)),
                    SizedBox(height: 10.0,),
                    Text(data[index]['dailydeceased'], style: TextStyle(color: Colors.blue, fontSize: 23.0),),
                    SizedBox(height: 10.0,),
                    new Container(
                        width: 60.0,
                        height: 30.0,
                        child:  new Sparkline(data: [double.parse(data[index-6]["dailydeceased"]), double.parse(data[index-5]["dailydeceased"]), double.parse(data[index-4]["dailydeceased"]), double.parse(data[index-3]["dailydeceased"]), double.parse(data[index-2]["dailydeceased"]), double.parse(data[index-1]["dailydeceased"]), double.parse(data[index]["dailydeceased"])],
                          pointsMode: PointsMode.last,
                          pointSize: 6.0,
                          pointColor: Colors.blue,
                          lineColor: Colors.blue,
                          fillMode: FillMode.below,
                          fillColor: Colors.blue[50],),
                        padding: const EdgeInsets.all(1.0)),
                  ],
                ),
                SizedBox(width: 10.0),
                Column(
                  children: <Widget>[
                    SizedBox(height: 10.0,),
                    Text('Daily', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 10.0)),
                    Text('  Recovered', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12.0)),
                    SizedBox(height: 10.0,),
                    Text(data[index]['dailyrecovered'], style: TextStyle(color: Colors.green, fontSize: 23.0),),
                    SizedBox(height: 10.0,),
                    new Container(
                        width: 60.0,
                        height: 30.0,
                        child:  new Sparkline(data: [double.parse(data[index-6]["dailyrecovered"]), double.parse(data[index-5]["dailyrecovered"]), double.parse(data[index-4]["dailyrecovered"]), double.parse(data[index-3]["dailyrecovered"]), double.parse(data[index-2]["dailyrecovered"]), double.parse(data[index-1]["dailyrecovered"]), double.parse(data[index]["dailyrecovered"])],
                          pointsMode: PointsMode.last,
                          pointSize: 6.0,
                          pointColor: Colors.green,
                          lineColor: Colors.green,
                          fillMode: FillMode.below,
                          fillColor: Colors.green[100],),
                        padding: const EdgeInsets.all(1.0)),
                  ],
                ),
                SizedBox(width: 7.0),
                Column(
                  children: <Widget>[
                    SizedBox(height: 10.0,),
                    Text('Total', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 10.0)),
                    Text('Confirmed', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 12.0)),
                    SizedBox(height: 10.0,),
                    Text(data[index]['totalconfirmed'], style: TextStyle(color: Colors.black54, fontSize: 23.0), ),
                    SizedBox(height: 10.0,),
                    new Container(
                        width: 50.0,
                        height: 30.0,
                        child:  new Sparkline(data: [double.parse(data[index-6]["totalconfirmed"]), double.parse(data[index-5]["totalconfirmed"]), double.parse(data[index-4]["totalconfirmed"]), double.parse(data[index-3]["totalconfirmed"]), double.parse(data[index-2]["totalconfirmed"]), double.parse(data[index-1]["totalconfirmed"]), double.parse(data[index]["totalconfirmed"])],
                          pointsMode: PointsMode.last,
                          pointSize: 6.0,
                          pointColor: Colors.black,
                          lineColor: Colors.black,
                          fillMode: FillMode.below,
                          fillColor: Colors.black12,),
                        padding: const EdgeInsets.all(1.0)),
                  ],
                ),
              ],

            );
          },


      ),
    );
  }
}