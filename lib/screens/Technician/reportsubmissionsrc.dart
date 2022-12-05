import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/assignvehiclereportcard.dart';
import 'package:ideal_marketing/components/loadingDialog.dart';
import 'package:ideal_marketing/components/vreportsubcard.dart';
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

  late CollectionReference streamreport;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController expenseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    buildStream();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    DateTime now = DateTime.now();
    // Report
    String techvdoc = DateFormat('MM d').format(now);

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
                                          onPressed: () => {
                                            showDialog(
                                                context: context,
                                                builder: (context) => Dialog(
                                                      insetAnimationCurve:
                                                          Curves.easeInCubic,
                                                      insetAnimationDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  500),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                          s.width * 0.03,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color:
                                                                      bluebg),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            s.height *
                                                                                0.02),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "Assign Vehicle",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Nunito",
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color:
                                                                            white,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: s.height *
                                                                  0.02,
                                                            ),
                                                            StreamBuilder<
                                                                    QuerySnapshot>(
                                                                stream: fb
                                                                    .collection(
                                                                        "Garage")
                                                                    .snapshots(),
                                                                builder: (BuildContext
                                                                        context,
                                                                    AsyncSnapshot<
                                                                            QuerySnapshot>
                                                                        snapshot) {
                                                                  if (snapshot
                                                                      .hasError) {}
                                                                  if (snapshot
                                                                          .connectionState ==
                                                                      ConnectionState
                                                                          .waiting) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width: s.width *
                                                                            0.25,
                                                                        height: s.width *
                                                                            0.25,
                                                                        child:
                                                                            LoadingIndicator(
                                                                          indicatorType:
                                                                              Indicator.ballClipRotateMultiple,
                                                                          colors: const [
                                                                            bluebg
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  final List
                                                                      vehicle =
                                                                      [];
                                                                  snapshot.data!
                                                                      .docs
                                                                      .map((DocumentSnapshot
                                                                          document) {
                                                                    Map a = document
                                                                            .data()
                                                                        as Map<
                                                                            String,
                                                                            dynamic>;
                                                                    vehicle
                                                                        .add(a);
                                                                  }).toList();

                                                                  return Column(
                                                                    children: [
                                                                      Container(
                                                                          child: vehicle.length == 0
                                                                              ? Padding(
                                                                                  padding: EdgeInsets.symmetric(horizontal: s.width * 0.01),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Image.asset("assets/icons/not_asigned.jpg"),
                                                                                      Text(
                                                                                        "No Vehicle Available",
                                                                                        style: TextStyle(fontFamily: "Montserrat", fontSize: 15, color: Colors.blueGrey),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              : null),
                                                                      for (var i =
                                                                              0;
                                                                          i < vehicle.length;
                                                                          i++) ...[
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.symmetric(vertical: 5.0),
                                                                          child:
                                                                              AssignVehiclereportcard(
                                                                            name:
                                                                                vehicle[i]['name'],
                                                                            desc:
                                                                                vehicle[i]['description'],
                                                                            type:
                                                                                vehicle[i]['type'],
                                                                            status:
                                                                                vehicle[i]['status'],
                                                                            docname:
                                                                                vehicle[i]['docname'],
                                                                            techname:
                                                                                widget.techname,
                                                                            username:
                                                                                widget.username,
                                                                            statusdesc:
                                                                                vehicle[i]['statusdesc'],
                                                                            update:
                                                                                vehicle[i]['update'],
                                                                            uptime:
                                                                                vehicle[i]['uptime'],
                                                                          ),
                                                                        ),
                                                                      ]
                                                                    ],
                                                                  );
                                                                }),
                                                          ],
                                                        ),
                                                      ),
                                                    ))

                                            // Confimation Dialog box

                                            // showDialog(
                                            //     context: context,
                                            //     builder: (context) => Dialog(
                                            //           child: Padding(
                                            //             padding: EdgeInsets.all(
                                            //                 s.width * 0.03),
                                            //             child: Column(
                                            //               mainAxisSize:
                                            //                   MainAxisSize.min,
                                            //               children: [
                                            //                 Container(
                                            //                   width: s.width *
                                            //                       0.25,
                                            //                   height: s.width *
                                            //                       0.25,
                                            //                   child:
                                            //                       Image.asset(
                                            //                     "assets/icons/q_mark.png",
                                            //                     fit: BoxFit
                                            //                         .contain,
                                            //                   ),
                                            //                 ),
                                            //                 Text(
                                            //                   "Are you sure?",
                                            //                   style: TextStyle(
                                            //                       fontFamily:
                                            //                           "Montserrat",
                                            //                       fontSize: 17,
                                            //                       fontWeight:
                                            //                           FontWeight
                                            //                               .w700),
                                            //                 ),
                                            //                 SizedBox(
                                            //                     height: 10),
                                            //                 Text(
                                            //                   "Would you like to add the vehicle you used today?",
                                            //                   style: TextStyle(
                                            //                     fontFamily:
                                            //                         "Montserrat",
                                            //                     fontSize: 15,
                                            //                     fontWeight:
                                            //                         FontWeight
                                            //                             .w500,
                                            //                   ),
                                            //                   textAlign:
                                            //                       TextAlign
                                            //                           .center,
                                            //                 ),
                                            //                 SizedBox(
                                            //                   height: 10,
                                            //                 ),
                                            //                 Row(
                                            //                   mainAxisAlignment:
                                            //                       MainAxisAlignment
                                            //                           .spaceAround,
                                            //                   children: [
                                            //                     Flexible(
                                            //                       flex: 1,
                                            //                       fit: FlexFit
                                            //                           .tight,
                                            //                       child:
                                            //                           InkWell(
                                            //                         onTap: () =>
                                            //                             Navigator.pop(
                                            //                                 context),
                                            //                         child:
                                            //                             Container(
                                            //                           decoration:
                                            //                               BoxDecoration(
                                            //                             borderRadius:
                                            //                                 BorderRadius.circular(15),
                                            //                             color: Color(
                                            //                                 0XFF5963d5),
                                            //                           ),
                                            //                           padding: EdgeInsets.symmetric(
                                            //                               vertical:
                                            //                                   10),
                                            //                           child:
                                            //                               Center(
                                            //                             child:
                                            //                                 Text(
                                            //                               "Cancel",
                                            //                               style: TextStyle(
                                            //                                   fontFamily: "Montserrat",
                                            //                                   fontSize: 16,
                                            //                                   color: white,
                                            //                                   fontWeight: FontWeight.w600),
                                            //                             ),
                                            //                           ),
                                            //                         ),
                                            //                       ),
                                            //                     ),
                                            //                     SizedBox(
                                            //                         width: 10),
                                            //                     Flexible(
                                            //                       flex: 1,
                                            //                       fit: FlexFit
                                            //                           .tight,
                                            //                       child:
                                            //                           InkWell(
                                            //                         onTap:
                                            //                             () {},
                                            //                         child:
                                            //                             Container(
                                            //                           decoration:
                                            //                               BoxDecoration(
                                            //                             borderRadius:
                                            //                                 BorderRadius.circular(15),
                                            //                             color: Color(
                                            //                                 0XFF5963d5),
                                            //                           ),
                                            //                           padding: EdgeInsets.symmetric(
                                            //                               vertical:
                                            //                                   10),
                                            //                           child:
                                            //                               Center(
                                            //                             child:
                                            //                                 Text(
                                            //                               "Ok",
                                            //                               style: TextStyle(
                                            //                                   fontFamily: "Montserrat",
                                            //                                   fontSize: 16,
                                            //                                   color: white,
                                            //                                   fontWeight: FontWeight.w600),
                                            //                             ),
                                            //                           ),
                                            //                         ),
                                            //                       ),
                                            //                     ),
                                            //                   ],
                                            //                 ),
                                            //                 SizedBox(
                                            //                   height: s.width *
                                            //                       0.035,
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //           ),
                                            //         ))
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  StreamBuilder<QuerySnapshot>(
                                      stream: streamreport.snapshots(),
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
                                                        child: Column(
                                                          children: [
                                                            Image.asset(
                                                              "assets/icons/warning.png",
                                                              height: s.height *
                                                                  0.12,
                                                            ),
                                                            Text(
                                                              "No Vehicle Used !",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 17,
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
                                                child: Vreportsubcard(
                                                  name: vehicle[i]['name'],
                                                  vdocname: vehicle[i]
                                                      ['vdocname'],
                                                  docname: vehicle[i]
                                                      ['docname'],
                                                  username: vehicle[i]
                                                      ['username'],
                                                  update: vehicle[i]['upDate'],
                                                  start: vehicle[i]['start'],
                                                  end: vehicle[i]['end'],
                                                  desc: vehicle[i]['desc'],
                                                  uptime: vehicle[i]['upTime'],
                                                ),
                                              )
                                            ]
                                          ],
                                        );
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: s.height * 0.03,
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
                              child: Form(
                                key: _formKey,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Expense",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: bluebg,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                      Text(
                                        "Today's Expense Details",
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(height: s.height * 0.02),
                                      TextFormField(
                                        autofocus: false,
                                        minLines: 6,
                                        maxLines: 8,
                                        controller: expenseController,
                                        keyboardType: TextInputType.multiline,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return ("Please fill Expense Details");
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          expenseController.text = value!;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 15, 20, 15),
                                          hintText: "Expense Details",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: s.height * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () => up_expense,
                                            child: Container(
                                              width: s.width * 0.3,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: bluebg,
                                                  ),
                                              child: Center(
                                                child: Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                    fontFamily: "Montserrat",
                                                    fontSize: 17,
                                                    color: white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(height: s.height * 0.25),
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

  void buildStream() {
    FirebaseFirestore fb = FirebaseFirestore.instance;

    DateTime now = DateTime.now();
    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    setState(() {
      streamreport = fb
          .collection("Reports")
          .doc(year)
          .collection("Month")
          .doc(month)
          .collection(day)
          .doc("Tech")
          .collection("Reports")
          .doc("${widget.username}")
          .collection("vehicle");
    });
  }

  Future<void> up_expense() async {
    FirebaseFirestore fb = FirebaseFirestore.instance;

    DateTime now = DateTime.now();
    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    if(_formKey.currentState!.validate()){
      showDialog(context: context, builder: (context) => LoadingDialog());

      // fb
      //     .collection("Reports")
      //     .doc(year)
      //     .collection("Month")
      //     .doc(month)
      //     .collection(day)
      //     .doc("Tech")
      //     .collection("Reports")
      //     .doc("${widget.username}")
      //     .
    }
  }


}
