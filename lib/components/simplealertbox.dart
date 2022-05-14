import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:ideal_marketing/screens/Admin/homeadminsrc.dart';
import 'package:ideal_marketing/screens/Technician/hometech.dart';

class Simplealert extends StatelessWidget {
  String? username;
  final String? titles;
  final Color colorr;
  final String? done;
  Simplealert({Key? key,this.titles, required this.colorr, this.done, this.username}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        height: 200,
        width: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(
                  Icons.warning_amber_rounded,
                  color: colorr,
                  size: 30,
                ),
                const SizedBox(width: 5,),
                Text(
                  done!,
                  style:  TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: colorr,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              titles!,
              style:  TextStyle(
                fontFamily: "Nunito",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: colorr,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            InkWell(
              onTap: ()=>Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeTech(username: username,)),
                ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: colorr),
                child: const Text(
                  "Okay",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
