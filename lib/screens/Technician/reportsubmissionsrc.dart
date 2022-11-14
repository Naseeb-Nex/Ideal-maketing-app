import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/vehicleinfocard.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// loading_indicator
import 'package:loading_indicator/loading_indicator.dart';

import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class ReportSubmissionSrc extends StatefulWidget {
  String? username;
  String? techname;
  ReportSubmissionSrc({Key? key, this.username, this.techname})
      : super(key: key);

  @override
  _ReportSubmissionSrcState createState() => _ReportSubmissionSrcState();
}

class _ReportSubmissionSrcState extends State<ReportSubmissionSrc> {
  FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    DateTime now = DateTime.now();
    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String techvdoc = DateFormat('MM d').format(now);
    String year = DateFormat('y').format(now);
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
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: EdgeInsets.all(s.width * 0.03),
                child: Icon(Iconsax.arrow_left),
              ),
            ),
            actions: [],
            elevation: 0,
            title: const Text(
              "Report Submission Screen",
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
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: s.height * 0.01),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: white,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: s.height * 0.03),
                            Center(
                              child: Text(
                                "Summary Report",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: bluebg,
                                ),
                              ),
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
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
                                      offset: Offset(1, 2),
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: s.width * 0.1,
                                        height: s.width * 0.1,
                                      ),
                                      Text(
                                        "Vehicle Details",
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: bluebg,
                                        ),
                                      ),
                                      Container(
                                        width: s.width * 0.1,
                                        height: s.width * 0.1,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: white,
                                            boxShadow: [
                                              BoxShadow(
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                color: black.withOpacity(.1),
                                                offset: Offset(-1, 2),
                                              ),
                                            ]),
                                        child: IconButton(
                                          icon: Icon(
                                            Iconsax.add,
                                            color: bluebg,
                                          ),
                                          onPressed: () => {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 5,
                                  ),
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
                                          AsyncSnapshot<QuerySnapshot>
                                              snapshot) {
                                        if (snapshot.hasError) {}
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: SizedBox(
                                              width: s.width * 0.25,
                                              height: s.width * 0.25,
                                              child: LoadingIndicator(
                                                indicatorType: Indicator
                                                    .ballClipRotateMultiple,
                                                colors: const [bluebg],
                                              ),
                                            ),
                                          );
                                        }

                                        final List vehicle = [];
                                        snapshot.data!.docs
                                            .map((DocumentSnapshot document) {
                                          Map a = document.data()
                                              as Map<String, dynamic>;
                                          vehicle.add(a);
                                          // a['uid'] = document.id;
                                        }).toList();
                                        return Column(
                                          children: [
                                            Container(
                                                child: vehicle.length == 0
                                                    ? Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    s.width *
                                                                        0.01),
                                                        child: Image.asset(
                                                            "assets/icons/no_vehicles.jpg"),
                                                      )
                                                    : null),
                                            for (var i = 0;
                                                i < vehicle.length;
                                                i++) ...[
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0),
                                                child: VechicleInfoCard(
                                                  name: vehicle[i]['name'],
                                                  desc: vehicle[i]
                                                      ['description'],
                                                  type: vehicle[i]['type'],
                                                  status: vehicle[i]['status'],
                                                  techname: vehicle[i]
                                                      ['techname'],
                                                  statusdesc: vehicle[i]
                                                      ['statusdesc'],
                                                  update: vehicle[i]['update'],
                                                  uptime: vehicle[i]['uptime'],
                                                ),
                                              )
                                            ]
                                          ],
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
