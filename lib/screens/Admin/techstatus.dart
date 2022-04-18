import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/components/pendingpgmcard.dart';

import 'package:intl/intl.dart';

class Techstatus extends StatefulWidget {
  String? name;
  String? img;
  String? uid;
  String? username;
  Techstatus({Key? key, this.name, this.img, this.uid, this.username})
      : super(key: key);

  @override
  _TechstatusState createState() => _TechstatusState();
}

class _TechstatusState extends State<Techstatus> {
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
          child: DefaultTabController(
            length: 4,
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
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          Text(
                            "${widget.name}'s Status",
                            style: const TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 19,
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
                      const TabBar(
                        tabs: [
                          Tab(
                            text: "assigned",
                          ),
                          Tab(
                            text: "completed",
                          ),
                          Tab(
                            text: "pending",
                          ),
                          Tab(
                            text: "processing",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: newbg,
                    ),
                    
                    child: TabBarView(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: white,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.redAccent,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: bluebg,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
