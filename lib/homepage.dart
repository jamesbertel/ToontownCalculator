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
  TextEditingController controller = TextEditingController();
    // controller.addListener();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
             children: <Widget>[

               //num obtained
               TextField(
                 // controller: controller,
                 onChanged: (text) { numObtained = text as int; },
                 decoration: const InputDecoration(labelText: "# obtained"),
                 keyboardType: TextInputType.number,
                 inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.digitsOnly
                 ],
               ),

               //num needed
               TextField(
                 // controller: controller,
                 onChanged: (text) { numNeeded = text as int; },
                 decoration: const InputDecoration(labelText: "# needed"),
                 keyboardType: TextInputType.number,
                 inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.digitsOnly
                 ],
               )

             ],
        )
      )
    );
  }
}