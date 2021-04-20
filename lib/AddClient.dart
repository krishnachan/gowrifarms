import 'package:flutter/material.dart';
import 'databasehelper.dart';
import 'package:gowrifarms/hompage.dart';

final Clientname = new TextEditingController();
final CPhoneno = new TextEditingController();
final CAddress = new TextEditingController();
String quantity = "";
String Dsession = "";

class AddClient extends StatefulWidget {
  @override
  _AddClientState createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Add Client",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 20,
                ),
                Client_name(),
                SizedBox(
                  height: 20,
                ),
                Client_phone_no(),
                SizedBox(
                  height: 20,
                ),
                Client_Address(),
                SizedBox(
                  height: 20,
                ),
                Quantity(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Deliverytime(),
                SizedBox(
                  height: 20,
                ),
                RawMaterialButton(
                  onPressed: () async {
                    addclient(Clientname.text, CPhoneno.text, CAddress.text,
                        quantity, Dsession);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => homepage()));
                  },
                  elevation: 2.0,
                  fillColor: Color(0xff47821C),
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 25),
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget Client_name() {
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
        controller: Clientname,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Client Name',
            hintStyle: TextStyle(
              fontSize: 20,
            ))),
  );
}

Widget Client_phone_no() {
  return Container(
    height: 53,
    width: 312,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: Color(0xff47821C), width: 2),
      color: Color(0xff7FAC97),
    ),
    child: TextField(
      keyboardType: TextInputType.number,
      controller: CPhoneno,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Phone no.',
          hintStyle: TextStyle(
            fontSize: 20,
          )),
    ),
  );
}

Widget Client_Address() {
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
      controller: CAddress,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Address',
          hintStyle: TextStyle(
            fontSize: 20,
          )),
    ),
  );
}

Widget Quantity() {
  return Container(
      height: 53,
      width: 312,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Color(0xff47821C), width: 2),
        color: Color(0xff7FAC97),
      ),
      child: DropdownButton<String>(
        hint: Text(
          'Select Quantity',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        isExpanded: true,
        items: <String>['500ml', '1L', '1.5L', '2L'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          quantity = value;
          print(quantity);
        },
      ));
}

Widget Deliverytime() {
  return Container(
      height: 53,
      width: 312,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Color(0xff47821C), width: 2),
        color: Color(0xff7FAC97),
      ),
      child: DropdownButton<String>(
        hint: Text(
          'Select Timing',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        isExpanded: true,
        items: <String>['Morning', 'Evening'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          Dsession = value;
        },
      ));
}
