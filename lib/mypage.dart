import 'package:flutter/material.dart';

class myPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MyPage'),
        ),
        body: const Center(
          child: Text('Hello MyPage'),
        ),
      ),
    );
  }
}
