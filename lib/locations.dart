import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Unassigned {
  final String notes;
  final String active;
  final String confirmed;
  final String decreased;
  final String recovered;
  Unassigned(
      {this.notes,
      this.active,
      this.confirmed,
      this.decreased,
      this.recovered});

  factory Unassigned.fromJson(Map<String, dynamic> json) {
    return Unassigned(
      notes: "notes",
      active: "active",
      confirmed: "confirmed",
      decreased: "decreased",
      recovered: "recovered",
    );
  }
}


Future fetchListUser() async {
  final response = await http.get('https://api.covid19india.org/state_district_wise.json');
  var users = json.decode(response.body);
  return users;
}