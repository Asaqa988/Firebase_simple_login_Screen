import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Center(
          child: Text("Welcome to our app"),
        ),
        Divider(
          height: 25,
        ),
        Text("email"),
        TextField(controller: email),
        Text("password"),
        TextField(controller: password),
        Divider(height: 25),
        TextButton(
            onPressed: () async {
              try {
                var authenticationobject = FirebaseAuth.instance;

                UserCredential myUser =
                    await authenticationobject.createUserWithEmailAndPassword(
                        email: email.text, password: password.text);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("added successfully")));
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("sorry there is an error")));
              }
            },
            child: Text("sign up "))
      ]),
    );
  }
}
