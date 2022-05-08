import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

class Resetpswdsrc extends StatefulWidget {
  String? uid;
  String? name;
  String? img;
  Resetpswdsrc({Key? key}) : super(key: key);

  @override
  _ResetpswdsrcState createState() => _ResetpswdsrcState();
}

class _ResetpswdsrcState extends State<Resetpswdsrc> {
  final formkey = GlobalKey<FormState>();

  final newpswrd = TextEditingController();
  final confrimpswrd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(38, 0, 91, 1),
                Color.fromRGBO(55, 48, 255, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: s.height * 0.5,
                width: s.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Change Password",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: bluebg),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Enter new password twice and verify it",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black26),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            const Text(
                              "New Password :",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 40,
                              width: s.width * 0.55,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: bluebg),),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:10.0, vertical: 10),
                                    child: TextFormField(
                                      controller: newpswrd,
                                      
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            const Text(
                              "Confirm Password :",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 40,
                              width: s.width * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: bluebg)),
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: s.height * 0.05,
                        width: s.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: bluebg,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 5))
                            ]),
                        child: const Center(
                          child: Text(
                            "Update Password",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
