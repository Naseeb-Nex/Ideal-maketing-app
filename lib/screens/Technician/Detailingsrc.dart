import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/screens/Technician/completedsrc.dart';
import 'package:ideal_marketing/screens/Technician/pendingsrc.dart';
import 'package:ideal_marketing/screens/Technician/processingsrc.dart';

// ignore: must_be_immutable
class Detailingsrc extends StatefulWidget {
  String? uid;
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
  String? prospec;
  String? instadate;
  String? assignedtime;
  String? assigneddate;
  String? priority;
  String? custdocname;

  Detailingsrc({
    Key? key,
    this.uid,
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
    this.prospec,
    this.instadate,
    this.assignedtime,
    this.assigneddate,
    this.priority,
    this.custdocname,
  }) : super(key: key);

  @override
  _DetailingsrcState createState() => _DetailingsrcState();
}

class _DetailingsrcState extends State<Detailingsrc> {
  var random = Random();
  List<String> custimg = [
    "assets/icons/customer1.jpg",
    "assets/icons/customer2.jpg",
    "assets/icons/customer3.png"
  ];
  @override
  Widget build(BuildContext context) {
    int num = random.nextInt(100);
    int loc = num % 3;

    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 50,
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.arrow_back_sharp,
                        size: 30,
                        color: bluebg,
                      ),
                    ),
                  ),
                  const Text(
                    "Program Details",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: bluebg,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                    width: 50,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Divider(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(s.width * 0.02),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFFc0d5ff),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.13),
                            offset: const Offset(0, 3))
                      ]),
                  padding: EdgeInsets.symmetric(
                      horizontal: s.width * 0.01, vertical: 30),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: s.width * 0.03),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Circular avatar with name and address
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: s.width * 0.2,
                                  width: s.width * 0.2,
                                  child: CircleAvatar(
                                      backgroundColor: Color(0Xffffe6a7),
                                      backgroundImage:
                                          AssetImage("${custimg[loc]}")),
                                ),
                                SizedBox(
                                  width: s.width * 0.02,
                                ),
                                Container(
                                  width: s.width * 0.66,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: s.width * 0.08,
                                      ),
                                      Text(
                                        "${widget.name}",
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "${widget.address}",
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Location :",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "  ${widget.loc}",
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      // fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Program :",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  child: Text(
                                    "${widget.pgm}",
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Collection Amount :",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFd7e3fc),
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  child: Text(
                                    "${widget.chrg}",
                                    style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 14,
                                      // fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Product Specification :",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  child: Text(
                                    "${widget.prospec}",
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Installation Date :",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "  ${widget.instadate}",
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFd7e3fc),
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  child: Text(
                                    "${widget.type}",
                                    style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "${widget.assigneddate}",
                                      style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "${widget.assignedtime}",
                                      style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Positioned(
                          left: s.width * 0.15,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff9381ff)),
                            child: Text("${widget.priority}", style: TextStyle(fontFamily: "Montserrat", color: white, fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Completedsrc(
                              uid: widget.uid,
                              name: widget.name,
                              address: widget.address,
                              loc: widget.loc,
                              phn: widget.phn,
                              pgm: widget.pgm,
                              chrg: widget.chrg,
                              type: widget.type,
                              upDate: widget.upDate,
                              upTime: widget.upTime,
                              docname: widget.docname,
                              status: widget.status,
                              username: widget.username,
                              techname: widget.techname,
                              assignedtime: widget.assignedtime,
                              assigneddate: widget.assigneddate,
                              priority: widget.priority,
                              prospec: widget.prospec,
                              instadate: widget.instadate,
                              custdocname: widget.custdocname,
                            ))),
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF7ae582),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.13),
                            offset: const Offset(0, 3))
                      ]),
                  child: const Center(
                    child: Text(
                      "Completed",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Pendingsrc(
                              uid: widget.uid,
                              name: widget.name,
                              address: widget.address,
                              loc: widget.loc,
                              phn: widget.phn,
                              pgm: widget.pgm,
                              chrg: widget.chrg,
                              type: widget.type,
                              upDate: widget.upDate,
                              upTime: widget.upTime,
                              docname: widget.docname,
                              status: widget.status,
                              username: widget.username,
                              techname: widget.techname,
                              assignedtime: widget.assignedtime,
                              assigneddate: widget.assigneddate,
                              priority: widget.priority,
                              prospec: widget.prospec,
                              instadate: widget.instadate,
                              custdocname: widget.custdocname,
                            ))),
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.redAccent,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.13),
                            offset: const Offset(0, 3))
                      ]),
                  child: const Center(
                    child: Text(
                      "Pending",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Processingsrc(
                              uid: widget.uid,
                              name: widget.name,
                              address: widget.address,
                              loc: widget.loc,
                              phn: widget.phn,
                              pgm: widget.pgm,
                              chrg: widget.chrg,
                              type: widget.type,
                              upDate: widget.upDate,
                              upTime: widget.upTime,
                              docname: widget.docname,
                              status: widget.status,
                              username: widget.username,
                              techname: widget.techname,
                              assignedtime: widget.assignedtime,
                              assigneddate: widget.assigneddate,
                              priority: widget.priority,
                              prospec: widget.prospec,
                              instadate: widget.instadate,
                              custdocname: widget.custdocname,
                            ))),
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF56cfe1),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.13),
                            offset: const Offset(0, 3))
                      ]),
                  child: const Center(
                    child: Text(
                      "Processing",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: s.height * 0.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
