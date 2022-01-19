import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cogfacilities/calculation.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key, required this.title}) : super(key: key);
  // final String title;

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String cogtype = 'Bossbot'; //default value
  static const String bossbot = 'Bossbot';
  static const String lawbot = 'Lawbot';
  static const String cashbot = 'Cashbot';
  static const String sellbot = 'Sellbot';
  String output = "You need: ";

  int numObtained = 0;
  int numNeeded = 0;

  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();

  void updateText(){
    setState(() {
      output = calculation(cogtype, numObtained, numNeeded);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Toontown Calculator'),
        ),
        body: SingleChildScrollView(
          child: Center( // WHOLE FRAME
          child: Column(
          children: <Widget>[

            Text(output,
           textAlign: TextAlign.center,
           style: const TextStyle(
             fontSize: 40.0,
             color: Colors.amber,
             fontFamily: "Caveat",
             fontWeight: FontWeight.w700
           )) ,// OUTPUT TEXT

          Container( // INPUT
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          width: size.shortestSide,
          color: Colors.teal,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //select cog type
            Column(children: [
              const Text('Select cog type:'),
              DropdownButton(
                value: cogtype,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    cogtype = newValue!;
                  });
                },
                items: <String>[bossbot, lawbot, cashbot, sellbot]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ]),

            //get num obtained
            Row(children: <Widget>[
              const Text('Enter total # credit obtained: '),
              Container(
                  width: 100,
                  height: 50,
                  child: TextField(
                    controller: _controllerA,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '# Already obtained',
                      contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                    ),
                    onChanged: (text) {
                      setState(() {
                        numObtained = int.parse(text);
                      });
                    },
                  ))
            ]),

            //get num needed
            Row(children: <Widget>[
              const Text('Enter total # credit needed: '),
              Container(
                  width: 200,
                  height: 50,
                  child: TextField(
                    controller: _controllerB,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Total # Needed',
                      contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                    ),
                    onChanged: (text) {
                      setState(() {
                        numNeeded = int.parse(text);
                      });
                    },
                  ))
            ]),
          ])
          ), // END INPUT CONTAINER

          TextButton(onPressed: () {
            updateText();
          }, child: Text("CALCULATE"))
          ]

          )))
    );
  }
}
