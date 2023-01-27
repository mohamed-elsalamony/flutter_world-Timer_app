import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    Map myName = ModalRoute.of(context)!.settings.arguments as Map;
     String bging = myName["isDayTime"]? "day.png" : "night.png";
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/$bging"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(146, 90, 104, 223)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                color: Color.fromARGB(111, 0, 0, 0),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 33),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      myName["time"],
                      style: TextStyle(fontSize: 55, color: Colors.white),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 20,
                    ),
                    Text(myName["myName"],
                        style: TextStyle(fontSize: 35, color: Colors.white))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
