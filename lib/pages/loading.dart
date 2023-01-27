// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Loading> {
  getData() async {
    late bool isDayTime;
    Response receivedDateFormApi = await get(
        Uri.parse("http://worldtimeapi.org/api/timezone/Africa/Cairo"));
    Map receivedData = jsonDecode(receivedDateFormApi.body);
    DateTime datetimee = DateTime.parse(receivedData["utc_datetime"]);
    print(datetimee);
    int offest = int.parse(receivedData["utc_offset"].substring(0, 3));
    print(offest);

    DateTime newTDataTime = datetimee.add(Duration(hours: offest));
    print(newTDataTime.hour);
    if (newTDataTime.hour > 5 && newTDataTime.hour < 6) {
       isDayTime = true;
    }else{
        isDayTime = false;
    }
    String timeNow = DateFormat('h:mm a').format(newTDataTime);
    print(timeNow);
    String timeZone = receivedData["timezone"];
    print(timeZone);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "time": timeNow,
      "myName": timeZone,
      "isDayTime" : isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SpinKitFadingCircle(
              color: Color.fromARGB(255, 146, 16, 16),
              size: 90.0,
            )
          ],
        ),
      ),
    );
  }
}
