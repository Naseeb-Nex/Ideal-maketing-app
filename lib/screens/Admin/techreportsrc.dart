import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:intl/intl.dart';

class Techreportsrc extends StatefulWidget {
  String? username;
  String? name;
  int loc;
  Techreportsrc({Key? key, this.username, this.name, required this.loc})
      : super(key: key);

  @override
  _TechreportsrcState createState() => _TechreportsrcState();
}

class _TechreportsrcState extends State<Techreportsrc> {
  // Images
  List<String> techimg = [
    "assets/icons/tech_avatar1.png",
    "assets/icons/tech_avatar2.png",
    "assets/icons/tech_avatar3.png",
  ];

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Stack(fit: StackFit.expand, children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              white,
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
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: s.width,
                      height: s.height * 0.15,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: bluebg.withOpacity(0.7)),
                                    padding: const EdgeInsets.all(10),
                                    child: const Center(
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: newbg,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: EdgeInsets.all(s.width * 0.02),
                        child: Column(
                          children: [
                            SizedBox(height: s.height * 0.07),
                            Text(
                              "${widget.name}",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0XFF3a0ca3)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Text(
                                          "Assigned",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w500,
                                              color: white),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        ),
                                      ],
                                    )),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 50,
                                    color: white,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Text(
                                          "Completed",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w500,
                                              color: white),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        ),
                                      ],
                                    )),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 50,
                                    color: white,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Text(
                                          "Pending",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w500,
                                              color: white),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        ),
                                      ],
                                    )),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 50,
                                    color: white,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Text(
                                          "Processing",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w500,
                                              color: white),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            // report Submission status
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      color: black.withOpacity(.1),
                                      offset: Offset(5, 7),
                                    ),
                                  ]),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Text(
                                      "Summary Report",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                        color: bluebg,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset("assets/icons/notsub.jpg"),
                              ]),
                            ),
                            
                            Container(
                              width: 100,
                              height: s.height,
                              color: cheryred,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // avatar IMage
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: s.height * 0.05),
                      child: Container(
                        width: s.width * 0.34,
                        height: s.width * 0.34,
                        child: Image.asset(
                          "${techimg[widget.loc]}",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
