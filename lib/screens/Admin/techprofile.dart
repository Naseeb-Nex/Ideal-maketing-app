import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:ideal_marketing/constants/profile.dart';

class Techprofilesrc extends StatefulWidget {
  String? name;
  String? img;
  String? uid;
  String? username;
  Techprofilesrc({Key? key, this.name, this.img, this.uid, this.username})
      : super(key: key);

  @override
  _TechprofilesrcState createState() => _TechprofilesrcState();
}

class _TechprofilesrcState extends State<Techprofilesrc> {
  int c = 0;
  int p = 0;
  int pro = 0;

  Profile profile = Profile();

  FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      setupsrc();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bluebg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: s.width,
                height: s.height * 0.06,
                color: white,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: bluebg,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Container(
                height: s.height * 0.25,
                width: s.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: s.height * 0.13,
                      height: s.height * 0.13,
                      child: const CircleAvatar(
                        backgroundColor: bluebg,
                        backgroundImage:
                            AssetImage("assets/icons/avataricon.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${widget.name}",
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "#Technician",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xffdddde3),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Monthly",
                    style: TextStyle(
                        fontFamily: "Montserrat", color: white, fontSize: 17)),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          "$c",
                          style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: white),
                        ),
                        const Text(
                          "Completed",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              color: white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "$p",
                          style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: white),
                        ),
                        const Text(
                          "Pending",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              color: white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "$pro",
                          style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: white),
                        ),
                        const Text(
                          "Processing",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              color: white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: s.width,
                height: s.height * 0.57,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: white),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: s.width * .1),
                      child: Row(children: [
                        const Text(
                          "Designation         :",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              color: Color(0xffadadad)),
                        ),
                        SizedBox(
                          width: s.width * 0.05,
                        ),
                        Text(
                          "${profile.designation}",
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: s.width * .1),
                      child: Row(children: [
                        const Text(
                          "Home Location   :",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              color: Color(0xffadadad)),
                        ),
                        SizedBox(
                          width: s.width * 0.05,
                        ),
                        Flexible(
                          child: Text(
                            "${profile.location}",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: s.width * .1),
                      child: Row(children: [
                        const Text(
                          "Phone Number1 :",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              color: Color(0xffadadad)),
                        ),
                        SizedBox(
                          width: s.width * 0.05,
                        ),
                        SelectableText(
                          "${profile.phn1}",
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: s.width * .1),
                      child: Row(children: [
                        const Text(
                          "Phone Number2 :",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              color: Color(0xffadadad)),
                        ),
                        SizedBox(
                          width: s.width * 0.05,
                        ),
                        SelectableText(
                          "${profile.phn2}",
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: s.width * 0.4,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10,
                            color: secondbg.withOpacity(0.20),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Status",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            // color: white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: s.width * 0.4,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bluebg,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10,
                            color: secondbg.withOpacity(0.20),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: s.width * 0.5,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.redAccent,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10,
                            color: secondbg.withOpacity(0.20),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Remove Technitian",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setupsrc() async {
    DateTime now = DateTime.now();
    String mnth = DateFormat('MM y').format(now);
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
          .collection("Completedpgm")
          .doc("Day")
          .collection(mnth)
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
}
