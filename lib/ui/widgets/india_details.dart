

import 'package:maps2/data/models/daily_data.dart';
import 'package:maps2/data/models/my_state_data.dart';




import 'package:maps2/ui/widgets/patient_data_table.dart';


import 'package:flutter/material.dart';


class IndiaDetails extends StatelessWidget {
  final Map<String, List> patientDataMap;
  List<MyStateData> stateWiseData;
  List<DailyData> dailyData;
  MyStateData totalStateData;

  IndiaDetails({@required this.patientDataMap}) {
    stateWiseData = this.patientDataMap["state_wise_data"];

    totalStateData = stateWiseData.firstWhere((item) => item.state == "Total");
    print(totalStateData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 0,
      ),
      child: Column(
        children: <Widget>[




          PatientDataTable(
            stateWiseData: stateWiseData,
            isStateDataTable: true,
          )
        ],
      ),
    );
  }
}
