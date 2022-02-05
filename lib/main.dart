import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fast Api Pracice",
      home: Scaffold(
        body: Text("This is body"),
      ),
    );
  }
}
