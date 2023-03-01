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
        child: Column(children: [
          SizedBox(
            height: s.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: s.width * 0.04),
            child: Row(
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
          ),
          SizedBox(height: s.height * 0.03,),
          
        ]),
      )),
    );
  }
}
