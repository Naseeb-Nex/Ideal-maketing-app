import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/screens/Office/homeoffice.dart';
import 'package:ideal_marketing/services/user_model.dart';
import 'package:ideal_marketing/constants/profile.dart';

import 'Admin/homeadminsrc.dart';
import 'Technician/hometech.dart';
import 'loadingsrc.dart';


class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  User? user = FirebaseAuth.instance.currentUser;
  String? view;
  @override
  void initState() {
    super.initState();
    if (user != null) {
      setState(() {
        view = user?.displayName;
      });
    }
    }

  @override
  Widget build(BuildContext context) {
    if (view == "Technician") {
      return HomeTech();
    }
    else if(view == "Admin"){
      return HomeAdmin();
    }
    return HomeOffice();
    
  }
}
