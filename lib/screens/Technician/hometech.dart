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

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users/${user!.uid}/Profile")
        .doc("profile")
        .get()
        .then((value) {
      profile = Profile.fromMap(value.data());
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
                height: s.height * 0.14,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 60,
                        ),
                        const Text(
                          "Home",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
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
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: s.width * 0.035),
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
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: limegreen),)
                                )
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
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
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
        floatingActionButton: Container(
          width: s.width * 0.15,
          height: s.width * 0.15,
          decoration: BoxDecoration(color: bluebg, shape: BoxShape.circle),
          child: Icon(
            Icons.edit,
            color: white,
          ),
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
