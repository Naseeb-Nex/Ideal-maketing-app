import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/programcard.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/constants/profile.dart';
import 'package:ideal_marketing/screens/Technician/Createprofile.dart';
import 'package:ideal_marketing/screens/Technician/profilesrc.dart';

import 'package:ideal_marketing/services/user_model.dart';

import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class HomeTech extends StatefulWidget {
  HomeTech({
    Key? key,
  }) : super(key: key);

  @override
  _HomeTechState createState() => _HomeTechState();
}

class _HomeTechState extends State<HomeTech> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  Profile profile = Profile();
  String? name;

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users/${user!.uid}/Profile")
        .doc("profile")
        .get()
        .then((value) {
      profile = Profile.fromMap(value.data());
      setState(() {
        name = profile.name;
      });
    });
  }

  // report visiblity
  bool rp_viz = false;

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
        drawer: Drawer(
            backgroundColor: Color(0XFF403795),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: s.height * 0.2,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(20),
                        //   bottomRight: Radius.circular(20),
                        // ),
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage("assets/icons/drawyerbg.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(s.height * 0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/tech_avatar1.png",
                              height: s.height * 0.12,
                            ),
                            Center(
                              child: Text(
                                "$name",
                                style: const TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Navigation List
              
                    Padding(
                      padding: EdgeInsets.only(
                          left: s.width * 0.04,right: s.width * 0.1, bottom: s.height * 0.03, top: s.height * 0.03),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(s.width * 0.02),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: white),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Iconsax.home,
                                    color: white,
                                  ),
                                  SizedBox(
                                    width: s.width * 0.04,
                                  ),
                                  Text(
                                    "Home",
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(s.width * 0.02),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: white),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Iconsax.personalcard,
                                    color: white,
                                  ),
                                  SizedBox(
                                    width: s.width * 0.04,
                                  ),
                                  Text(
                                    "Profile",
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(s.width * 0.02),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: white),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Iconsax.receipt,
                                    color: white,
                                  ),
                                  SizedBox(
                                    width: s.width * 0.04,
                                  ),
                                  Text(
                                    "Report status",
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(s.width * 0.02),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: white),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Iconsax.truck,
                                    color: white,
                                  ),
                                  SizedBox(
                                    width: s.width * 0.04,
                                  ),
                                  Text(
                                    "Vehicle Status",
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (context) => Padding(
              padding: EdgeInsets.all(s.width * 0.03),
              child: InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Image.asset(
                  "assets/icons/menu.png",
                  color: white,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profilewrapper(
                            name: profile.name,
                            uid: loggedInUser.uid,
                            username: user?.photoURL,
                          )),
                );
              },
              icon: const Icon(Icons.person),
              color: Colors.white,
              iconSize: 30,
            ),
          ],
          elevation: 0,
          title: const Text(
            "Home",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: s.width,
                height: s.height * 0.09,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: s.width * 0.035),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: s.width * 0.1,
                            height: s.width * 0.1,
                          ),
                          const Text(
                            "Today's Program",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: s.width * 0.1,
                                height: s.width * 0.1,
                                child: Image.asset("assets/icons/scooter.png"),
                              ),
                              Positioned(
                                  left: s.width * 0.08,
                                  top: s.width * 0.005,
                                  child: Container(
                                    width: s.width * 0.02,
                                    height: s.width * 0.02,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: limegreen),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: newbg,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection(
                                  '/Technician/${user?.photoURL}/Assignedpgm')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print('Something went Wrong');
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: bluebg,
                                  ),
                                ),
                              );
                            }

                            List _allpgm = [];
                            snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map a = document.data() as Map<String, dynamic>;
                              _allpgm.add(a);
                              a['uid'] = document.id;
                            }).toList();

                            // Report button visiblity
                            if (_allpgm.isEmpty) {
                              rp_viz = true;
                            }

                            _allpgm.sort((a, b) =>
                                a["priority"].compareTo(b["priority"]));
                            return Column(
                              children: [
                                SizedBox(height: 10),
                                for (var i = 0; i < _allpgm.length; i++) ...[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Programcard(
                                    uid: _allpgm[i]['uid'],
                                    name: _allpgm[i]['name'],
                                    address: _allpgm[i]['address'],
                                    loc: _allpgm[i]['loc'],
                                    phn: _allpgm[i]['phn'],
                                    pgm: _allpgm[i]['pgm'],
                                    chrg: _allpgm[i]['chrg'],
                                    type: _allpgm[i]['type'],
                                    upDate: _allpgm[i]['upDate'],
                                    upTime: _allpgm[i]['upTime'],
                                    docname: _allpgm[i]['docname'],
                                    status: _allpgm[i]['status'],
                                    username: _allpgm[i]['username'],
                                    techname: _allpgm[i]['techname'],
                                    assignedtime: _allpgm[i]['assignedtime'],
                                    prospec: _allpgm[i]['prospec'],
                                    instadate: _allpgm[i]['instadate'],
                                    assigneddate: _allpgm[i]['assigneddate'],
                                    priority: _allpgm[i]['priority'],
                                    custdocname: _allpgm[i]['custdocname'],
                                  ),
                                ],
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            );
                          })),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Center(
          child: rp_viz
              ? Container(
                  width: s.width * 0.15,
                  height: s.width * 0.15,
                  decoration:
                      BoxDecoration(color: bluebg, shape: BoxShape.circle),
                  child: Icon(
                    Iconsax.edit_2,
                    color: white,
                  ),
                )
              : null,
        ),
      )
    ]);
  }
}

class Profilewrapper extends StatelessWidget {
  String? uid;
  String? name;
  String? pic;
  String? username;
  Profilewrapper({Key? key, this.name, this.uid, this.pic, this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (name == null) {
      // print("No profile");
      return CreateProfile(
        uid: uid,
      );
    }
    return Profilesrc(
      uid: uid,
      name: name,
      img: pic,
      username: username,
    );
  }
}
