import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/list1.dart';
import 'package:firebase/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final user = FirebaseAuth.instance.currentUser;
  late String gender;
  late int age;
  Add() async {
    //To add new names to the firebase
    /*DocumentReference documentReference =
        FirebaseFirestore.instance.collection("names").doc(user!.uid);
    await documentReference.set({
      "age": age,
      "gender": gender,
      "mail": user!.email,
    });*/
    DocumentReference<Map<String, dynamic>> users =
        FirebaseFirestore.instance.collection('names').doc(user!.uid);
    Users newUser = Users((b) => b
      ..gender = gender
      ..age = age
      ..mail = user!.email);
    users.set(newUser.toJson());

    //.then((value) => print("User with CustomID added"))
    //  .catchError((error) => print("Failed to add user: $error"));
    /*Map<String, String> name = {"gender": gender};
    documentReference.set(name).whenComplete(() => print("$gender created"));
    Map<String, int> ageval = {"age": age};
    documentReference.set(ageval).whenComplete(() => print("$age added"));
    Map<String, String> mail = {"mail": user!.email ?? ' '};
    documentReference.set(mail).whenComplete(() => print("$mail added"));*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Age"),
                onChanged: (value) {
                  age = int.parse(value);
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Gender"),
                onChanged: (val) {
                  gender = val;
                },
              ),
              MaterialButton(
                onPressed: () {
                  Add();
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const List1()),
                  );
                },
                child: Text("Update"),
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
