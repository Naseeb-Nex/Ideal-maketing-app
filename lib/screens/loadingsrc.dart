import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

class LoadingSrc extends StatelessWidget {
  const LoadingSrc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primarybg,
      body: SizedBox(
        height: s.height,
        width: s.width,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/icons/imaicon.png",
                width: 150,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: s.height * 0.7),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.redAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
