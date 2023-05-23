import 'package:bihere/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String id = "";
String name = "";

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  const LogIn({Key? key}) : super(key: key);
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController IDcontroller = TextEditingController();
  TextEditingController PWcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // email, password 입력하는 부분을 제외한 화면을 탭하면, 키보드 사라지게 GestureDetector 사용
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Center(
                child: Image(
                  image: AssetImage('assets/images/DCHECK_logo_gif.gif'),
                  width: 300.0,
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
                          TextField(
                            controller: IDcontroller,
                            autofocus: true,
                            decoration: InputDecoration(labelText: 'Enter ID'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: PWcontroller,
                            decoration:
                                InputDecoration(labelText: 'Enter password'),
                            keyboardType: TextInputType.text,
                            obscureText: true, // 비밀번호 안보이도록 하는 것
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          ButtonTheme(
                              minWidth: 200.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () => _login(),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 24, 20, 255)),
                              ))
                        ],
                      );
                    })),
              ))
            ],
          ),
        ),
      ),
    );
  }

  _login() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("user").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
          if (docSnapshot.data()['id'].toString() == IDcontroller.text &&
              docSnapshot.data()['pw'].toString() == PWcontroller.text) {
            id = docSnapshot.data()['id'].toString();
            name = docSnapshot.data()['name'].toString();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NextPage()));
          } else {
            showSnackBar(context, const Text('Check your info again'));
          }
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
}

void showSnackBar(BuildContext context, Text text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: Color.fromARGB(255, 112, 48, 48),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '_title',
      home: Main(),
    );
  }
}
