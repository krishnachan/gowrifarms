import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'History.dart';
import 'amount.dart';

String Phoneno = "";

class Bill extends StatefulWidget {
  Bill({Key key}) : super(key: key);

  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
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
          child: bill(),
        ),
      ),
    );
  }
}

class bill extends StatefulWidget {
  @override
  _billState createState() => _billState();
}

class _billState extends State<bill> {
  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 3.0, color: Color(0xff7FAC97)),
                ),
                height: MediaQuery.of(context).size.height / 4.5,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                            child: Text("Bill"),
                            color: Color(0xff47821C),
                            onPressed: () {
                              setState(() {
                                Phoneno = document.data()['Phone No'];
                              });
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => amount(id: Phoneno)));
                            }),
                        RaisedButton(
                          child: Text("View"),
                          color: Color(0xff47821C),
                          onPressed: () {
                            setState(() {
                              Phoneno = document.data()['Phone No'];
                            });
                            print(Phoneno);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => history(id: Phoneno)),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ));
          }).toList(),
        );
      },
    );
  }
}
