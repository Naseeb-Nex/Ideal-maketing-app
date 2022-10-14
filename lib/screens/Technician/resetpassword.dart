import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:ideal_marketing/components/simplealertbox.dart';

class Resetpswdsrc extends StatefulWidget {
  String? uid;
  String? username;
  Resetpswdsrc({Key? key, this.uid, this.username}) : super(key: key);

  @override
  _ResetpswdsrcState createState() => _ResetpswdsrcState();
}

class _ResetpswdsrcState extends State<Resetpswdsrc> {
  final formkey = GlobalKey<FormState>();

  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore fb = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String newp = "";
  String emailid = "test@gmail.com";
  String oldcheck = "";

  bool _loading = false;

  final oldpswrd = TextEditingController();
  final newpswrd = TextEditingController();
  final confrimpswrd = TextEditingController();
  void initState() {
    super.initState();
  }

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
                  child: Stack(
                    children: [
                      Center(
                          child: _loading
                              ? const CircularProgressIndicator(
                                  color: bluebg,
                                )
                              : null),
                      Column(
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SizedBox(
                                  width: s.width * 0.3,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: const Text(
                                      "Old Password :",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: s.width * 0.55,
                                child: TextFormField(
                                  autofocus: true,
                                  controller: oldpswrd,
                                  obscureText: true,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return ("Password feild cannot be empty");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Enter a valid password");
                                    }
                                  },
                                  onSaved: (value) => oldpswrd.text = value!,
                                  cursorColor: bluebg,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      focusColor: bluebg,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: bluebg, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          30, 5, 10, 5)),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SizedBox(
                                  width: s.width * 0.33,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: const Text(
                                      "New Password :",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          30, 5, 10, 5)),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SizedBox(
                                  width: s.width * 0.38,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: const Text(
                                      "Confirm Password :",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          30, 5, 10, 5)),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () => updatepswrd(context),
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
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Update Password",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Text("${widget.uid}\n ${newpswrd.text}\n $user"),
                        ],
                      ),
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

  changepswrd(BuildContext context) async {
    try {
      await user?.updatePassword(newp);
      fb
          .collection("users")
          .doc(widget.uid)
          .set({'password': newpswrd.text}, SetOptions(merge: true))
          .then((value) => showDialog(
              context: context,
              builder: (BuildContext context) {
                return Simplealert(
                  colorr: bluebg,
                  titles: "Password Successfully updated",
                  done: "Password Updated",
                  username: widget.username,
                );
              }))
          .catchError((onError) {
            setState(() {
              _loading = false;
            });
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Simplealert(
                    colorr: cheryred,
                    titles: "Something went wrong",
                    done: "Oops! something went wrong, Please try agian",
                    username: widget.username,
                  );
                });
          });
    } catch (error) {
      Fluttertoast.showToast(msg: "Something Wrong try agin");
    }
  }

  Future<void> updatepswrd(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });
      await _auth
          .signInWithEmailAndPassword(
              email: "${user!.email}", password: oldpswrd.text)
          .then((value) {
        setState(() {
          newp = newpswrd.text;
          oldcheck = "";
        });
        changepswrd(context);
      }).catchError((onError) {
        setState(() {
          oldcheck = "incorrect";
          _loading = false;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Incorrectalert(
                colorr: Colors.redAccent,
                titles: "Try agian",
                done: "Invalid password",
                username: widget.username,
              );
            });
      });
    }
  }
}

class Incorrectalert extends StatelessWidget {
  String? username;
  final String? titles;
  final Color colorr;
  final String? done;
  Incorrectalert(
      {Key? key, this.titles, required this.colorr, this.done, this.username})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        height: 200,
        width: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: colorr,
                  size: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  done!,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: colorr,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              titles!,
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: colorr,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorr,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 3))
                    ]),
                child: const Text(
                  "Okay",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
