import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/list1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Add() {
    //To add new names to the firebase
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("names")
        .doc(); //creating document and collection
    Map<String, String> name = {"input": input}; //field input ,value entered
    documentReference.set(name).whenComplete(() => print("$input created"));
  }

  late String input;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FIREBASE"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                onChanged: (String value) {
                  input = value;
                },
              ),
            ),
            MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Add(); //adding input into firebase as "input"
                  setState(() {});
                },
                child: Text(
                  "ADD",
                  style: TextStyle(color: Colors.white),
                )),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => List1()),
                );
              },
              child: Text(
                "SHOW LIST",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )),
      ),
    );
  }
}
