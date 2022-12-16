import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:ideal_marketing/constants/constants.dart";
import 'package:iconsax/iconsax.dart';

import 'package:ideal_marketing/screens/Technician/hometech.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_indicator/loading_indicator.dart';

// ignore: must_be_immutable
class Todaysreportsrc extends StatefulWidget {
  String? username;
  Todaysreportsrc({this.username});

  @override
  State<Todaysreportsrc> createState() => _TodaysreportsrcState();
}

class _TodaysreportsrcState extends State<Todaysreportsrc> {
  FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);
    // Screen size
    Size s = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeTech())),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 4,
                                color: black.withOpacity(.1),
                                offset: Offset(1, 2),
                              ),
                            ]),
                        child: Icon(
                          Iconsax.arrow_left,
                          color: bluebg,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: s.width * 0.02, vertical: 5),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: s.width * 0.03, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 4,
                          color: black.withOpacity(.1),
                          offset: Offset(1, 2),
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Image.asset(
                              "assets/icons/report.png",
                              width: 40,
                            ),
                          ),
                          Text(
                            "Today's Report",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: s.width * 0.02, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: cardbg,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 1,
                                color: black.withOpacity(.05),
                                offset: Offset(1, 2),
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/scooter.png",
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Vehicle Details",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5),
                            StreamBuilder<QuerySnapshot>(
                                stream: fb
                                    .collection("Reports")
                                    .doc(year)
                                    .collection("Month")
                                    .doc(month)
                                    .collection(day)
                                    .doc("Tech")
                                    .collection("Reports")
                                    .doc("${widget.username}")
                                    .collection("vehicle")
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {}
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: SizedBox(
                                        width: s.width * 0.2,
                                        height: s.width * 0.2,
                                        child: LoadingIndicator(
                                          indicatorType:
                                              Indicator.ballClipRotateMultiple,
                                          colors: const [black],
                                        ),
                                      ),
                                    );
                                  }

                                  final List vehicle = [];
                                  snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                    Map a =
                                        document.data() as Map<String, dynamic>;
                                    vehicle.add(a);
                                    // a['uid'] = document.id;
                                  }).toList();
                                  return Column(
                                    children: [
                                      Container(
                                          child: vehicle.length == 0
                                              ? Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: s.width * 0.03),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Iconsax.danger,
                                                        color: yellowfg,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "No Vehicle Used Today !",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 13,
                                                          color:
                                                              Color(0XFF808080),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : null),
                                      for (var i = 0;
                                          i < vehicle.length;
                                          i++) ...[
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: s.width * 0.1,
                                                          height: s.width * 0.1,
                                                          child: Image.asset(
                                                              "assets/icons/scooter_icon.png"),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 6),
                                                          child: Text(
                                                            "${vehicle[i]['name']}",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 17,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          "assets/icons/distance.png",
                                                          width: s.width * 0.07,
                                                          height:
                                                              s.width * 0.07,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "${int.parse("${vehicle[i]['end']}") - int.parse("${vehicle[i]['start']}")}",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Km",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ]),
                                        )
                                      ]
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: s.width * 0.02, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: cardbg,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 1,
                                color: black.withOpacity(.05),
                                offset: Offset(1, 2),
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/expenses.png",
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Expense Details",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5),
                            FutureBuilder<DocumentSnapshot>(
                              future: fb
                                  .collection("Reports")
                                  .doc(year)
                                  .collection("Month")
                                  .doc(month)
                                  .collection(day)
                                  .doc("Tech")
                                  .collection("Reports")
                                  .doc("${widget.username}")
                                  .get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text("Something went wrong");
                                }

                                if (snapshot.hasData &&
                                    !snapshot.data!.exists) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 40),
                                    child: Text(
                                      "No data Found!",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  );
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;

                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${data['expense']}",
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                }

                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 10),
                                        blurRadius: 20,
                                        color: secondbg.withOpacity(0.23),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: s.width * 0.1),
                                    child: Center(
                                      child: SizedBox(
                                        width: s.width * 0.15,
                                        height: s.width * 0.15,
                                        child: LoadingIndicator(
                                          indicatorType:
                                              Indicator.ballClipRotateMultiple,
                                          colors: const [bluebg],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ));
  }
}
