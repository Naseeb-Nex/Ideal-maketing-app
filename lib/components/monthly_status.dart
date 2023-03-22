import 'dart:math';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
// icons
import 'package:iconsax/iconsax.dart';
import 'package:ideal_marketing/services/reportdata.dart';

// loading_indicator
import 'package:loading_indicator/loading_indicator.dart';

import '../screens/Admin/wrapper/activity_wrapper.dart';

// ignore: must_be_immutable
class Montlystatus extends StatefulWidget {
  String? day;
  String? docname;
  String? month;
  String? more;
  String? name;
  String? pgm;
  String? phn;
  String? status;
  String? techname;
  String? upDate;
  String? upTime;
  String? username;
  
  Montlystatus({
    Key? key,
    this.techname,
    this.name,
    this.pgm,
    this.upDate,
    this.upTime,
    this.docname,
    this.phn,
    this.status,
    this.month,
    this.day,
    this.more,
    this.username,
  }) : super(key: key);


  @override
  State<Montlystatus> createState() => _MontlystatusState();
}

class _MontlystatusState extends State<Montlystatus> {
  // Cutomer Image array
  List<String> custimg = [
    "assets/icons/customer1.jpg",
    "assets/icons/customer2.jpg",
    "assets/icons/customer4.jpg",
  ];

  FirebaseFirestore fb = FirebaseFirestore.instance;
  // Image loc
  int loc = 0;

  //  Random data
  var random = Random();

  // Activity Report
  Reportdata rpdata = Reportdata();

  String? year;

  bool _isviz = false;

  @override
  void initState() {
    super.initState();
    // Random Image loc
    int num = random.nextInt(100);
    loc = num % 3;

        // year extraction
    if (widget.day?.length == 1) {
      year = widget.more!.substring(5, 9);
    } else {
      year = widget.more!.substring(6, 10);
    }
  }

