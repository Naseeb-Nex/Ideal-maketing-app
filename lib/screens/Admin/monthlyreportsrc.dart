import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ideal_marketing/constants/constants.dart';

class Monthlyrepotsrc extends StatefulWidget {
  const Monthlyrepotsrc();

  @override
  State<Monthlyrepotsrc> createState() => _MonthlyrepotsrcState();
}

class _MonthlyrepotsrcState extends State<Monthlyrepotsrc> {
  @override
  Widget build(BuildContext context) {
    // Adaptive size
    Size s = MediaQuery.of(context).size;
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
                Container(
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
                  SizedBox(height: 10,),
                ],
              ),
            ),

          ]),
        ),
      )),
    );
  }
}
