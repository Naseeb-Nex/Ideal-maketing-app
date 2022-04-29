import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ideal_marketing/constants/profile.dart';

class Editprofile extends StatefulWidget {
  String? name;
  String? uid;
  String? username;
  Editprofile({Key? key, this.name, this.uid, this.username})
      : super(key: key);

  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {

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
      backgroundColor: primarybg,
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
            ],
          ),
        ),
      ),
    );
  }

  setupsrc() async {
  }
}