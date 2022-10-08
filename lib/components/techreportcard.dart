import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

class Techreportcard extends StatefulWidget {
  const Techreportcard();

  @override
  State<Techreportcard> createState() => _TechreportcardState();
}

class _TechreportcardState extends State<Techreportcard> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
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
                CircleAvatar(
                  radius: s.width * 0.08,
                  backgroundColor: bluebg,
                  backgroundImage: AssetImage("assets/icons/avataricon.png"),
                ),
                SizedBox(
                  width: s.width * 0.05,
                ),
                Text(
                  "Muhammed Naseeb",
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              width: s.width * 0.1,
              height: s.width * 0.1,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue.shade600),
              child: Center(
                child: Text(
                  "10",
                  style: TextStyle(color: white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
