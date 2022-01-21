import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'calculation.dart';

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

  void updateText() {
    setState(() {
      output = calculation(cogtype, numObtained, numNeeded);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    const TextStyle _inputLabelTextStyle = TextStyle(
      color: Colors.black,
      fontFamily: 'monospace',
      fontSize: 14.0,
      // backgroundColor: Colors.red,
    );

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Toontown Calculator'),
            ),
            body: Column(children: <Widget>[
              // WHOLE FRAME

              // OUT
              Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    width: size.shortestSide,
                    child: Text(
                      output,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 40.0,
                          color: Colors.amber,
                          fontFamily: "Caveat",
                          fontWeight: FontWeight.w700),
                    ),
                  )), // OUTPUT TEXT

              // IN
              Expanded(
                  flex: 2,
                  // INPUT CONTAINER
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      width: size.shortestSide,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //select cog type
                            Expanded(
                              flex: 1,
                              child: Column(children: [
                                const Text('Select cog type:',
                                    textAlign: TextAlign.center,
                                    style: _inputLabelTextStyle),
                                DropdownButton(
                                  value: cogtype,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.blueAccent,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      cogtype = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    bossbot,
                                    lawbot,
                                    cashbot,
                                    sellbot
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ]),
                            ),

                            //get num obtained
                            Expanded(
                                flex: 1,
                                child: Row(children: <Widget>[
                                  const Text(
                                      'Enter total # \ncredit obtained: ',
                                      style: _inputLabelTextStyle),
                                  Flexible(
                                      // flex: 2,
                                      child: TextField(
                                    onChanged: (text) {
                                      setState(() {
                                        numObtained = int.parse(text);
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: '# Already obtained',
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 40.0),
                                    ),
                                    controller: _controllerA,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                  )),
                                ])),

                            //get num needed
                            Expanded(
                                flex: 1,
                                child: Row(children: <Widget>[
                                  const Text('Enter total # \ncredit needed: ',
                                      style: _inputLabelTextStyle),
                                  Flexible(
                                      // flex: 2,
                                      child: TextField(
                                          controller: _controllerB,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Total # Needed',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 40.0),
                                          ),
                                          onChanged: (text) {
                                            setState(() {
                                              numNeeded = int.parse(text);
                                            });
                                          }))
                                ])),
                          ]))), // END INPUT CONTAINER

              // CALCULATE BUTTON
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        child: const Text("CALCULATE"),
                        onPressed: () {
                          updateText();
                        },
                      )))
            ])));
  }
}
