import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ideal_marketing/components/monthly_status.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:intl/intl.dart';

class Monthlyrepotsrc extends StatefulWidget {
  const Monthlyrepotsrc();

  @override
  State<Monthlyrepotsrc> createState() => _MonthlyrepotsrcState();
}

class _MonthlyrepotsrcState extends State<Monthlyrepotsrc> {
  // Monthly List
  List Monthly_filtered_rp = [];

  List Monthly_search_rs = [];
  // Daily activity filter
  String daily_activity_filter = "all";

  // Date Picker
  late DateTime dateTime;

  bool date_selected = false;
  FirebaseFirestore fb = FirebaseFirestore.instance;
  String formated_month = "";
  bool is_datesub = false;
  bool is_sub = false;
  // serach controller
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Adaptive size
    Size s = MediaQuery.of(context).size;

    // Date
    DateTime now = DateTime.now();

    // Report
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);
    return Scaffold(
      backgroundColor: Color(0XFFFEFFFE),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: s.width * 0.04),
          child: Column(children: [
            SizedBox(
              height: s.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: s.width * 0.13,
                    height: s.width * 0.13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0XFFF0F0F1)),
                    child: Icon(
                      Iconsax.arrow_left,
                      color: Color(0XFF312F42),
                    ),
                  ),
                ),
                Text(
                  "Monthly Report",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF080820),
                  ),
                ),
                Container(
                  width: s.width * 0.13,
                  height: s.width * 0.13,
                ),
              ],
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Monthly Activity",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0XFF080820),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Container(
              width: double.infinity,
              height: s.height * 0.4,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0XFFFBF2D6)),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/assigned.png",
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Assigned",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0XFF181830),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "67",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0XFFAEA99C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: s.width * 0.05,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0XFFE0F2E3)),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/monthlycompleted.png",
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Completed",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0XFF181830),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "67",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0XFFAEA99C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: s.width * 0.05,
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0XFFFAD6D6)),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/monthlypending.png",
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Pending",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0XFF181830),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "67",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0XFFAEA99C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: s.width * 0.05,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0XFFD6E0FA)),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/processing.png",
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Processing",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0XFF181830),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "67",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0XFFAEA99C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(height: s.height * 0.03,),
            // Monthly report
            Column(
              children: [
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
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Monthly Report",
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
                                      const EdgeInsets.symmetric(vertical: 10),
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
                                padding: EdgeInsets.only(top: s.height * 0.03),
                                child: SizedBox(
                                  width: s.width * 0.25,
                                  height: s.width * 0.25,
                                  child: LoadingIndicator(
                                    indicatorType:
                                        Indicator.ballClipRotateMultiple,
                                    colors: const [bluebg],
                                  ),
                                ),
                              ),
                            );
                          }

                          final List activityrp = [];

                          snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map a = document.data() as Map<String, dynamic>;
                            activityrp.add(a);
                          }).toList();

                          if (daily_activity_filter == "all") {
                            Monthly_filtered_rp = activityrp;
                          } else {
                            Monthly_filtered_rp = activityrp
                                .where(
                                    (i) => i['status'] == daily_activity_filter)
                                .toList();
                          }

                          if (searchController.text.isEmpty) {
                            Monthly_search_rs = Monthly_filtered_rp;
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Text(
                                              "No Programs Found !",
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () => setState(() {
                                                    daily_activity_filter =
                                                        "all";
                                                  }),
                                                  child: Container(
                                                    width: s.width * 0.15,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: s.width * 0.015,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            daily_activity_filter ==
                                                                    "all"
                                                                ? bluebg
                                                                : nonactivebg),
                                                    child: Column(
                                                      children: [
                                                        Center(
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
                                                        SizedBox(height: 4),
                                                        Container(
                                                            child:
                                                                daily_activity_filter ==
                                                                        "all"
                                                                    ? Text(
                                                                        "${Monthly_search_rs.length}",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Montserrat",
                                                                            color:
                                                                                white),
                                                                      )
                                                                    : null),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: s.width * 0.03),
                                                InkWell(
                                                  onTap: () => setState(() {
                                                    daily_activity_filter =
                                                        "assigned";
                                                  }),
                                                  child: Container(
                                                    width: s.width * 0.25,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: s.width * 0.015,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            daily_activity_filter ==
                                                                    "assigned"
                                                                ? bluebg
                                                                : nonactivebg),
                                                    child: Column(
                                                      children: [
                                                        Center(
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
                                                        SizedBox(height: 4),
                                                        Container(
                                                            child:
                                                                daily_activity_filter ==
                                                                        "assigned"
                                                                    ? Text(
                                                                        "${Monthly_search_rs.length}",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Montserrat",
                                                                            color:
                                                                                white),
                                                                      )
                                                                    : null),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: s.width * 0.03),
                                                InkWell(
                                                  onTap: () => setState(() {
                                                    daily_activity_filter =
                                                        "pending";
                                                  }),
                                                  child: Container(
                                                    width: s.width * 0.25,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: s.width * 0.015,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            daily_activity_filter ==
                                                                    "pending"
                                                                ? bluebg
                                                                : nonactivebg),
                                                    child: Column(
                                                      children: [
                                                        Center(
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
                                                        SizedBox(height: 4),
                                                        Container(
                                                            child:
                                                                daily_activity_filter ==
                                                                        "pending"
                                                                    ? Text(
                                                                        "${Monthly_search_rs.length}",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Montserrat",
                                                                            color:
                                                                                white),
                                                                      )
                                                                    : null),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: s.width * 0.03),
                                                InkWell(
                                                  onTap: () => setState(() {
                                                    daily_activity_filter =
                                                        "completed";
                                                  }),
                                                  child: Container(
                                                    width: s.width * 0.25,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: s.width * 0.015,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            daily_activity_filter ==
                                                                    "completed"
                                                                ? bluebg
                                                                : nonactivebg),
                                                    child: Column(
                                                      children: [
                                                        Center(
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
                                                        SizedBox(height: 4),
                                                        Container(
                                                            child: daily_activity_filter ==
                                                                    "completed"
                                                                ? Text(
                                                                    "${Monthly_search_rs.length}",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        color:
                                                                            white),
                                                                  )
                                                                : null),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: s.width * 0.03),
                                                InkWell(
                                                  onTap: () => setState(() {
                                                    daily_activity_filter =
                                                        "processing";
                                                  }),
                                                  child: Container(
                                                    width: s.width * 0.25,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: s.width * 0.015,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            daily_activity_filter ==
                                                                    "processing"
                                                                ? bluebg
                                                                : nonactivebg),
                                                    child: Column(
                                                      children: [
                                                        Center(
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
                                                        SizedBox(height: 4),
                                                        Container(
                                                            child: daily_activity_filter ==
                                                                    "processing"
                                                                ? Text(
                                                                    "${Monthly_search_rs.length}",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        color:
                                                                            white),
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
                                            height: 15,
                                          ),
                                        ],
                                      ),
                              ),
                              Container(
                                child: activityrp.length == 0
                                    ? null
                                    : Container(
                                        child: Monthly_search_rs.length == 0
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
                              ),
                              for (var i = 0;
                                  i < Monthly_search_rs.length;
                                  i++) ...[
                                Montlystatus(
                                  name: Monthly_search_rs[i]['name'],
                                  phn: Monthly_search_rs[i]['phn'],
                                  pgm: Monthly_search_rs[i]['pgm'],
                                  upDate: Monthly_search_rs[i]['upDate'],
                                  upTime: Monthly_search_rs[i]['upTime'],
                                  docname: Monthly_search_rs[i]['docname'],
                                  status: Monthly_search_rs[i]['status'],
                                  username: Monthly_search_rs[i]['username'],
                                  techname: Monthly_search_rs[i]['techname'],
                                  more: Monthly_search_rs[i]['more'],
                                  month: Monthly_search_rs[i]['month'],
                                  day: Monthly_search_rs[i]['day'],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                              Container(
                                  child: activityrp.length == 0
                                      ? null
                                      : Container(
                                          child: Monthly_search_rs.length == 0
                                              ? SizedBox(
                                                  height: s.height * 0.12)
                                              : SizedBox(
                                                  height: s.height * 0.05),
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
            SizedBox(height: s.height * 0.1,)
          ]),
        ),
      )),
    );
  }

  // SearchBOx
  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xffE2EAFC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: searchController,
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

  void _runFilter(String enteredKeyword) {
    setState(() {
      Monthly_search_rs = Monthly_filtered_rp.where((pgm) {
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
}
