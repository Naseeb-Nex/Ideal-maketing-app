import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/dailycompletedcard.dart';
import 'package:ideal_marketing/components/dailypendingcard.dart';
import 'package:ideal_marketing/components/dailyprocessingcard.dart';
import 'package:ideal_marketing/components/monthly_status.dart';
import 'package:intl/intl.dart';

import 'package:iconsax/iconsax.dart';

import 'package:ideal_marketing/components/dailyassignedcard.dart';

import 'package:loading_indicator/loading_indicator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// date Picker
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal_marketing/constants/constants.dart';

// ignore: must_be_immutable
class Techreportsrc extends StatefulWidget {
  String? username;
  String? name;
  int loc;
  // Program staus count
  int a, p, c, pro;
  Techreportsrc({
    Key? key,
    this.username,
    this.name,
    required this.loc,
    required this.a,
    required this.p,
    required this.pro,
    required this.c,
  }) : super(key: key);

  @override
  _TechreportsrcState createState() => _TechreportsrcState();
}

class _TechreportsrcState extends State<Techreportsrc> {
  FirebaseFirestore fb = FirebaseFirestore.instance;

  // Bottom Naigation bar
  var _selectedTab = _SelectedTab.day;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  // Images
  List<String> techimg = [
    "assets/icons/tech_avatar1.png",
    "assets/icons/tech_avatar2.png",
    "assets/icons/tech_avatar3.png",
  ];

  // Daily activity filter
  String daily_activity_filter = "all";

  // Bottome navigation key
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // Date Picker
  late DateTime dateTime;
  bool date_selected = false;

  String? _selectedyear;
  String? _selectedmonth;
  String? _selectedday;

