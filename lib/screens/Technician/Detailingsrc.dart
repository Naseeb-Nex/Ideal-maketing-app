import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

class Detailingsrc extends StatefulWidget {
  const Detailingsrc({Key? key}) : super(key: key);

  @override
  _DetailingsrcState createState() => _DetailingsrcState();
}

class _DetailingsrcState extends State<Detailingsrc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bluebg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Program Details",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: newbg,
              ),
            )
          ],
        ),
      ),
    );
  }
}
