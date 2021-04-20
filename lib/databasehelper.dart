import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gowrifarms/AddClient.dart';
import 'package:intl/intl.dart';

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('yyyy-MM-dd');
final String formatted = formatter.format(now);
final DateFormat formatter1 = DateFormat('yyyy-MM');
final String reqBill = formatter1.format(now);

CollectionReference usertable =
    FirebaseFirestore.instance.collection('usertable');
Future<void> adduser(String username, String password) {
  return usertable
      .add({
        'username': username, // John Doe
        'password': password, // Stokes and Sons
        // 42
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<bool> Check(String username, String password) async {
  final result = await FirebaseFirestore.instance
      .collection('usertable')
      .where('username', isEqualTo: username)
      .where('password', isEqualTo: password)
      .get()
      .catchError((error) => print("failed: $error"));
  return result.docs.isEmpty;
}

CollectionReference clienttable =
    FirebaseFirestore.instance.collection('clienttable');
Future<void> addclient(String clientname, String Phoneno, String Address,
    String Quantity, String DeliveryT) {
  clienttable
      .add({
        'Client Name': clientname,
        'Phone No': Phoneno,
        'Address': Address,
        'Quantity': Quantity,
        'Date': formatted,
        'Delivery Time': DeliveryT
      })
      .then(
        (value) => Center(child: Text("User Added")),
      )
      .catchError(
        (error) => Center(child: Text("Failed to add user: $error")),
      );
}

Future<void> putattendance(
    String phoneno, String Quantity, String ClientNaame) {
  int L = 0;
  if (Quantity == "1L") {
    FirebaseFirestore.instance
        .collection('pricelist')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print("h");
        print(doc["1L"]);
        L = doc['1L'];
        CollectionReference attendance =
            FirebaseFirestore.instance.collection('Attendance');
        attendance
            .add({
              'Client Name': ClientNaame,
              'Phone No': phoneno, // John Doe
              'Quantity': Quantity,
              'Date': formatted,
              'Attend': 'yes',
              'price': L,
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      });
    });
  } else if (Quantity == "500ml") {
    FirebaseFirestore.instance
        .collection('pricelist')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print("h");
        print(doc["500ml"]);
        L = doc['500ml'];
        print("L= $L");
        CollectionReference attendance =
            FirebaseFirestore.instance.collection('Attendance');
        attendance
            .add({
              'Client Name': ClientNaame,
              'Phone No': phoneno, // John Doe
              'Quantity': Quantity,
              'Date': formatted,
              'Attend': 'yes',
              'price': L,
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      });
    });
  } else if (Quantity == "2L") {
    FirebaseFirestore.instance
        .collection('pricelist')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print("h");
        print(doc["2L"]);
        L = doc['2L'];
        print("L= $L");
        CollectionReference attendance =
            FirebaseFirestore.instance.collection('Attendance');
        attendance
            .add({
              'Client Name': ClientNaame,
              'Phone No': phoneno, // John Doe
              'Quantity': Quantity,
              'Date': formatted,
              'Attend': 'yes',
              'price': L,
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      });
    });
  } else if (Quantity == "1.5L") {
    FirebaseFirestore.instance
        .collection('pricelist')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print("h");
        print(doc["1.5L"]);
        L = doc['1.5L'];
        print("L= $L");
        CollectionReference attendance =
            FirebaseFirestore.instance.collection('Attendance');
        attendance
            .add({
              'Client Name': ClientNaame,
              'Phone No': phoneno, // John Doe
              'Quantity': Quantity,
              'Date': formatted,
              'Attend': 'yes',
              'price': L,
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      });
    });
  }
}

Future<void> absent(String phoneno, String Quantity, String ClientNaame) {
  CollectionReference attendance =
      FirebaseFirestore.instance.collection('Attendance');
  attendance
      .add({
        'Client Name': ClientNaame,
        'Phone No': phoneno, // John Doe
        'Quantity': Quantity,
        'Date': formatted,
        'Attend': 'No'
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

//   class getdata extends StatelessWidget {
//   String documentId = "tjNDwJbNTzy0Zb9lWqOv";
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users =
//         FirebaseFirestore.instance.collection('usertable');
//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data.data();
//           return Text("data ${data['username']} ${data['password']}");
//         }

//         return Text("loading");
//       },
//     );
//   }
// }