  // Montly List
    List montly_filtered_rp = [];
    List montly_search_rs = [];

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    // Date
    DateTime now = DateTime.now();

    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    return Scaffold(
      // New bottom navigation bar
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: bluebg,
        items: <Widget>[
          Icon(Iconsax.calendar, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Iconsax.calendar_add, size: 30),
        ],
        onTap: _handleIndexChanged,
      ),
      body: Stack(fit: StackFit.expand, children: [
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                              IndexedStack(
                                index:
                                    _SelectedTab.values.indexOf(_selectedTab),
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: white),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    "${widget.a}",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: white),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    "${widget.c}",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: white),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    "${widget.p}",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: white),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    "${widget.pro}",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                            horizontal: s.width * 0.03,
                                            vertical: 15),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                            horizontal: s.width * 0.025,
                                            vertical: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                                  AsyncSnapshot<QuerySnapshot>
                                                      snapshot) {
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
                                                          colors: const [
                                                            bluebg
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final List activityrp = [];
                                                List filtered_activity = [];
                                                snapshot.data!.docs.map(
                                                    (DocumentSnapshot
                                                        document) {
                                                  Map a = document.data()
                                                      as Map<String, dynamic>;
                                                  activityrp.add(a);
                                                }).toList();

                                                if (daily_activity_filter ==
                                                    "all") {
                                                  filtered_activity =
                                                      activityrp;
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
                                                      child:
                                                          activityrp.length == 0
                                                              ? Column(
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          s.height *
                                                                              0.27,
                                                                      child: Image
                                                                          .asset(
                                                                        "assets/icons/noprograms.jpg",
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        "No Programs Found !",
                                                                        style:
                                                                            TextStyle(
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
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap: () =>
                                                                                setState(() {
                                                                              daily_activity_filter = "all";
                                                                            }),
                                                                            child:
                                                                                Container(
                                                                              width: s.width * 0.15,
                                                                              padding: EdgeInsets.symmetric(
                                                                                vertical: s.width * 0.015,
                                                                              ),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "all" ? bluebg : nonactivebg),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "All",
                                                                                  style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "all" ? white : nonactivetxt),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: s.width * 0.03),
                                                                          InkWell(
                                                                            onTap: () =>
                                                                                setState(() {
                                                                              daily_activity_filter = "assigned";
                                                                            }),
                                                                            child:
                                                                                Container(
                                                                              width: s.width * 0.25,
                                                                              padding: EdgeInsets.symmetric(
                                                                                vertical: s.width * 0.015,
                                                                              ),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "assigned" ? bluebg : nonactivebg),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "Assigned",
                                                                                  style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "assigned" ? white : nonactivetxt),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: s.width * 0.03),
                                                                          InkWell(
                                                                            onTap: () =>
                                                                                setState(() {
                                                                              daily_activity_filter = "pending";
                                                                            }),
                                                                            child:
                                                                                Container(
                                                                              width: s.width * 0.25,
                                                                              padding: EdgeInsets.symmetric(
                                                                                vertical: s.width * 0.015,
                                                                              ),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "pending" ? bluebg : nonactivebg),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "Pending",
                                                                                  style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "pending" ? white : nonactivetxt),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: s.width * 0.03),
                                                                          InkWell(
                                                                            onTap: () =>
                                                                                setState(() {
                                                                              daily_activity_filter = "completed";
                                                                            }),
                                                                            child:
                                                                                Container(
                                                                              width: s.width * 0.25,
                                                                              padding: EdgeInsets.symmetric(
                                                                                vertical: s.width * 0.015,
                                                                              ),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "completed" ? bluebg : nonactivebg),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "Completed",
                                                                                  style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "completed" ? white : nonactivetxt),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: s.width * 0.03),
                                                                          InkWell(
                                                                            onTap: () =>
                                                                                setState(() {
                                                                              daily_activity_filter = "processing";
                                                                            }),
                                                                            child:
                                                                                Container(
                                                                              width: s.width * 0.25,
                                                                              padding: EdgeInsets.symmetric(
                                                                                vertical: s.width * 0.015,
                                                                              ),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "processing" ? bluebg : nonactivebg),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "Processing",
                                                                                  style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "processing" ? white : nonactivetxt),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          15,
                                                                    ),
                                                                  ],
                                                                ),
                                                    ),
                                                    Container(
                                                      child: activityrp
                                                                  .length ==
                                                              0
                                                          ? null
                                                          : Container(
                                                              child: filtered_activity
                                                                          .length ==
                                                                      0
                                                                  ? Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top: s.height *
                                                                              0.1),
                                                                      child: SizedBox(
                                                                          height: s.width *
                                                                              0.4,
                                                                          width: s.width *
                                                                              0.4,
                                                                          child:
                                                                              Image.asset("assets/icons/no_result.png")),
                                                                    )
                                                                  : null),
                                                    ),
                                                    for (var i = 0;
                                                        i <
                                                            filtered_activity
                                                                .length;
                                                        i++) ...[
                                                      Activitywrapper(
                                                        name:
                                                            filtered_activity[i]
                                                                ['name'],
                                                        address:
                                                            filtered_activity[i]
                                                                ['address'],
                                                        loc:
                                                            filtered_activity[i]
                                                                ['loc'],
                                                        phn:
                                                            filtered_activity[i]
                                                                ['phn'],
                                                        pgm:
                                                            filtered_activity[i]
                                                                ['pgm'],
                                                        chrg:
                                                            filtered_activity[i]
                                                                ['chrg'],
                                                        type:
                                                            filtered_activity[i]
                                                                ['type'],
                                                        upDate:
                                                            filtered_activity[i]
                                                                ['upDate'],
                                                        upTime:
                                                            filtered_activity[i]
                                                                ['upTime'],
                                                        docname:
                                                            filtered_activity[i]
                                                                ['docname'],
                                                        status:
                                                            filtered_activity[i]
                                                                ['status'],
                                                        username:
                                                            filtered_activity[i]
                                                                ['username'],
                                                        techname:
                                                            filtered_activity[i]
                                                                ['techname'],
                                                        assignedtime:
                                                            filtered_activity[i]
                                                                [
                                                                'assignedtime'],
                                                        assigneddate:
                                                            filtered_activity[i]
                                                                [
                                                                'assigneddate'],
                                                        priority:
                                                            filtered_activity[i]
                                                                ['priority'],
                                                        camount:
                                                            filtered_activity[i]
                                                                ['camount'],
                                                        remarks:
                                                            filtered_activity[i]
                                                                ['remarks'],
                                                        cdate:
                                                            filtered_activity[i]
                                                                ['cdate'],
                                                        ctime:
                                                            filtered_activity[i]
                                                                ['ctime'],
                                                        ccollname:
                                                            filtered_activity[i]
                                                                ['ccollname'],
                                                        cdocname:
                                                            filtered_activity[i]
                                                                ['cdocname'],
                                                        custdocname:
                                                            filtered_activity[i]
                                                                ['custdocname'],
                                                        rpdocname:
                                                            filtered_activity[i]
                                                                ['rpdocname'],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                    Container(
                                                        child:
                                                            activityrp.length ==
                                                                    0
                                                                ? null
                                                                : Container(
                                                                    child: filtered_activity.length ==
                                                                            0
                                                                        ? SizedBox(
                                                                            height: s.height *
                                                                                0.12)
                                                                        : SizedBox(
                                                                            height:
                                                                                s.height * 0.05),
                                                                  ))
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: s.height * 0.04,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: s.width * 0.025,
                                            vertical: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Search",
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
                                            SizedBox(height: 10),
                                            InkWell(
                                              onTap: () async {
                                                DateTime? newDateTime =
                                                    await showRoundedDatePicker(
                                                  context: context,
                                                  locale: Locale('en', 'US'),
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(
                                                      DateTime.now().year - 2),
                                                  lastDate: DateTime(
                                                      DateTime.now().year + 1),
                                                  borderRadius: 20,
                                                  fontFamily: "Montserrat",
                                                  theme: ThemeData(
                                                      primaryColor: bluebg,
                                                      accentColor: bluebg,
                                                      textTheme: TextTheme(
                                                        caption: TextStyle(
                                                            color: bluebg),
                                                      ),
                                                      accentTextTheme:
                                                          TextTheme(
                                                        bodyText2: TextStyle(
                                                            color: bluebg),
                                                      )),
                                                );
                                                if (newDateTime != null) {
                                                  setState(() {
                                                    dateTime = newDateTime;
                                                    date_selected = true;
                                                    _selectedyear =
                                                        "${dateTime.year}";
                                                    _selectedmonth =
                                                        "${dateTime.month}";
                                                    _selectedday =
                                                        "${dateTime.day}";
                                                  });
                                                }
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: s.width * 0.03,
                                                    horizontal: s.width * 0.03),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      spreadRadius: 2,
                                                      blurRadius: 3,
                                                      color: black
                                                          .withOpacity(.05),
                                                      offset:
                                                          const Offset(4, 2),
                                                    ),
                                                  ],
                                                ),
                                                child: Text(
                                                  "Select the Date",
                                                  style: TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        child: date_selected
                                            ? Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: s.width * 0.025,
                                                    vertical: 15),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      spreadRadius: 2,
                                                      blurRadius: 4,
                                                      color:
                                                          black.withOpacity(.1),
                                                      offset: Offset(5, 7),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text(
                                                              "Report",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 18,
                                                                color: bluebg,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            Text(
                                                              "$_selectedday - $_selectedmonth - $_selectedyear",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 17,
                                                                color: bluebg,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    // Daily Activity
                                                    StreamBuilder<
                                                        QuerySnapshot>(
                                                      stream: fb
                                                          .collection("Reports")
                                                          .doc(_selectedyear)
                                                          .collection("Month")
                                                          .doc(_selectedmonth)
                                                          .collection(
                                                              _selectedday!)
                                                          .doc("Tech")
                                                          .collection("Reports")
                                                          .doc(
                                                              "${widget.username}")
                                                          .collection(
                                                              "Activity")
                                                          .snapshots(),
                                                      builder: (BuildContext
                                                              context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              snapshot) {
                                                        if (snapshot.hasError) {
                                                          return Column(
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height:
                                                                    s.height *
                                                                        0.27,
                                                                child:
                                                                    Image.asset(
                                                                  "assets/icons/noprograms.jpg",
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10),
                                                                child: Text(
                                                                  "No Programs Found !",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        }
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return Center(
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: s.height *
                                                                          0.03),
                                                              child: SizedBox(
                                                                width: s.width *
                                                                    0.25,
                                                                height:
                                                                    s.width *
                                                                        0.25,
                                                                child:
                                                                    LoadingIndicator(
                                                                  indicatorType:
                                                                      Indicator
                                                                          .ballClipRotateMultiple,
                                                                  colors: const [
                                                                    bluebg
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final List activityrp =
                                                            [];
                                                        List filtered_activity =
                                                            [];
                                                        snapshot.data!.docs.map(
                                                            (DocumentSnapshot
                                                                document) {
                                                          Map a =
                                                              document.data()
                                                                  as Map<String,
                                                                      dynamic>;
                                                          activityrp.add(a);
                                                        }).toList();

                                                        if (daily_activity_filter ==
                                                            "all") {
                                                          filtered_activity =
                                                              activityrp;
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
                                                              child: activityrp
                                                                          .length ==
                                                                      0
                                                                  ? Column(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              s.height * 0.27,
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/icons/noprograms.jpg",
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(vertical: 10),
                                                                          child:
                                                                              Text(
                                                                            "No Programs Found !",
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: "Montserrat",
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
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () => setState(() {
                                                                                  daily_activity_filter = "all";
                                                                                }),
                                                                                child: Container(
                                                                                  width: s.width * 0.15,
                                                                                  padding: EdgeInsets.symmetric(
                                                                                    vertical: s.width * 0.015,
                                                                                  ),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "all" ? bluebg : nonactivebg),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "All",
                                                                                      style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "all" ? white : nonactivetxt),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(width: s.width * 0.03),
                                                                              InkWell(
                                                                                onTap: () => setState(() {
                                                                                  daily_activity_filter = "assigned";
                                                                                }),
                                                                                child: Container(
                                                                                  width: s.width * 0.25,
                                                                                  padding: EdgeInsets.symmetric(
                                                                                    vertical: s.width * 0.015,
                                                                                  ),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "assigned" ? bluebg : nonactivebg),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "Assigned",
                                                                                      style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "assigned" ? white : nonactivetxt),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(width: s.width * 0.03),
                                                                              InkWell(
                                                                                onTap: () => setState(() {
                                                                                  daily_activity_filter = "pending";
                                                                                }),
                                                                                child: Container(
                                                                                  width: s.width * 0.25,
                                                                                  padding: EdgeInsets.symmetric(
                                                                                    vertical: s.width * 0.015,
                                                                                  ),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "pending" ? bluebg : nonactivebg),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "Pending",
                                                                                      style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "pending" ? white : nonactivetxt),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(width: s.width * 0.03),
                                                                              InkWell(
                                                                                onTap: () => setState(() {
                                                                                  daily_activity_filter = "completed";
                                                                                }),
                                                                                child: Container(
                                                                                  width: s.width * 0.25,
                                                                                  padding: EdgeInsets.symmetric(
                                                                                    vertical: s.width * 0.015,
                                                                                  ),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "completed" ? bluebg : nonactivebg),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "Completed",
                                                                                      style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "completed" ? white : nonactivetxt),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(width: s.width * 0.03),
                                                                              InkWell(
                                                                                onTap: () => setState(() {
                                                                                  daily_activity_filter = "processing";
                                                                                }),
                                                                                child: Container(
                                                                                  width: s.width * 0.25,
                                                                                  padding: EdgeInsets.symmetric(
                                                                                    vertical: s.width * 0.015,
                                                                                  ),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "processing" ? bluebg : nonactivebg),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "Processing",
                                                                                      style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "processing" ? white : nonactivetxt),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                      ],
                                                                    ),
                                                            ),
                                                            Container(
                                                              child: activityrp
                                                                          .length ==
                                                                      0
                                                                  ? null
                                                                  : Container(
                                                                      child: filtered_activity.length ==
                                                                              0
                                                                          ? Padding(
                                                                              padding: EdgeInsets.only(top: s.height * 0.1),
                                                                              child: SizedBox(height: s.width * 0.4, width: s.width * 0.4, child: Image.asset("assets/icons/no_result.png")),
                                                                            )
                                                                          : null),
                                                            ),
                                                            for (var i = 0;
                                                                i <
                                                                    filtered_activity
                                                                        .length;
                                                                i++) ...[
                                                              Activitywrapper(
                                                                name:
                                                                    filtered_activity[
                                                                            i][
                                                                        'name'],
                                                                address:
                                                                    filtered_activity[
                                                                            i][
                                                                        'address'],
                                                                loc:
                                                                    filtered_activity[
                                                                            i]
                                                                        ['loc'],
                                                                phn:
                                                                    filtered_activity[
                                                                            i]
                                                                        ['phn'],
                                                                pgm:
                                                                    filtered_activity[
                                                                            i]
                                                                        ['pgm'],
                                                                chrg:
                                                                    filtered_activity[
                                                                            i][
                                                                        'chrg'],
                                                                type:
                                                                    filtered_activity[
                                                                            i][
                                                                        'type'],
                                                                upDate:
                                                                    filtered_activity[
                                                                            i][
                                                                        'upDate'],
                                                                upTime:
                                                                    filtered_activity[
                                                                            i][
                                                                        'upTime'],
                                                                docname:
                                                                    filtered_activity[
                                                                            i][
                                                                        'docname'],
                                                                status:
                                                                    filtered_activity[
                                                                            i][
                                                                        'status'],
                                                                username:
                                                                    filtered_activity[
                                                                            i][
                                                                        'username'],
                                                                techname:
                                                                    filtered_activity[
                                                                            i][
                                                                        'techname'],
                                                                assignedtime:
                                                                    filtered_activity[
                                                                            i][
                                                                        'assignedtime'],
                                                                assigneddate:
                                                                    filtered_activity[
                                                                            i][
                                                                        'assigneddate'],
                                                                priority:
                                                                    filtered_activity[
                                                                            i][
                                                                        'priority'],
                                                                camount:
                                                                    filtered_activity[
                                                                            i][
                                                                        'camount'],
                                                                remarks:
                                                                    filtered_activity[
                                                                            i][
                                                                        'remarks'],
                                                                cdate:
                                                                    filtered_activity[
                                                                            i][
                                                                        'cdate'],
                                                                ctime:
                                                                    filtered_activity[
                                                                            i][
                                                                        'ctime'],
                                                                ccollname:
                                                                    filtered_activity[
                                                                            i][
                                                                        'ccollname'],
                                                                cdocname:
                                                                    filtered_activity[
                                                                            i][
                                                                        'cdocname'],
                                                                custdocname:
                                                                    filtered_activity[
                                                                            i][
                                                                        'custdocname'],
                                                                rpdocname:
                                                                    filtered_activity[
                                                                            i][
                                                                        'rpdocname'],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                            ],
                                                            Container(
                                                                child: activityrp
                                                                            .length ==
                                                                        0
                                                                    ? null
                                                                    : Container(
                                                                        child: filtered_activity.length ==
                                                                                0
                                                                            ? SizedBox(height: s.height * 0.12)
                                                                            : SizedBox(height: s.height * 0.05),
                                                                      ))
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : null,
                                      ),
                                      SizedBox(height: s.height * 0.02),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: s.width * 0.025,
                                            vertical: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Montly Report",
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
                                            SizedBox(height: 10),
                                            searchBox(),
                                            SizedBox(height: 10),
                                            StreamBuilder<QuerySnapshot>(
                                              stream: fb
                                                  .collection("Reports")
                                                  .doc(year)
                                                  .collection("Month")
                                                  .doc(month)
                                                  .collection("summary")
                                                  .where("username",
                                                      isEqualTo:
                                                          "${widget.username}")
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<QuerySnapshot>
                                                      snapshot) {
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
                                                          colors: const [
                                                            bluebg
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final List activityrp = [];

                                                snapshot.data!.docs.map(
                                                    (DocumentSnapshot
                                                        document) {
                                                  Map a = document.data()
                                                      as Map<String, dynamic>;
                                                  activityrp.add(a);
                                                }).toList();

                                                if (daily_activity_filter ==
                                                    "all") {
                                                  montly_filtered_rp =
                                                      activityrp;
                                                } else {
                                                  montly_filtered_rp = activityrp
                                                      .where((i) =>
                                                          i['status'] ==
                                                          daily_activity_filter)
                                                      .toList();
                                                }

                                                initState() {
                                                  setState(() {
                                                    montly_search_rs =
                                                        montly_filtered_rp;
                                                  });
                                                }

                                                return Column(
                                                  children: [
                                                    Container(
                                                      child:
                                                          activityrp.length == 0
                                                              ? Column(
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          s.height *
                                                                              0.27,
                                                                      child: Image
                                                                          .asset(
                                                                        "assets/icons/noprograms.jpg",
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        "No Programs Found !",
                                                                        style:
                                                                            TextStyle(
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
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap: () =>
                                                                                setState(() {
                                                                              daily_activity_filter = "all";
                                                                            }),
                                                                            child:
                                                                                Container(
                                                                              width: s.width * 0.15,
                                                                              padding: EdgeInsets.symmetric(
                                                                                vertical: s.width * 0.015,
                                                                              ),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "all" ? bluebg : nonactivebg),
                                                                              child: Column(
                                                                                children: [
                                                                                  Center(
                                                                                    child: Text(
                                                                                      "All",
                                                                                      style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "all" ? white : nonactivetxt),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(height: 4),
                                                                                  Container(
                                                                                      child: daily_activity_filter == "all"
                                                                                          ? Text(
                                                                                              "${montly_search_rs.length}",
                                                                                              style: TextStyle(fontFamily: "Montserrat", color: white),
                                                                                            )
                                                                                          : null),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: s.width * 0.03),
                                                                          InkWell(
                                                                            onTap: () =>
                                                                                setState(() {
                                                                              daily_activity_filter = "assigned";
                                                                            }),
                                                                            child:
                                                                                Container(
                                                                              width: s.width * 0.25,
                                                                              padding: EdgeInsets.symmetric(
                                                                                vertical: s.width * 0.015,
                                                                              ),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "assigned" ? bluebg : nonactivebg),
                                                                              child: Column(
                                                                                children: [
                                                                                  Center(
                                                                                    child: Text(
                                                                                      "Assigned",
                                                                                      style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "assigned" ? white : nonactivetxt),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(height: 4),
                                                                                  Container(
                                                                                      child: daily_activity_filter == "assigned"
                                                                                          ? Text(
                                                                                              "${montly_search_rs.length}",
                                                                                              style: TextStyle(fontFamily: "Montserrat", color: white),
                                                                                            )
                                                                                          : null),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: s.width * 0.03),
                                                                          InkWell(
                                                                            onTap: () =>
                                                                                setState(() {
                                                                              daily_activity_filter = "pending";
                                                                            }),
                                                                            child:
                                                                                Container(
                                                                              width: s.width * 0.25,
                                                                              padding: EdgeInsets.symmetric(
                                                                                vertical: s.width * 0.015,
                                                                              ),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "pending" ? bluebg : nonactivebg),
                                                                              child: Column(
                                                                                children: [
                                                                                  Center(
                                                                                    child: Text(
                                                                                      "Pending",
                                                                                      style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "pending" ? white : nonactivetxt),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(height: 4),
                                                                                  Container(
                                                                                      child: daily_activity_filter == "pending"
                                                                                          ? Text(
                                                                                              "${montly_search_rs.length}",
                                                                                              style: TextStyle(fontFamily: "Montserrat", color: white),
                                                                                            )
                                                                                          : null),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: s.width * 0.03),
                                                                          InkWell(
                                                                            onTap: () =>
                                                                                setState(() {
                                                                              daily_activity_filter = "completed";
                                                                            }),
                                                                            child:
                                                                                Container(
                                                                              width: s.width * 0.25,
                                                                              padding: EdgeInsets.symmetric(
                                                                                vertical: s.width * 0.015,
                                                                              ),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "completed" ? bluebg : nonactivebg),
                                                                              child: Column(
                                                                                children: [
                                                                                  Center(
                                                                                    child: Text(
                                                                                      "Completed",
                                                                                      style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "completed" ? white : nonactivetxt),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(height: 4),
                                                                                  Container(
                                                                                      child: daily_activity_filter == "completed"
                                                                                          ? Text(
                                                                                              "${montly_search_rs.length}",
                                                                                              style: TextStyle(fontFamily: "Montserrat", color: white),
                                                                                            )
                                                                                          : null),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: s.width * 0.03),
                                                                          InkWell(
                                                                            onTap: () =>
                                                                                setState(() {
                                                                              daily_activity_filter = "processing";
                                                                            }),
                                                                            child:
                                                                                Container(
                                                                              width: s.width * 0.25,
                                                                              padding: EdgeInsets.symmetric(
                                                                                vertical: s.width * 0.015,
                                                                              ),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: daily_activity_filter == "processing" ? bluebg : nonactivebg),
                                                                              child: Column(
                                                                                children: [
                                                                                  Center(
                                                                                    child: Text(
                                                                                      "Processing",
                                                                                      style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w500, color: daily_activity_filter == "processing" ? white : nonactivetxt),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(height: 4),
                                                                                  Container(
                                                                                      child: daily_activity_filter == "processing"
                                                                                          ? Text(
                                                                                              "${montly_search_rs.length}",
                                                                                              style: TextStyle(fontFamily: "Montserrat", color: white),
                                                                                            )
                                                                                          : null),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          15,
                                                                    ),
                                                                  ],
                                                                ),
                                                    ),
                                                    Container(
                                                      child: activityrp
                                                                  .length ==
                                                              0
                                                          ? null
                                                          : Container(
                                                              child: montly_search_rs
                                                                          .length ==
                                                                      0
                                                                  ? Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top: s.height *
                                                                              0.1),
                                                                      child: SizedBox(
                                                                          height: s.width *
                                                                              0.4,
                                                                          width: s.width *
                                                                              0.4,
                                                                          child:
                                                                              Image.asset("assets/icons/no_result.png")),
                                                                    )
                                                                  : null),
                                                    ),
                                                    for (var i = 0;
                                                        i <
                                                            montly_search_rs
                                                                .length;
                                                        i++) ...[
                                                      Montlystatus(
                                                        name:
                                                            montly_search_rs[i]
                                                                ['name'],
                                                        phn: montly_search_rs[i]
                                                            ['phn'],
                                                        pgm: montly_search_rs[i]
                                                            ['pgm'],
                                                        upDate:
                                                            montly_search_rs[i]
                                                                ['upDate'],
                                                        upTime:
                                                            montly_search_rs[i]
                                                                ['upTime'],
                                                        docname:
                                                            montly_search_rs[i]
                                                                ['docname'],
                                                        status:
                                                            montly_search_rs[i]
                                                                ['status'],
                                                        username:
                                                            montly_search_rs[i]
                                                                ['username'],
                                                        techname:
                                                            montly_search_rs[i]
                                                                ['techname'],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                    Container(
                                                        child:
                                                            activityrp.length ==
                                                                    0
                                                                ? null
                                                                : Container(
                                                                    child: montly_search_rs.length ==
                                                                            0
                                                                        ? SizedBox(
                                                                            height: s.height *
                                                                                0.12)
                                                                        : SizedBox(
                                                                            height:
                                                                                s.height * 0.05),
                                                                  ))
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
      ]),
    );
  }

  void _runFilter(String enteredKeyword) {
    setState(() {
      montly_search_rs = montly_filtered_rp.where((pgm) {
        final nameLower = pgm["name"]!.toLowerCase();
        final dayLower = pgm["day"]!.toLowerCase();
        final pgmLower = pgm["pgm"]!.toLowerCase();
        final phnumber = pgm["phn"]!;
        final searchquery = enteredKeyword.toLowerCase();

        return nameLower.contains(searchquery) ||
            dayLower.contains(searchquery) ||
            pgmLower.contains(searchquery) ||
            phnumber.contains(searchquery);
      }).toList();
    });
  }
  // Serach Functionality

  // SearchBOx
  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xffE2EAFC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
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

enum _SelectedTab { day, search, month }
