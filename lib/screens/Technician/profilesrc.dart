import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/constants/profile.dart';

import 'package:ideal_marketing/screens/Technician/edittechprofile.dart';
import 'package:ideal_marketing/screens/Technician/resetpassword.dart';

import '../loginsrc.dart';
import 'package:intl/intl.dart';

class Profilesrc extends StatefulWidget {
  String? uid;
  String? name;
  String? img;
  String? username;
  Profilesrc({Key? key, required this.uid, this.name, this.img, this.username})
      : super(key: key);

  @override
  _ProfilesrcState createState() => _ProfilesrcState();
}

class _ProfilesrcState extends State<Profilesrc> {

  FirebaseFirestore fb = FirebaseFirestore.instance;
  int a = 0;
  int c = 0;
  int p = 0;
  int pro = 0;

  Profile profile = Profile();
  @override
  void initState() {
    super.initState();
    if (mounted) startup();
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
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            IconButton(
                              alignment: Alignment.centerLeft,
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "My Profile",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => logout(context),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 8),
                            child: const Text(
                              "Log out",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/icons/avataricon.png")),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${widget.name}",
                    style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: s.height * 0.5,
                    width: s.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'My Activity',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 27,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: s.width * 0.4,
                                height: s.height * 0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: const Color(0XFFDBF4F1),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          color: Colors.black.withOpacity(0.1),
                                          offset: const Offset(0, 5))
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Completed Program",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "$c",
                                      style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: s.width * 0.4,
                                height: s.height * 0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: const Color(0XFFFED4D6),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          color: Colors.black.withOpacity(0.1),
                                          offset: const Offset(0, 5))
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Pending Program",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "$p",
                                      style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: s.width * 0.45,
                            height: s.height * 0.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0XFFC8D7FE),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, 5))
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Processing Program",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "$pro",
                                  style: const TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditTechprofile(name : widget.name, uid: widget.uid, username: widget.username,des: profile.designation, loc: profile.location, phn1: profile.phn1, phn2: profile.phn2))),
                            child: Container(
                              height: s.height * 0.04,
                              width: s.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, 5))
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Edit profile",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue[400],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Resetpswdsrc(uid: widget.uid,username: widget.username))),
                            child: Container(
                              height: s.height * 0.04,
                              width: s.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, 5))
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Change Password",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red[400],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  
  startup() async {
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
    try {

      FirebaseFirestore.instance
          .collection("Technician")
          .doc(widget.username)
          .get()
          .then((value) {
        profile = Profile.fromMap(value.data());
      });


      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Assignedpgm")
          .get()
          .then((snap) => {
                setState(() {
                  a = snap.size;
                })
              });

      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Completedpgm")
          .doc("Day")
          .collection(cday)
          .get()
          .then((snap) => {
                setState(() {
                  c = snap.size;
                })
              });
      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Pendingpgm")
          .get()
          .then((snap) => {
                setState(() {
                  p = snap.size;
                })
              });

      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Processingpgm")
          .get()
          .then((snap) => {
                setState(() {
                  pro = snap.size;
                })
              });


    } catch (e) {
      print(e);
    }
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginSrc()));
  }
}
