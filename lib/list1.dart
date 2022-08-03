import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class List1 extends StatefulWidget {
  const List1({Key? key}) : super(key: key);

  @override
  State<List1> createState() => _List1State();
}

class _List1State extends State<List1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FIREBASE"),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection("names").snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                return ListView.builder(
                    itemCount: snapshots
                        .data!.docs.length, //no. of data fields in firebase
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      QueryDocumentSnapshot<Map<String, dynamic>>
                          documentSnapshot = snapshots.data!.docs[index];
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            title: Text(documentSnapshot.data()["input"] ??
                                ' '), //the data in firebase under input title
                          ),
                        ),
                      );
                    });
              } else {
                return Container(
                  color: Colors.pink,
                );
              }
            }));
  }
}
/*git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/soniyanw/training_firebase.git
git push -u origin main*/
