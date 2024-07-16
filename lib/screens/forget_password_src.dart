import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'homeWrapper.dart';

class ForgetPasswordSrc extends StatefulWidget {
  const ForgetPasswordSrc({Key? key}) : super(key: key);

  @override
  _ForgetPasswordSrcState createState() => _ForgetPasswordSrcState();
}

class _ForgetPasswordSrcState extends State<ForgetPasswordSrc> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  bool load = false;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final forgetPasswordButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            forgetPassowrd(emailController.text);
          },
          child: const Text(
            "Forget Password",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 35, color: redfg),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: load
                          ? const CircularProgressIndicator(
                              color: cheryred,
                            )
                          : null,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 100,
                          child: Image.asset(
                            "assets/icons/imaicon.png",
                            fit: BoxFit.contain,
                          )),
                      const SizedBox(height: 45),
                      emailField,
                      const SizedBox(height: 35),
                      forgetPasswordButton,
                      const SizedBox(height: 15),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // forget Password function
  void forgetPassowrd(String email) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        load = true;
      });
      try {
        await _auth.sendPasswordResetEmail(email: email).then((uid) => {
              Fluttertoast.showToast(msg: "Password reset email sent!"),
            });
        setState(() {
          load = false;
        });
      } on FirebaseAuthException catch (e) {
        setState(() {
          load = false;
        });
        if (e.code == 'user-not-found') {
          Fluttertoast.showToast(msg: "No user found for this email.");
        } else if (e.code == 'invalid-email') {
          Fluttertoast.showToast(msg: "Invalid email address.");
        } else {
          Fluttertoast.showToast(msg: e.message.toString());
        }
      }
    }
  }
}
