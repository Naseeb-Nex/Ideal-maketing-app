import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
// icons
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class Montlystatus extends StatefulWidget {
  String? upDate;
  String? upTime;
  String? docname;
  String? status;
  String? techname;
  String? name;
  String? phn;
  String? pgm;
  String? month;
  String? day;
  String? more;
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
  bool _isviz = false;

  var random = Random();
  List<String> custimg = [
    "assets/icons/customer1.jpg",
    "assets/icons/customer2.jpg",
    "assets/icons/customer4.jpg",
  ];

  int loc = 0;

  @override
  void initState() {
    super.initState();
    // Random Image loc
    int num = random.nextInt(100);
    loc = num % 3;
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
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: s.width * 0.03, vertical: s.width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: s.width * 0.2,
                                height: s.width * 0.2,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: redbg,
                                ),
                                child: Image.asset("${custimg[loc]}"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: s.width * 0.03),
                                child: Container(
                                  width: s.width * 0.6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: s.width * 0.08,
                                      ),
                                      Text(
                                        "${widget.name}",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        softWrap: true,
                                      ),
                                      Text(
                                        "${widget.phn}",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                        softWrap: true,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Program",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.pgm}",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _isviz,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: redbg,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "More Details",
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: redfg,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Program :",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        "${widget.pgm}",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Phone :",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "  ${widget.phn}",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Date :",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "  ${widget.upDate}",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Time :",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "  ${widget.upTime}",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [statuswrapper("${widget.status}", s)],
                )
              ],
            ),
          ),
        ),
      ],
    );
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
}
