import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewClient extends StatefulWidget {
  @override
  _ViewClientState createState() => _ViewClientState();
}

class _ViewClientState extends State<ViewClient> {
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
          child: clientinfo(),
        ),
      ),
    );
  }
}

class clientinfo extends StatefulWidget {
  @override
  _clientinfoState createState() => _clientinfoState();
}

class _clientinfoState extends State<clientinfo> {
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
                    border: Border.all(color: Color(0xff7FAC97), width: 2.0)),
                height: MediaQuery.of(context).size.height / 4,
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
                          "Address",
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "${document.data()['Address']}",
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
                        )
                      ],
                    ),
                    // RaisedButton(
                    //   child: Text("View"),
                    //   color: Color(0xff47821C),
                    //   onPressed: () {},
                    // )
                  ],
                ));
          }).toList(),
        );
      },
    );
  }
}
