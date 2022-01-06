import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key, required this.title}) : super(key: key);
  // final String title;

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  int numObtained = 0;
  int numNeeded = 0;
  final TextEditingController _controller = TextEditingController();
  int output = 0;

  //_controller.addListener();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toontown Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children: [

          //select cog type
          Column(
              children: const [
                Text('Select cog type:'),
                Text('ENTER SPINNER HERE'),
              ]),

          //get num obtained
          Row(
            children:  const <Widget>[
              Text('Enter total # credit obtained: '),
              Text('TEXTFIELD HERE'),
            ]),

          //get num needed
          Row(children:   [
            const Text('Enter total # credit needed: '),
            //Text('TEXTFIELD HERE'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Label Test',
                hintText: 'Hint Test',
              ),
            )
          ]),

          ]
        )
      ))

    );
  }
}

