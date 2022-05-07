import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:ideal_marketing/screens/loginsrc.dart';
import 'package:ideal_marketing/screens/register.dart';
import 'package:ideal_marketing/services/user_model.dart';
import 'pendingsrc.dart';
import 'package:intl/intl.dart';

import 'package:ideal_marketing/screens/Admin/techprofile.dart';
import 'package:ideal_marketing/screens/Admin/techstatus.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  FirebaseFirestore fb = FirebaseFirestore.instance;
  int p = 0, c = 0;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      pgmsetup();
    }
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Stack(fit: StackFit.expand, children: [
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(38, 0, 91, 1),
              Color.fromRGBO(55, 48, 255, 1),
            ],
            begin: FractionalOffset.center,
            end: FractionalOffset.topCenter,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: s.width,
                height: s.height * 1 / 7,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                                child: Image.asset(
                              "assets/icons/menu.png",
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ))),
                        const Text(
                          "Home",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () => logout(context),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Admin Panel",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: newbg,
                  ),
                  child: Center(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Program Status",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Pendingsrc())),
                                child: Container(
                                  width: s.width * 0.4,
                                  height: s.height * 0.14,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color(0XFFFED4D6),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            offset: const Offset(0, 5))
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "$p",
                                          style: const TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: s.width * 0.4,
                                height: s.height * 0.14,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: const Color(0XFFDBF4F1),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          color: Colors.black.withOpacity(0.2),
                                          offset: const Offset(0,5))
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "$c",
                                        style: const TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Technician Status",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: s.height * 0.3,
                          child: Techcardspace(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20),
                        //   child: Text(
                        //     "Staff Registration",
                        //     style: TextStyle(
                        //       fontFamily: "Nunito",
                        //       fontSize: 22,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: s.width * 0.2),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistrationScreen()));
                            },
                            child: Container(
                              height: s.height * 0.1,
                              width: s.width * 0.4,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: bluebg,
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                      color: bluebg.withOpacity(0.2),
                                      offset: const Offset(0, 5),
                                    )
                                  ]),
                              child: const Center(
                                child: Text(
                                  "Staff Registration",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }

  pgmsetup() async {
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
    try {
      await fb
          .collection('Completedpgm')
          .doc("Day")
          .collection(cday)
          .get()
          .then((snap) => {
                setState(() {
                  this.c = snap.size;
                })
              });
      await fb.collection('Programs').get().then((snap) => {
            setState(() {
              this.p = snap.size;
            })
          });
      print(c);
      print(p);
    } catch (e) {
      print(e);
    }
  }

  // #DBF4F1 green #EEFCEF  #E6F5FA
  // #FFF5DA orange
  // #FED4D6 pink  #FFEFE2

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginSrc()));
  }
}

class Techcardspace extends StatelessWidget {
  String? userid;
  Techcardspace({Key? key, this.userid}) : super(key: key);
  Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('Technician').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {}
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: cheryred,
              ),
            );
          }

          final List techprofile = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            techprofile.add(a);
            // a['uid'] = document.id;
          }).toList();
          print("${techprofile}");
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: techprofile.length,
            itemBuilder: (context, i) {
              return Techcard(
                name: techprofile[i]['name'],
                img: techprofile[i]['pic'],
                username: techprofile[i]['username'],
                uid: techprofile[i]['uid'],
              );
            },
          );
        });
  }
}

class Techcard extends StatefulWidget {
  String? name;
  String? img;
  String? uid;
  String? username;
  Techcard({Key? key, this.name, this.img, this.uid, this.username})
      : super(key: key);

  @override
  _TechcardState createState() => _TechcardState();
}

class _TechcardState extends State<Techcard> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  int a = 0;
  int c = 0;
  int p = 0;
  int pro = 0;
  @override
  void initState() {
    super.initState();
    if (mounted) startup();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Techstatus(
              name: widget.name,
              img: widget.img,
              username: widget.username,
              uid: widget.uid,
            ),
          )),
      child: Card(
        color: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        shadowColor: primarybg,
        child: Container(
          width: s.width * 0.4,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Techprofilesrc(
                        name: widget.name,
                        img: widget.img,
                        username: widget.username,
                        uid: widget.uid,
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      backgroundColor: bluebg,
                      backgroundImage:
                          AssetImage("assets/icons/avataricon.png"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FittedBox(
                  child: Text(
                    "${widget.name}",
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.yellow),
                      ),
                      const AutoSizeText(
                        " Assingned",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff273746),
                        ),
                        minFontSize: 10,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Text(
                    "$a",
                    style:const  TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.greenAccent),
                      ),
                      const AutoSizeText(
                        " Completed",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff273746),
                        ),
                        minFontSize: 10,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Text(
                    "$c",
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: cheryred),
                      ),
                      AutoSizeText(
                        " Pending",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff273746),
                        ),
                        minFontSize: 10,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Text(
                    "$p",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue),
                      ),
                      AutoSizeText(
                        " Processing",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff273746),
                        ),
                        minFontSize: 10,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Text(
                    "$pro",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff273746),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  startup() async {
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
    try {
      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Assignedpgm")
          .get()
          .then((snap) => {
                setState(() {
                  this.a = snap.size;
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
                  this.c = snap.size;
                })
              });
      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Pendingpgm")
          .get()
          .then((snap) => {
                setState(() {
                  this.p = snap.size;
                })
              });

      await fb
          .collection('Technician')
          .doc(widget.username)
          .collection("Processingpgm")
          .get()
          .then((snap) => {
                setState(() {
                  this.pro = snap.size;
                })
              });
      print(a);
      print(c);
      print(p);
      print(pro);
    } catch (e) {
      print(e);
    }
  }
}
