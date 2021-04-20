import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'databasehelper.dart';

String phoneno = "";
String quantity = "";
String clientName = "";
final DateTime now = DateTime.now();
final DateFormat formatter1 = DateFormat('yyyy-MM');
final String reqBill = formatter1.format(now);

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
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
              image: AssetImage("images/background.png"),
            ),
          ),
          child: attendance(),
        ),
      ),
    );
  }
}

class attendance extends StatefulWidget {
  @override
  _attendanceState createState() => _attendanceState();
}

class _attendanceState extends State<attendance> {
  @override
  Widget build(BuildContext context) {
    // final Query clienttable = FirebaseFirestore.instance
    //     .collection('Attendance')
    //     .where('Attend', isNotEqualTo: "yes")
    //     .where('Attend', isEqualTo: "No");

    CollectionReference clienttable =
        FirebaseFirestore.instance.collection('clienttable');

    return StreamBuilder<QuerySnapshot>(
      stream: clienttable.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "${document.data()['Client Name']}",
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phone No",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "${document.data()['Phone No']}",
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quantity",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "${document.data()['Quantity']}",
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Time:",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "${document.data()['Delivery Time']}",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          child: Text("YES"),
                          color: Color(0xff47821C),
                          onPressed: () {
                            setState(() {
                              clientName = document.data()['Client Name'];
                              quantity = document.data()['Quantity'];
                              phoneno = document.data()['Phone No'];
                            });

                            putattendance(phoneno, quantity, clientName);
                          },
                        ),
                        RaisedButton(
                          child: Text("NO"),
                          color: Color(0xff47821C),
                          onPressed: () {
                            setState(() {
                              clientName = document.data()['Client Name'];
                              quantity = document.data()['Quantity'];
                              phoneno = document.data()['Phone No'];
                            });
                            absent(phoneno, quantity, clientName);
                          },
                        )
                      ],
                    )
                  ],
                ));
          }).toList(),
        );
      },
    );
  }
}
