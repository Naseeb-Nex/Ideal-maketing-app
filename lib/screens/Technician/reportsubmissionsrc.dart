import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/constants/profile.dart';
import 'package:ideal_marketing/screens/Technician/Pendingpgmview.dart';
import 'package:ideal_marketing/screens/Technician/Processingpgmview.dart';

import 'package:ideal_marketing/screens/Technician/resetpassword.dart';

import '../loginsrc.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ReportSubmissionSrc extends StatefulWidget {

  ReportSubmissionSrc({Key? key})
      : super(key: key);

  @override
  _ReportSubmissionSrcState createState() => _ReportSubmissionSrcState();
}

class _ReportSubmissionSrcState extends State<ReportSubmissionSrc> {
  
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
          appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (context) => InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Padding(
                padding: EdgeInsets.all(s.width * 0.03),
                child: Image.asset(
                  "assets/icons/menu.png",
                  color: white,
                ),
              ),
            ),
          ),
          actions: [
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
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
          ),
        )
      ],
    );
  }
}
