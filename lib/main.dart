import 'package:flutter/material.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Center(
          child: Text(
            "Lebar layar HP $screen",
            style: TextStyle(
                fontSize: (orientation == Orientation.landscape) ? 50 : 20,
                color: (screen < 380) ? Colors.black : Colors.blue),
          ),
        )),
      ),
    );
  }
}
