import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hola")),
      body: Image.network(
        "https://i0.wp.com/unaaldia.hispasec.com/wp-content/uploads/2014/10/f94e0-android-logo.png?ssl=1",
      ),
    );
  }
}
