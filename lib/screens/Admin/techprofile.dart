import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/components/pendingpgmcard.dart';

import 'package:intl/intl.dart';


class Techprofilesrc extends StatefulWidget {
  const Techprofilesrc({Key? key}) : super(key: key);

  @override
  _TechprofilesrcState createState() => _TechprofilesrcState();
}

class _TechprofilesrcState extends State<Techprofilesrc> {
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
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Center(
                              child: Icon(Icons.arrow_back, color: white, size: 25,),
                            ),
                          ),
                        ),
                        const Text(
                          "Programs",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.person,
                            color: Colors.transparent,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Pending Program Viewer",
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
              
            ],
          ),
        ),
      )
    ]);
  }
}