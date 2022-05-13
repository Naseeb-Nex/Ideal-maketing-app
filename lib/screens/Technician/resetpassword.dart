import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:ideal_marketing/components/alertbox.dart';

class Resetpswdsrc extends StatefulWidget {
  String? uid;
  Resetpswdsrc({Key? key, this.uid}) : super(key: key);

  @override
  _ResetpswdsrcState createState() => _ResetpswdsrcState();
}

class _ResetpswdsrcState extends State<Resetpswdsrc> {
  final formkey = GlobalKey<FormState>();

  User? user = FirebaseAuth.instance.currentUser;

  final newpswrd = TextEditingController();
  final confrimpswrd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(38, 0, 91, 1),
                Color.fromRGBO(55, 48, 255, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: s.height * 0.5,
                width: s.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Change Password",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: bluebg),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Enter new password twice and verify it",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black26),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "New Password :",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: s.width * 0.55,
                              child: TextFormField(
                                autofocus: false,
                                controller: newpswrd,
                                obscureText: true,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  RegExp regex = RegExp(r'^.{6,}$');
                                  if (value!.isEmpty) {
                                    return ("Enter a password");
                                  }
                                  if (!regex.hasMatch(value)) {
                                    return ("Enter a valid password");
                                  }
                                },
                                onSaved: (value) => newpswrd.text = value!,
                                cursorColor: bluebg,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    focusColor: bluebg,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: bluebg, width: 2.0),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        30, 5, 10, 5)),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            const Text(
                              "Confirm Password :",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: s.width * 0.5,
                              child: TextFormField(
                                autofocus: false,
                                controller: confrimpswrd,
                                obscureText: true,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == newpswrd.text) {
                                    return null;
                                  } else {
                                    return "Do not match";
                                  }
                                },
                                onSaved: (value) => newpswrd.text = value!,
                                cursorColor: bluebg,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    focusColor: bluebg,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: bluebg, width: 2.0),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        30, 5, 10, 5)),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () => updatepswrd(),
                        child: Container(
                          height: s.height * 0.05,
                          width: s.width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: bluebg,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(0, 5))
                              ]),
                          child: const Center(
                            child: Text(
                              "Update Password",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: white),
                            ),
                          ),
                        ),
                      ),
                      Text("${widget.uid}\n ${newpswrd.text}\n $user"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void updatepswrd() async {
    FirebaseFirestore fb = FirebaseFirestore.instance;
    if (formkey.currentState!.validate()) {
      // user?.updatePassword(newpswrd.text).then((value) {
      //   fb
      //       .collection("users")
      //       .doc(widget.uid)
      //       .set({'password': newpswrd.text}, SetOptions(merge: true))
      //       .then((value) => print("Succesfully updated"))
      //       .catchError((onError) {
      //         print("Error in updating password in user colleciton");
      //       });
      // }).catchError((onError) {
      //   print("The password is not updated");
      // });

      try{await user?.updatePassword(newpswrd.text);}
      catch(error){print(error);}
    }
  }
}
