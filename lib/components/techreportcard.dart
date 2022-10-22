import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

class Techreportcard extends StatefulWidget {
  String? name;
  String? username;

  Techreportcard({this.username, this.name});

  @override
  State<Techreportcard> createState() => _TechreportcardState();
}

class _TechreportcardState extends State<Techreportcard> {
  var random = Random();
  List<String> techimg = [
    "assets/icons/tech_avatar1.png",
    "assets/icons/tech_avatar2.png",
    "assets/icons/tech_avatar3.png",
  ];
  @override
  Widget build(BuildContext context) {
    int num = random.nextInt(100);
    int loc = num % 3;

    Size s = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 1, blurRadius: 2, color: black.withOpacity(0.1))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: s.width * 0.2,
                  height: s.width * 0.2,
                  child: Image.asset(
                    "${techimg[loc]}",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: s.width * 0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.name}",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFf25c54)),
                          child: Center(
                              child: Text(
                            "Activity",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            // const SizedBox(width: 4,),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFffd500),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "10",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                      color: white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFF70e000),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "5",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                      color: white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFd62839),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                      color: white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF1e96fc),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                      color: white),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
