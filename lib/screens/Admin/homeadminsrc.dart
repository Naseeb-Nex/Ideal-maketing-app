import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/services/reportstatus.dart';
import 'package:intl/intl.dart';

import 'package:ideal_marketing/components/techreportcard.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/screens/Admin/competedpgmsrc.dart';
import 'package:ideal_marketing/screens/Admin/confirmationlist.dart';

import 'pendingsrc.dart';
import 'package:ideal_marketing/screens/loginsrc.dart';
import 'package:ideal_marketing/screens/register.dart';
import 'package:ideal_marketing/services/user_model.dart';
import 'package:ideal_marketing/screens/Admin/techprofile.dart';
import 'package:ideal_marketing/screens/Admin/techstatus.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  FirebaseFirestore fb = FirebaseFirestore.instance;
  int p = 0, c = 0;
  int touchedIndex = 0;
  bool rpstatus = false;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      pgmsetup();
      // reportinitstatus();
    }
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
    });
  }

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
          child: DefaultTabController(
            length: 2,
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
                          Container(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                  child: Image.asset(
                                "assets/icons/menu.png",
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                                color: Colors.transparent,
                              ))),
                          const Text(
                            "Admin Panel",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () => logout(context),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.logout_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TabBar(
                        tabs: [
                          Tab(
                            text: "Home",
                          ),
                          Tab(
                            text: "Report",
                          )
                        ],
                        labelColor: white,
                        indicatorColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        // indicatorWeight: ,
                        padding: EdgeInsets.only(left: 30, right: 30),
                        unselectedLabelColor: Color(0xFFb8dbd9),

                        // Rectangular Indicator

                        // indicatorSize: TabBarIndicatorSize.tab,
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: s.width * 0.1),
                        // indicator: BoxDecoration(
                        //     gradient: LinearGradient(colors: [
                        //       Color(0XFF90caf9),
                        //       Color(0xff1e88e5)
                        //     ]),
                        //     borderRadius: BorderRadius.circular(50),
                        //     color: Colors.white),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Color(0Xffedf2fb),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: TabBarView(
                      children: [
                        RefreshIndicator(
                          onRefresh: () => pgmsetup(),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Program Status",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 22,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Pendingsrc())),
                                      child: Container(
                                        width: s.width * 0.4,
                                        height: s.height * 0.14,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: const Color(0XFFFED4D6),
                                            boxShadow: [
                                              BoxShadow(
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  offset: const Offset(0, 5))
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Pending Program",
                                              style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0XFFff5c8a),
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Text(
                                                "$p",
                                                style: const TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0XFFff5c8a),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Completedpgmsrc())),
                                      child: Container(
                                        width: s.width * 0.4,
                                        height: s.height * 0.14,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: const Color(0XFFDBF4F1),
                                            boxShadow: [
                                              BoxShadow(
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  offset: const Offset(0, 5))
                                            ]),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Completed Program",
                                              style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0XFF52b788),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Text(
                                                "$c",
                                                style: const TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0XFF52b788),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: InkWell(
                                  onTap: (() => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const Confirmationlist()))),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: white,
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              offset: const Offset(5, 0))
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: Image.asset(
                                                  "assets/icons/confimmsg.png",
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Confirmation List",
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 17,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: cheryred),
                                              padding: EdgeInsets.all(11),
                                              child:
                                                  StreamBuilder<QuerySnapshot>(
                                                stream: fb
                                                    .collection('ConfirmList')
                                                    .snapshots(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<QuerySnapshot>
                                                        snapshot) {
                                                  if (snapshot.hasError) {
                                                    print(
                                                        'Something went Wrong');
                                                  }
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return Text(
                                                      "0",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: white),
                                                    );
                                                  }

                                                  String? confimsize = snapshot
                                                      .data!.docs.length
                                                      .toString();

                                                  return Text(
                                                    "$confimsize",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: white),
                                                  );
                                                },
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Technician Status",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 22,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 300,
                                child: Center(child: Techcardspace()),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 20),
                              //   child: Text(
                              //     "Staff Registration",
                              //     style: TextStyle(
                              //       fontFamily: "Nunito",
                              //       fontSize: 22,
                              //       fontWeight: FontWeight.bold,
                              //       color: Colors.black,
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: s.width * 0.2),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegistrationScreen()));
                                  },
                                  child: Container(
                                    height: s.height * 0.1,
                                    width: s.width * 0.4,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: bluebg,
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 5,
                                            blurRadius: 10,
                                            color: bluebg.withOpacity(0.2),
                                            offset: const Offset(0, 5),
                                          )
                                        ]),
                                    child: const Center(
                                      child: Text(
                                        "Staff Registration",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            SizedBox(
                              height: s.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: s.width * 0.03),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: s.width * 0.06,
                                    vertical: s.height * 0.03),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          color: black.withOpacity(0.1))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "OVERVIEW",
                                      style: TextStyle(
                                          color: bluebg,
                                          fontFamily: "Montserrat",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Divider(
                                      endIndent: 10,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    AspectRatio(
                                      aspectRatio: 1.3,
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: rpstatus
                                            ? StreamBuilder<
                                                DocumentSnapshot<
                                                    Map<String, dynamic>>>(
                                                stream: fb
                                                    .collection("Reports")
                                                    .doc(year)
                                                    .collection("Month")
                                                    .doc(month)
                                                    .collection(day)
                                                    .doc("Counter")
                                                    .snapshots(),
                                                builder: (_, snapshot) {
                                                  if (snapshot.hasError)
                                                    return Text(
                                                        'Error = ${snapshot.error}');

                                                  if (snapshot.hasData) {
                                                    // double a=0.0,c=0,p=0,pro=0;
                                                    var output =
                                                        snapshot.data!.data();
                                                    var assigned =
                                                        output!['assigned'];
                                                    var competed =
                                                        output['competed'];
                                                    var pending =
                                                        output['pending'];
                                                    var processing =
                                                        output['processing'];

                                                    double a, c, pro, p;
                                                    if (assigned != null) {
                                                      a = assigned.toDouble();
                                                    } else {
                                                      a = 0;
                                                    }

                                                    if (pending != null) {
                                                      p = pending.toDouble();
                                                    } else {
                                                      p = 0;
                                                    }

                                                    if (processing != null) {
                                                      pro =
                                                          processing.toDouble();
                                                      pro = 0;
                                                    } else {
                                                      pro = 0;
                                                    }

                                                    if (competed != null) {
                                                      c = competed.toDouble();
                                                    } else {
                                                      c = 0;
                                                    }

                                                    return PieChart(
                                                      PieChartData(
                                                          pieTouchData: PieTouchData(
                                                              touchCallback:
                                                                  (FlTouchEvent
                                                                          event,
                                                                      pieTouchResponse) {
                                                            setState(() {
                                                              if (!event
                                                                      .isInterestedForInteractions ||
                                                                  pieTouchResponse ==
                                                                      null ||
                                                                  pieTouchResponse
                                                                          .touchedSection ==
                                                                      null) {
                                                                touchedIndex =
                                                                    -1;
                                                                return;
                                                              }
                                                              touchedIndex =
                                                                  pieTouchResponse
                                                                      .touchedSection!
                                                                      .touchedSectionIndex;
                                                            });
                                                          }),
                                                          borderData:
                                                              FlBorderData(
                                                            show: false,
                                                          ),
                                                          sectionsSpace: 0,
                                                          centerSpaceRadius: 0,
                                                          sections:
                                                              showingSections(a,
                                                                  p, c, pro)),
                                                    );
                                                  }

                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                },
                                              )
                                            : Container(
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Image.asset(
                                                  'assets/gif/emptyreport.gif',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: s.width * 0.3,
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    color: Color(0xFF70e000),
                                                  ),
                                                  SizedBox(
                                                    width: s.width * 0.02,
                                                  ),
                                                  Text(
                                                    "Completed",
                                                    style: const TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 13,
                                                      // color: Color(0xff70e000),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    color: Color(0xFFd62839),
                                                  ),
                                                  SizedBox(
                                                    width: s.width * 0.02,
                                                  ),
                                                  Text(
                                                    "Pending",
                                                    style: const TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 13,
                                                      // color: Color(0xffd62839),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    color: Color(0xFF1e96fc),
                                                  ),
                                                  SizedBox(
                                                    width: s.width * 0.02,
                                                  ),
                                                  Text(
                                                    "Processing",
                                                    style: const TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 13,
                                                      // color: Color(0xffd62839),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    color: Color(0xFFffd500),
                                                  ),
                                                  SizedBox(
                                                    width: s.width * 0.02,
                                                  ),
                                                  Text(
                                                    "Assigned",
                                                    style: const TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 13,
                                                      // color: Color(0xffd62839),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "*Today's Summary",
                                      style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: s.width * 0.03),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: s.width * 0.06,
                                    vertical: s.height * 0.03),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          color: black.withOpacity(0.1))
                                    ]),
                                child: Column(
                                  children: [
                                    Text(
                                      "REPORT",
                                      style: TextStyle(
                                          color: bluebg,
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Divider(
                                      endIndent: 10,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      "assets/icons/nodata.png",
                                      width: s.width * 0.4,
                                      height: s.width * 0.4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
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

  List<PieChartSectionData> showingSections(
      double a, double p, double c, double pro) {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff70e000),
            value: c,
            title: '${c.toInt()}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/ophthalmology-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xff70e000),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffffd500),
            value: a,
            title: '${a.toInt()}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/librarian-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xffffd500),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xffd62839),
            value: p,
            title: '${p.toInt()}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/fitness-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xffd62839),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff1e96fc),
            value: pro,
            title: '${pro.toInt()}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/worker-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xff1e96fc),
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw 'Oh no';
      }
    });
  }

  // Future<void> fetchreport() async {
  //   DateTime now = DateTime.now();

  //   // Report
  //   String day = DateFormat('d').format(now);
  //   String month = DateFormat('MM').format(now);
  //   String year = DateFormat('y').format(now);

  // fb
  //     .collection("Reports")
  //     .doc(year)
  //     .collection("Month")
  //     .doc(month)
  //     .collection(day)
  //     .doc("Counter")
  //       .get();
  // }

  pgmsetup() async {
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);

    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    // Check report is initailized or not
    fb
        .collection("Reports")
        .doc(year)
        .collection("Month")
        .doc(month)
        .collection(day)
        .doc("Counter")
        .get()
        .then(
      (DocumentSnapshot doc) {
        if (!doc.exists) {
          setState(() {
            rpstatus = false;
          });
        } else {
          setState(() {
            rpstatus = true;
          });
        }
      },
      onError: (e) => print("Error in RPStatus: $e"),
    );

    try {
      await fb
          .collection('Completedpgm')
          .doc("Day")
          .collection(cday)
          .get()
          .then((snap) => {
                setState(() {
                  c = snap.size;
                })
              });
      await fb.collection('Programs').get().then((snap) => {
            setState(() {
              p = snap.size;
            })
          });
    } catch (e) {
      print(e);
    }
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginSrc()));
  }
}

