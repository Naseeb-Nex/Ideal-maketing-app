import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/services/user_model.dart';
import 'package:ideal_marketing/constants/profile.dart';

import 'Admin/homeadminsrc.dart';
import 'Office/homeoffice.dart';
import 'Technician/hometech.dart';
import 'loadingsrc.dart';


class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  Profile profile = Profile();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      setState(() {
        this.loggedInUser = UserModel.fromMap(value.data());
      });
    });

    FirebaseFirestore.instance
        .collection("users/${user!.uid}/Profile")
        .doc("profile")
        .get()
        .then((value) {
      setState(() {
        this.profile = Profile.fromMap(value.data());
      });
    });

    }

  @override
  Widget build(BuildContext context) {
    if (loggedInUser.category == "Technician") {
      print("Home Technicion");
      return HomeTech(username: profile.username,);
    }else if(loggedInUser.category == "Admin"){
      return HomeAdmin();
    }
    print("Lodingsrc");
    return LoadingSrc();
    
  }
}
