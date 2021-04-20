import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:telephony/telephony.dart';

final Telephony telephony = Telephony.instance;

class amount extends StatelessWidget {
  String id;
  amount({@required this.id});

  @override
  Widget build(BuildContext context) {
    final Query users = FirebaseFirestore.instance
        .collection('Attendance')
        .where('Phone No', isEqualTo: id)
        .where('Attend', isEqualTo: 'yes');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading  $id");
        }
        var ds = snapshot.data.docs;
        double sum = 0.0;
        double lt = 0.0;
        String client = ds[0]['Client Name'];
        for (int i = 0; i < ds.length; i++) {
          sum += (ds[i]['price']).toDouble();
          print('$sum');
        }
        if (ds[0]['Quantity'] == "1L") {
          for (int i = 0; i < ds.length; i++) {
            lt = lt + 1.0;
          }
        } else if (ds[0]['Quantity'] == "500ml") {
          for (int i = 0; i < ds.length; i++) {
            lt = lt + 1.0;
          }
          lt = lt / 2.0;
        } else if (ds[0]['Quantity'] == "1.5L") {
          for (int i = 0; i < ds.length; i++) {
            lt = lt + 1.0;
          }
          lt = lt * 1.5;
        } else if (ds[0]['Quantity'] == "2L") {
          for (int i = 0; i < ds.length; i++) {
            lt = lt + 1.0;
          }
          lt = lt * 2.0;
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
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Text(
                'The bill is $sum',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                color: Color(0xff47821C),
                child: Text('Send Bill'),
                onPressed: () {
                  sendsms(id, sum, lt, client);
                },
              )
            ],
          ),
        );
      },
    );
  }
}

void sendsms(String phno, double sum, double lt, String client) {
  telephony.sendSms(
      to: "${phno}",
      message:
          "From Gowrifarms ${client} your bill amount is ${sum} you have bought ${lt} L");
}