class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Color borderColor;

  const _Badge(
    this.svgAsset, {
    Key? key,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Icon(
          Icons.pending_actions_rounded,
          color: borderColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Techcardspace extends StatelessWidget {
  String? userid;
  Techcardspace({Key? key, this.userid}) : super(key: key);
  Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('Technician').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {}
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: cheryred,
              ),
            );
          }

          final List techprofile = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            techprofile.add(a);
            // a['uid'] = document.id;
          }).toList();
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: techprofile.length,
            itemBuilder: (context, i) {
              return Techcard(
                name: techprofile[i]['name'],
                img: techprofile[i]['pic'],
                username: techprofile[i]['username'],
                uid: techprofile[i]['uid'],
              );
            },
          );
        });
  }
}

// ignore: must_be_immutable
class Techcard extends StatefulWidget {
  String? name;
  String? img;
  String? uid;
  String? username;
  Techcard({Key? key, this.name, this.img, this.uid, this.username})
      : super(key: key);

  @override
  _TechcardState createState() => _TechcardState();
}

class _TechcardState extends State<Techcard> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  int a = 0;
  int c = 0;
  int p = 0;
  int pro = 0;

  @override
  void initState() {
    if (mounted) {
      startup();
    }
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    a = 0;
    c = 0;
    p = 0;
    pro = 0;
    super.dispose();
  }

  @override
  void activate() {
    startup();
    super.activate();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Techstatus(
                name: widget.name,
                img: widget.img,
                username: widget.username,
                uid: widget.uid,
              ),
            )),
        onDoubleTap: () => startup(),
        child: Container(
          width: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 3,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 2))
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Techprofilesrc(
                          name: widget.name,
                          img: widget.img,
                          username: widget.username,
                          uid: widget.uid,
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundColor: bluebg,
                        backgroundImage:
                            AssetImage("assets/icons/avataricon.png"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: FittedBox(
                    child: Text(
                      "${widget.name}",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff273746),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow),
                        ),
                        const AutoSizeText(
                          " Assingned",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff273746),
                          ),
                          minFontSize: 10,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    Text(
                      "$a",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff273746),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.greenAccent),
                        ),
                        const AutoSizeText(
                          " Completed",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff273746),
                          ),
                          minFontSize: 10,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    Text(
                      "$c",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff273746),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: cheryred),
                        ),
                        const AutoSizeText(
                          " Pending",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff273746),
                          ),
                          minFontSize: 10,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    Text(
                      "$p",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff273746),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                        ),
                        const AutoSizeText(
                          " Processing",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff273746),
                          ),
                          minFontSize: 10,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    Text(
                      "$pro",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff273746),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  startup() async {
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
    await fb
        .collection('Technician')
        .doc(widget.username)
        .collection("Assignedpgm")
        .get()
        .then((snap) => {
              setState(() {
                a = snap.size;
              })
            });

    await fb
        .collection('Technician')
        .doc(widget.username)
        .collection("Completedpgm")
        .doc("Day")
        .collection(cday)
        .get()
        .then((snap) => {
              setState(() {
                c = snap.size;
              })
            });
    await fb
        .collection('Technician')
        .doc(widget.username)
        .collection("Pendingpgm")
        .get()
        .then((snap) => {
              setState(() {
                p = snap.size;
              })
            });

    await fb
        .collection('Technician')
        .doc(widget.username)
        .collection("Processingpgm")
        .get()
        .then((snap) => {
              setState(() {
                pro = snap.size;
              })
            });
  }
}
