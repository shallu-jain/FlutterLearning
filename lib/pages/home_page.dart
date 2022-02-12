import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int age = 20;
  final String name = "Shallu";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text("Catalog App")),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome To $name Android,age $age"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
