import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'databasehelper.dart';

class history extends StatelessWidget {
  String id;
  history({@required this.id});
  @override
  Widget build(BuildContext context) {
    final Query users = FirebaseFirestore.instance
        .collection('Attendance')
        .where('Phone No', isEqualTo: id);

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/background.png"),
            ),
          ),
          child: ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return DataTable(columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Quantity')),
                DataColumn(label: Text('Attendance'))
              ], rows: [
                DataRow(cells: [
                  DataCell(Text("${document.data()['Client Name']}")),
                  DataCell(Text("${document.data()['Date']}")),
                  DataCell(Text("${document.data()['Quantity']}")),
                  DataCell(Text("${document.data()['Attend']}")),
                ])
              ]);
            }).toList(),
          ),
        );
      },
    );
  }
}
