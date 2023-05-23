import 'package:bihere/DataTableView.dart';
import 'package:flutter/material.dart';
import 'package:bihere/DataTableView.dart';

class list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'mainPage',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('List'),
            ),
            body: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('운영체제'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DataList(1)));
                  },
                  trailing: Icon(Icons.add),
                ),
                ListTile(
                  title: Text('통신시스템'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DataList(1)));
                  },
                  trailing: Icon(Icons.add),
                ),
                ListTile(
                  title: Text('데이터마이닝'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DataList(1)));
                  },
                  trailing: Icon(Icons.add),
                ),
                ListTile(
                  title: Text('공학경제'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DataList(1)));
                  },
                  trailing: Icon(Icons.add),
                ),
              ],
            )));
  }
}
