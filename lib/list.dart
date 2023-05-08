import 'package:flutter/material.dart';

class list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List'),
        ),
        body: const Center(
          child: Text('Hello List'),
        ),
      ),
    );
  }
}
