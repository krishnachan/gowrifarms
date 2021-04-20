import 'package:flutter/material.dart';
import 'ViewClient.dart';
import 'Bill.dart';
import 'Attendance.dart';
import 'AddClient.dart';

int i = 0;

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/home.png"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: i,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.article_outlined,
                color: Colors.black,
              ),
              title: Text(''),
              backgroundColor: Color(0xff95C0AC)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.black,
              ),
              title: Text(''),
              backgroundColor: Color(0xff95C0AC)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.people_outline_sharp,
                color: Colors.black,
              ),
              title: Text(''),
              backgroundColor: Color(0xff95C0AC)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money,
                color: Colors.black,
              ),
              title: Text(''),
              backgroundColor: Color(0xff95C0AC)),
        ],
        onTap: (index) {
          setState(() {
            i = index;
          });
          if (i == 1) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddClient()));
          } else if (i == 2) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ViewClient()));
          } else if (i == 3) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Bill()));
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Attendance()));
          }
        },
      ),
    );
  }
}
