import 'package:flutter/material.dart';
import 'package:bihere/login.dart';
import 'package:flutter/widgets.dart';

const activeColor = Color.fromARGB(255, 5, 63, 138);
const inactiveColor = Color.fromRGBO(237, 210, 170, 1.0);

class MainPage extends StatefulWidget {
  @override
  mainPage createState() => mainPage();
}

class mainPage extends State<MainPage> {
  Color buttonColor = inactiveColor;
  void updateColor() {
    if (buttonColor == inactiveColor) {
      buttonColor = activeColor;
    } else {
      buttonColor = inactiveColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50)),
            Center(
              child: Image(
                image: AssetImage('assets/images/DCHECK_logo_gif.gif'),
                width: 150.0,
              ),
            ),
            Form(
                child: Theme(
              data: ThemeData(
                  primaryColor: Colors.grey,
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle:
                          TextStyle(color: Colors.teal, fontSize: 15.0))),
              child: Container(
                  padding: EdgeInsets.all(40.0),
                  child: Builder(builder: (context) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 40.0,
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              updateColor();
                            });
                          },
                          elevation: 2.0,
                          fillColor: buttonColor,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 70.0,
                          ),
                          padding: EdgeInsets.all(100.0),
                          shape: CircleBorder(),
                        )
                      ],
                    );
                  })),
            ))
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              // 현재 계정 이미지 set
              backgroundImage: AssetImage('assets/images/developerIcon.png'),
              backgroundColor: Colors.white,
            ),
            accountName: Text(id),
            accountEmail: Text(name),
            onDetailsPressed: () {
              print('arrow is clicked');
            },
            decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0))),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.grey[850],
            ),
            title: Text('Home'),
            onTap: () {
              print('Home is clicked');
            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.grey[850],
            ),
            title: Text('Setting'),
            onTap: () {
              print('Setting is clicked');
            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer,
              color: Colors.grey[850],
            ),
            title: Text('Q&A'),
            onTap: () {
              print('Q&A is clicked');
            },
            trailing: Icon(Icons.add),
          ),
        ],
      )),
    );
  }
}
