import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name for the UI
  String time; //the time in the location
  String flag; //url to an assets flag icon
  String url; //location url for api endpoint
  bool isDaytime; //true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    //make request
    http.Response response = await http.get(Uri.https('worldtimeapi.org','/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    //print(data)

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    //set the time property
    isDaytime = now.hour > 6 && now.hour <18 ? true : false;
    time = DateFormat.jm().format(now);
  }



}


