import 'package:flutter/material.dart';

class Loacatoin extends StatefulWidget {
  const Loacatoin({Key? key}) : super(key: key);

  @override
  State<Loacatoin> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Loacatoin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color.fromARGB(71, 0, 0, 0),
        title: Text("Choose Location",),
      ),
      body: Column(
      
        children: [
        Card(
          color: Color.fromARGB(97, 204, 220, 57),
          child: ListTile(
            onTap: (){},
            title: Text("Eygpy Cairo"),
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/egypt.png"),),
          ),
        )
        ],
      ),
    );
  }
}