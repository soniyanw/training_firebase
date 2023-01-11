import 'package:firebase/list1.dart';
import 'package:firebase/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    Future signin() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailcontroller.text.trim(),
            password: passwordcontroller.text.trim());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const List1()),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }

    @override
    void dispose() {
      emailcontroller.dispose();
      passwordcontroller.dispose();
      super.dispose();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailcontroller,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextField(
                controller: passwordcontroller,
                obscureText: true,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
              MaterialButton(
                color: Colors.grey,
                onPressed: () {
                  signin();
                },
                child: Text("SIGN IN"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
                  child: Text("Sign up"))
            ],
          ),
        ),
      ),
    );
  }
}