  Widget statuswrapper(String status, Size s) {
    if (status == "pending") {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: s.width * 0.03, vertical: s.width * 0.03),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: redbg,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 2,
                    color: black.withOpacity(0.05),
                    offset: const Offset(0, 5))
              ]),
          child: Text(
            "${widget.status}",
            style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 15,
              color: redfg,
            ),
          ),
        ),
      );
    } else if (status == "completed") {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: s.width * 0.03, vertical: s.width * 0.03),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greenbg,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 2,
                    color: black.withOpacity(0.05),
                    offset: const Offset(0, 5))
              ]),
          child: Text(
            "${widget.status}",
            style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 15,
              color: Colors.green,
            ),
          ),
        ),
      );
    } else if (status == "processing") {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: s.width * 0.03, vertical: s.width * 0.03),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: vybg,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 2,
                    color: black.withOpacity(0.05),
                    offset: const Offset(0, 5))
              ]),
          child: Text(
            "${widget.status}",
            style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 15,
              color: Colors.blue,
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: s.width * 0.03, vertical: s.width * 0.03),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: yellowbg,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: black.withOpacity(0.05),
                  offset: const Offset(0, 5))
            ]),
        child: Text(
          "${widget.status}",
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 15,
            color: yellowfg,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Column(
      children: [
        InkWell(
          onTap: () => {
            setState(() {
              _isviz = !_isviz;
            })
          },
          child: Container(
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
            child: FutureBuilder<DocumentSnapshot>(
              future: fb
                  .collection("Reports")
                  .doc(year)
                  .collection("Month")
                  .doc(widget.month)
                  .collection(widget.day!)
                  .doc("Tech")
                  .collection("Reports")
                  .doc("${widget.username}")
                  .collection("Activity")
                  .doc(widget.more)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
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
                        padding: EdgeInsets.symmetric(vertical: s.width * 0.02),
                        child: Image.asset(
                          "assets/icons/file_miss.png",
                          width: s.width * 0.4,
                          height: s.width * 0.4,
                        )),
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Activitywrapper(
                    name: data['name'],
                    address: data['address'],
                    loc: data['loc'],
                    phn: data['phn'],
                    pgm: data['pgm'],
                    chrg: data['chrg'],
                    type: data['type'],
                    upDate: data['upDate'],
                    upTime: data['upTime'],
                    docname: data['docname'],
                    status: data['status'],
                    username: data['username'],
                    techname: data['techname'],
                    assignedtime: data['assignedtime'],
                    assigneddate: data['assigneddate'],
                    priority: data['priority'],
                    camount: data['camount'],
                    remarks: data['remarks'],
                    cdate: data['cdate'],
                    ctime: data['ctime'],
                    ccollname: data['ccollname'],
                    cdocname: data['cdocname'],
                    custdocname: data['custdocname'],
                    rpdocname: data['rpdocname'],
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
                    padding: EdgeInsets.symmetric(vertical: s.width * 0.1),
                    child: Center(
                      child: SizedBox(
                        width: s.width * 0.15,
                        height: s.width * 0.15,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballClipRotateMultiple,
                          colors: const [bluebg],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Old method
            // child: Stack(
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.symmetric(
            //               horizontal: s.width * 0.03, vertical: s.width * 0.03),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.end,
            //                 children: [
            //                   Container(
            //                     width: s.width * 0.2,
            //                     height: s.width * 0.2,
            //                     clipBehavior: Clip.hardEdge,
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(10),
            //                       color: redbg,
            //                     ),
            //                     child: Image.asset("${custimg[loc]}"),
            //                   ),
            //                   Padding(
            //                     padding: EdgeInsets.only(left: s.width * 0.03),
            //                     child: Container(
            //                       width: s.width * 0.6,
            //                       child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         mainAxisAlignment: MainAxisAlignment.end,
            //                         children: [
            //                           SizedBox(
            //                             height: s.width * 0.08,
            //                           ),
            //                           Text(
            //                             "${rpdata.name}",
            //                             style: TextStyle(
            //                               fontFamily: "Nunito",
            //                               fontSize: 15,
            //                               fontWeight: FontWeight.bold,
            //                             ),
            //                             softWrap: true,
            //                           ),
            //                           Text(
            //                             "${widget.phn}",
            //                             style: TextStyle(
            //                               fontFamily: "Nunito",
            //                               fontSize: 12,
            //                               color: Colors.black,
            //                             ),
            //                             softWrap: true,
            //                             maxLines: 1,
            //                             overflow: TextOverflow.ellipsis,
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               Text(
            //                 "Program",
            //                 style: const TextStyle(
            //                   fontFamily: "Montserrat",
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               Text(
            //                 "${widget.pgm}",
            //                 style: const TextStyle(
            //                   fontFamily: "Montserrat",
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.normal,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               ),
            //             ],
            //           ),
            //         ),
            //         Visibility(
            //           visible: _isviz,
            //           child: Padding(
            //             padding:
            //                 EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            //             child: Container(
            //               width: double.infinity,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(20),
            //                 color: redbg,
            //               ),
            //               padding: const EdgeInsets.symmetric(
            //                   horizontal: 20, vertical: 20),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     "More Details",
            //                     style: const TextStyle(
            //                       fontFamily: "Nunito",
            //                       fontSize: 18,
            //                       fontWeight: FontWeight.bold,
            //                       color: redfg,
            //                     ),
            //                   ),
            //                   const SizedBox(
            //                     height: 8,
            //                   ),
            //                   Row(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       const Text(
            //                         "Program :",
            //                         style: TextStyle(
            //                           fontFamily: "Nunito",
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 16,
            //                         ),
            //                       ),
            //                       Flexible(
            //                         child: Padding(
            //                           padding: const EdgeInsets.symmetric(
            //                               horizontal: 5),
            //                           child: Text(
            //                             "${widget.pgm}",
            //                             style: TextStyle(
            //                               fontFamily: "Nunito",
            //                               fontSize: 15,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     height: 5,
            //                   ),
            //                   Row(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       const Text(
            //                         "Phone :",
            //                         style: TextStyle(
            //                           fontFamily: "Nunito",
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 16,
            //                         ),
            //                       ),
            //                       Container(
            //                         child: Text(
            //                           "  ${widget.phn}",
            //                           style: TextStyle(
            //                             fontFamily: "Nunito",
            //                             fontSize: 15,
            //                             fontWeight: FontWeight.w400,
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     height: 5,
            //                   ),
            //                   Row(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Container(
            //                         child: Text(
            //                           "Date :",
            //                           style: TextStyle(
            //                             fontFamily: "Nunito",
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 16,
            //                           ),
            //                         ),
            //                       ),
            //                       Flexible(
            //                         child: Text(
            //                           "  ${widget.upDate}",
            //                           style: TextStyle(
            //                             fontFamily: "Nunito",
            //                             fontSize: 15,
            //                             fontWeight: FontWeight.w400,
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     height: 5,
            //                   ),
            //                   Row(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Container(
            //                         child: Text(
            //                           "Time :",
            //                           style: TextStyle(
            //                             fontFamily: "Nunito",
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 16,
            //                           ),
            //                         ),
            //                       ),
            //                       Flexible(
            //                         child: Text(
            //                           "  ${widget.upTime}",
            //                           style: TextStyle(
            //                             fontFamily: "Nunito",
            //                             fontSize: 15,
            //                             fontWeight: FontWeight.w400,
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [statuswrapper("${widget.status}", s)],
            //     )
            //   ],
            // ),
          ),
        ),
      ],
    );
  }
}
