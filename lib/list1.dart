import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class List1 extends StatefulWidget {
  const List1({Key? key}) : super(key: key);

  @override
  State<List1> createState() => _List1State();
}

class _List1State extends State<List1> {
  final user = FirebaseAuth.instance.currentUser;
  var collection = FirebaseFirestore.instance.collection('names');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: collection.doc(user!.uid).get(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          final Map<String, dynamic>? data = snapshot.data!.data();
          final user = Users.fromJson(data ?? {});
          return Column(
            children: [
              Text(user.mail),
              Text(user.age.toString()),
              Text(user.gender)
            ],
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
