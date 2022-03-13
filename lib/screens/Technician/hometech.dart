import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/constants/profile.dart';
import 'package:ideal_marketing/screens/Technician/Createprofile.dart';
import 'package:ideal_marketing/screens/Technician/profilesrc.dart';
import 'package:ideal_marketing/screens/Technician/wrapper/pgmcardwrapper.dart';
import 'package:ideal_marketing/services/user_model.dart';

import '../loginsrc.dart';

class HomeTech extends StatefulWidget {
  String? username;
  HomeTech({Key? key, this.username}) : super(key: key);

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
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    });

    FirebaseFirestore.instance
        .collection("users/${user!.uid}/Profile")
        .doc("profile")
        .get()
        .then((value) {
      this.profile = Profile.fromMap(value.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Stack(fit: StackFit.expand, children: [
      Container(
        decoration: BoxDecoration(
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
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => logout(context),
                          child: Container(
                              height: 50,
                              width: 60,
                              child: Center(
                                  child: Image.asset(
                                "assets/icons/menu.png",
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ))),
                        ),
                        Text(
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
                                      )),
                            );
                          },
                          icon: Icon(Icons.person),
                          color: Colors.white,
                          iconSize: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Today's Program",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
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
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: newbg,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Pgmcardwrapper(username: widget.username,),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }

  // ActionChip(

  //     label: Text("Logout"),
  //     onPressed: () {
  //       logout(context);
  //     }),

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginSrc()));
  }
}

class Profilewrapper extends StatelessWidget {
  String? uid;
  String? name;
  String? pic;
  Profilewrapper({Key? key, this.name, this.uid, this.pic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (name == null) {
      print("No profile");
      return CreateProfile(
        uid: uid,
      );
    }
    return Profilesrc(
      uid: uid,
      name: name,
      img: pic,
    );
  }
}
