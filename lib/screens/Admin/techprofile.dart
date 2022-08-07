import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal_marketing/screens/Admin/editprofile.dart';
import 'package:ideal_marketing/screens/Admin/techstatus.dart';
import 'package:ideal_marketing/screens/loginsrc.dart';
import 'package:intl/intl.dart';

import 'package:ideal_marketing/constants/profile.dart';
import 'package:ideal_marketing/services/user_model.dart';
import 'package:ideal_marketing/services/getcounts.dart';

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
  int? c = 0;
  int? p = 0;
  int? pro = 0;

  Profile profile = Profile();
  
  // Getcount pdata = Getcount();
  // Getcount prodata = Getcount();
  UserModel removeuser = UserModel();

  FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  void initState() {
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
                      height: 50,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Techstatus(
                            name: widget.name,
                            img: widget.img,
                            username: widget.username,
                            uid: widget.uid,
                          ),
                        ),
                      ),
                      child: Container(
                        width: s.width * 0.4,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
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
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Editprofile(
                                    des: profile.designation,
                                    loc: profile.location,
                                    phn1: profile.phn1,
                                    phn2: profile.phn2,
                                    name: widget.name,
                                    uid: widget.uid,
                                    username: widget.username,
                                  ))),
                      child: Container(
                        width: s.width * 0.4,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bluebg,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 3,
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.20),
                              offset: const Offset(0, 4),
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
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () => removetech(),
                      child: Container(
                        width: s.width * 0.5,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 3,
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.20),
                              offset: const Offset(0, 5),
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
    print(mnth);

    FirebaseFirestore.instance
        .collection("Technician")
        .doc(widget.username)
        .get()
        .then((value) {
      setState(() {
        profile = Profile.fromMap(value.data());
      });
    });

    await fb
        .collection('Technician')
        .doc(widget.username)
        .collection("Performance")
        .doc("Completed")
        .collection("Month")
        .doc(mnth)
        .get()
        .then((DocumentSnapshot doc) {
              if (doc.exists) {
                Getcount cdata = Getcount.fromMap(doc.data());
                print(cdata.count);
                setState(() {
                  c = cdata.count;
                });
              }
            });

    await fb
        .collection('Technician')
        .doc(widget.username)
        .collection("Performance")
        .doc("Pending")
        .collection("Month")
        .doc(mnth)
        .get()
        .then((DocumentSnapshot doc) {
              if (doc.exists) {
                Getcount pdata = Getcount.fromMap(doc.data());
                print(pdata.count);
                setState(() {
                  p = pdata.count;
                });
              }
            });

    await fb
        .collection('Technician')
        .doc(widget.username)
        .collection("Performance")
        .doc("Completed")
        .collection("Month")
        .doc(mnth)
        .get()
        .then((DocumentSnapshot doc) {
              if (doc.exists) {
                Getcount prodata= Getcount.fromMap(doc.data());
                setState(() {
                  pro = prodata.count;
                });
              }
            });
  }

  removetech() async {
    await fb.collection("users").doc(widget.uid).get().then((value) {
      removeuser = UserModel.fromMap(value.data());
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Removetechalert(
              colorr: bluebg,
              emailid: removeuser.email,
              password: removeuser.password,
              name: widget.name,
              username: widget.username,
            );
          });
    }).catchError((onError) => print("Something wents wrong"));
  }
}

class Removetechalert extends StatefulWidget {
  String? username;
  String? name;
  String? emailid;
  String? password;
  final Color colorr;
  Removetechalert(
      {Key? key,
      required this.colorr,
      this.username,
      this.emailid,
      this.password,
      this.name})
      : super(key: key);

  @override
  State<Removetechalert> createState() => _RemovetechalertState();
}

class _RemovetechalertState extends State<Removetechalert> {
  bool _loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore fb = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        height: s.height * 0.25,
        child: Stack(
          children: [
            Center(
              child: _loading
                  ? const CircularProgressIndicator(color: bluebg)
                  : null,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "Do you want to Remove \n${widget.name} ?",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: widget.colorr,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Technician Details will be deleted permently !",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 14,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: s.width * 0.3,
                        height: s.height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: widget.colorr),
                        child: const Center(
                          child: Text(
                            "Cancell",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => removedata(),
                      child: Container(
                        width: s.width * 0.3,
                        height: s.height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: widget.colorr),
                        child: const Center(
                          child: Text(
                            "Okay",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  removedata() async {
    setState(() {
      _loading = true;
    });
    print(widget.emailid);
    print(widget.password);
    await _auth.signOut();
    await _auth.signInWithEmailAndPassword(
        email: "${widget.emailid}", password: "${widget.password}");
    User? user = _auth.currentUser;
    if (user!.email == widget.emailid) {
      await user.delete();
      await fb
          .collection("users")
          .doc(user.uid)
          .delete()
          .then((value) => print("user detials deleted"))
          .catchError((onError) => print("user not deletd"));

      await fb
          .collection("Technician")
          .doc(widget.username)
          .delete()
          .then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginSrc()));
      }).catchError((onError) => print("Technician not deletd"));
    }
  }
}
