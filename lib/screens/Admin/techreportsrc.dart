import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/dailycompletedcard.dart';
import 'package:ideal_marketing/components/dailypendingcard.dart';
import 'package:ideal_marketing/components/dailyprocessingcard.dart';
import 'package:intl/intl.dart';

import 'package:ideal_marketing/components/dailyassignedcard.dart';

import 'package:ideal_marketing/components/compelepgmcard.dart';

import 'package:loading_indicator/loading_indicator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal_marketing/constants/constants.dart';

// ignore: must_be_immutable
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
  FirebaseFirestore fb = FirebaseFirestore.instance;

  // Images
  List<String> techimg = [
    "assets/icons/tech_avatar1.png",
    "assets/icons/tech_avatar2.png",
    "assets/icons/tech_avatar3.png",
  ];

  // Program staus count
  int a = 0, p = 0, c = 0, pro = 0;

  // Daily activity filter
  String daily_activity_filter = "all";

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    // Date
    DateTime now = DateTime.now();

    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    return Stack(fit: StackFit.expand, children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // white,
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
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
                                          "$a",
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
                                          "$c",
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
                                          "$p",
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
                                          "$pro",
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
                                  horizontal: s.width * 0.03, vertical: 15),
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
                                Container(
                                    width: double.infinity,
                                    height: s.height * 0.27,
                                    child: Image.asset(
                                      "assets/icons/notsub.jpg",
                                      fit: BoxFit.contain,
                                    )),
                              ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: s.width * 0.025, vertical: 15),
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
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Daily Activity",
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
                                    height: 8,
                                  ),
                                  // Daily Activity
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
                                        .collection("Activity")
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasError) {
                                        return Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: s.height * 0.27,
                                              child: Image.asset(
                                                "assets/icons/noprograms.jpg",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text(
                                                "No Programs Found !",
                                                style: TextStyle(
                                                  fontFamily: "Montserrat",
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: s.height * 0.03),
                                            child: SizedBox(
                                              width: s.width * 0.25,
                                              height: s.width * 0.25,
                                              child: LoadingIndicator(
                                                indicatorType: Indicator
                                                    .ballClipRotateMultiple,
                                                colors: const [bluebg],
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final List activityrp = [];
                                      List filtered_activity = [];
                                      snapshot.data!.docs
                                          .map((DocumentSnapshot document) {
                                        Map a = document.data()
                                            as Map<String, dynamic>;
                                        activityrp.add(a);
                                      }).toList();

                                      if (daily_activity_filter == "all") {
                                        filtered_activity = activityrp;
                                      } else {
                                        filtered_activity = activityrp
                                            .where((i) =>
                                                i['status'] ==
                                                daily_activity_filter)
                                            .toList();
                                      }

                                      return Column(
                                        children: [
                                          Container(
                                            child: activityrp.length == 0
                                                ? Column(
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: s.height * 0.27,
                                                        child: Image.asset(
                                                          "assets/icons/noprograms.jpg",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10),
                                                        child: Text(
                                                          "No Programs Found !",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              onTap: () =>
                                                                  setState(() {
                                                                daily_activity_filter =
                                                                    "all";
                                                              }),
                                                              child: Container(
                                                                width: s.width *
                                                                    0.15,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical:
                                                                      s.width *
                                                                          0.015,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: daily_activity_filter ==
                                                                            "all"
                                                                        ? bluebg
                                                                        : nonactivebg),
                                                                child: Center(
                                                                  child: Text(
                                                                    "All",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: daily_activity_filter ==
                                                                                "all"
                                                                            ? white
                                                                            : nonactivetxt),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: s.width *
                                                                    0.03),
                                                            InkWell(
                                                              onTap: () =>
                                                                  setState(() {
                                                                daily_activity_filter =
                                                                    "assigned";
                                                              }),
                                                              child: Container(
                                                                width: s.width *
                                                                    0.25,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical:
                                                                      s.width *
                                                                          0.015,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: daily_activity_filter ==
                                                                            "assigned"
                                                                        ? bluebg
                                                                        : nonactivebg),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Assigned",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: daily_activity_filter ==
                                                                                "assigned"
                                                                            ? white
                                                                            : nonactivetxt),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: s.width *
                                                                    0.03),
                                                            InkWell(
                                                              onTap: () =>
                                                                  setState(() {
                                                                daily_activity_filter =
                                                                    "pending";
                                                              }),
                                                              child: Container(
                                                                width: s.width *
                                                                    0.25,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical:
                                                                      s.width *
                                                                          0.015,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: daily_activity_filter ==
                                                                            "pending"
                                                                        ? bluebg
                                                                        : nonactivebg),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Pending",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: daily_activity_filter ==
                                                                                "pending"
                                                                            ? white
                                                                            : nonactivetxt),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: s.width *
                                                                    0.03),
                                                            InkWell(
                                                              onTap: () =>
                                                                  setState(() {
                                                                daily_activity_filter =
                                                                    "completed";
                                                              }),
                                                              child: Container(
                                                                width: s.width *
                                                                    0.25,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical:
                                                                      s.width *
                                                                          0.015,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: daily_activity_filter ==
                                                                            "completed"
                                                                        ? bluebg
                                                                        : nonactivebg),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Completed",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: daily_activity_filter ==
                                                                                "completed"
                                                                            ? white
                                                                            : nonactivetxt),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: s.width *
                                                                    0.03),
                                                            InkWell(
                                                              onTap: () =>
                                                                  setState(() {
                                                                daily_activity_filter =
                                                                    "processing";
                                                              }),
                                                              child: Container(
                                                                width: s.width *
                                                                    0.25,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical:
                                                                      s.width *
                                                                          0.015,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: daily_activity_filter ==
                                                                            "processing"
                                                                        ? bluebg
                                                                        : nonactivebg),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Processing",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: daily_activity_filter ==
                                                                                "processing"
                                                                            ? white
                                                                            : nonactivetxt),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                          Container(
                                              child: filtered_activity.length ==
                                                      0
                                                  ? Padding(
                                                      padding: EdgeInsets.only(
                                                          top: s.height * 0.1),
                                                      child: SizedBox(
                                                          height: s.width * 0.4,
                                                          width: s.width * 0.4,
                                                          child: Image.asset(
                                                              "assets/icons/no_result.png")),
                                                    )
                                                  : null),
                                          for (var i = 0;
                                              i < filtered_activity.length;
                                              i++) ...[
                                            Activitywrapper(
                                              name: filtered_activity[i]
                                                  ['name'],
                                              address: filtered_activity[i]
                                                  ['address'],
                                              loc: filtered_activity[i]['loc'],
                                              phn: filtered_activity[i]['phn'],
                                              pgm: filtered_activity[i]['pgm'],
                                              chrg: filtered_activity[i]
                                                  ['chrg'],
                                              type: filtered_activity[i]
                                                  ['type'],
                                              upDate: filtered_activity[i]
                                                  ['upDate'],
                                              upTime: filtered_activity[i]
                                                  ['upTime'],
                                              docname: filtered_activity[i]
                                                  ['docname'],
                                              status: filtered_activity[i]
                                                  ['status'],
                                              username: filtered_activity[i]
                                                  ['username'],
                                              techname: filtered_activity[i]
                                                  ['techname'],
                                              assignedtime: filtered_activity[i]
                                                  ['assignedtime'],
                                              assigneddate: filtered_activity[i]
                                                  ['assigneddate'],
                                              priority: filtered_activity[i]
                                                  ['priority'],
                                              camount: filtered_activity[i]
                                                  ['camount'],
                                              remarks: filtered_activity[i]
                                                  ['remarks'],
                                              cdate: filtered_activity[i]
                                                  ['cdate'],
                                              ctime: filtered_activity[i]
                                                  ['ctime'],
                                              ccollname: filtered_activity[i]
                                                  ['ccollname'],
                                              cdocname: filtered_activity[i]
                                                  ['cdocname'],
                                              custdocname: filtered_activity[i]
                                                  ['custdocname'],
                                              rpdocname: filtered_activity[i]
                                                  ['rpdocname'],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                          Container(
                                              child: activityrp.length == 0
                                                  ? null
                                                  : Container(
                                                      child: filtered_activity
                                                                  .length ==
                                                              0
                                                          ? SizedBox(
                                                              height: s.height *
                                                                  0.12)
                                                          : SizedBox(
                                                              height: s.height *
                                                                  0.5),
                                                    ))
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: s.height * 0.2,
                            )
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

// ignore: must_be_immutable
class Activitywrapper extends StatelessWidget {
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? pgm;
  String? chrg;
  String? type;
  String? upDate;
  String? upTime;
  String? docname;
  String? status;
  String? username;
  String? techname;
  String? assignedtime;
  String? assigneddate;
  String? priority;
  String? camount;
  String? remarks;
  String? ctime;
  String? cdate;
  String? ccollname;
  String? cdocname;
  String? custdocname;
  String? rpdocname;

  Activitywrapper({
    Key? key,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.pgm,
    this.chrg,
    this.type,
    this.upDate,
    this.upTime,
    this.docname,
    this.status,
    this.username,
    this.techname,
    this.assignedtime,
    this.assigneddate,
    this.priority,
    this.camount,
    this.remarks,
    this.cdate,
    this.ctime,
    this.ccollname,
    this.cdocname,
    this.custdocname,
    this.rpdocname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == "completed") {
      return Dailycompltedcard(
        name: name,
        address: address,
        loc: loc,
        phn: phn,
        pgm: pgm,
        chrg: chrg,
        type: type,
        upDate: upDate,
        upTime: upTime,
        docname: docname,
        status: status,
        username: username,
        techname: techname,
        assignedtime: assignedtime,
        assigneddate: assigneddate,
        priority: priority,
        camount: camount,
        ctime: ctime,
        remarks: remarks,
      );
    } else if (status == "pending") {
      return Dailypendingcard(
        name: name,
        address: address,
        loc: loc,
        phn: phn,
        pgm: pgm,
        chrg: chrg,
        type: type,
        upDate: upDate,
        upTime: upTime,
        docname: docname,
        status: status,
        username: username,
        techname: techname,
        assignedtime: assignedtime,
        assigneddate: assigneddate,
        priority: priority,
        remarks: remarks,
        pdate: cdate,
        ptime: ctime,
      );
    } else if (status == "processing") {
      return Dailyprocessingcard(
        name: name,
        address: address,
        loc: loc,
        phn: phn,
        pgm: pgm,
        chrg: chrg,
        type: type,
        upDate: upDate,
        upTime: upTime,
        docname: docname,
        status: status,
        username: username,
        techname: techname,
        assignedtime: assignedtime,
        assigneddate: assigneddate,
        priority: priority,
        ptime: ctime,
        pdate: cdate,
        remarks: remarks,
      );
    }
    return Dailyassignedcard(
      name: name,
      address: address,
      loc: loc,
      phn: phn,
      pgm: pgm,
      chrg: chrg,
      type: type,
      upDate: upDate,
      upTime: upTime,
      docname: docname,
      status: status,
      username: username,
      techname: techname,
      assignedtime: assignedtime,
      assigneddate: assigneddate,
      priority: priority,
      custdocname: custdocname,
    );
  }
}
