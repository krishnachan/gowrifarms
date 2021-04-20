import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gowrifarms/databasehelper.dart';
import 'package:gowrifarms/hompage.dart';
import 'package:fluttertoast/fluttertoast.dart';

final username = TextEditingController();
final password = TextEditingController();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var devheight = MediaQuery.of(context).size.height;
    var devwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: devheight,
        width: devwidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/background.png"),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: 150,
                  icon: Image.asset('images/gowri.png'),
                  onPressed: () {}),
              UserIDinput(),
              SizedBox(
                height: 40,
              ),
              Passwordinput(),
              SizedBox(
                height: 40,
              ),
              IconButton(
                iconSize: 75,
                icon: Image.asset('images/loginbutton.png'),
                onPressed: () async {
                  final valid = await Check(username.text, password.text);
                  if (!valid) {
                    Fluttertoast.showToast(
                        msg: "Welcome", toastLength: Toast.LENGTH_SHORT);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => homepage()));
                  } else {
                    // save the username or something
                    Fluttertoast.showToast(
                        msg: "Incorrect Username and Password",
                        toastLength: Toast.LENGTH_SHORT);
                  }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}

Widget UserIDinput() {
  return Container(
    height: 53,
    width: 312,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: Color(0xff47821C), width: 2),
      color: Color(0xff7FAC97),
    ),
    child: TextField(
      keyboardType: TextInputType.text,
      controller: username,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Username',
          labelStyle: TextStyle(
            fontSize: 24,
          )),
    ),
  );
}

Widget Passwordinput() {
  return Container(
    height: 53,
    width: 312,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: Color(0xff47821C), width: 2),
      color: Color(0xff7FAC97),
    ),
    child: TextField(
      obscureText: true,
      controller: password,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Password',
          labelStyle: TextStyle(
            fontSize: 24,
          )),
    ),
  );
}

// RaisedButton(
//                 onPressed: () async {
//                   final valid = await Check(username.text, password.text);
//                   if (!valid) {
//                     // username exists
//                   } else {
//                     // save the username or something
//                     print("nope");
//                   }
//                 },
//                 child: Text('check'),
//               ),
