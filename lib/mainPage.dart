import 'package:flutter/material.dart';

class mainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MainPage'),
        ),
        body: const Center(
          child: Text('Hello MainPage'),
        ),
      ),
    );
  }
}
