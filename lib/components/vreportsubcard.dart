import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
// package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motion_toast/motion_toast.dart';
// components
import 'package:ideal_marketing/components/loadingDialog.dart';

// ignore: must_be_immutable
class Vreportsubcard extends StatefulWidget {
  String? name;
  String? username;
  String? vdocname;
  String? update;
  String? uptime;

  Vreportsubcard({
    Key? key,
    this.name,
    this.username,
    this.vdocname,
    this.update,
    this.uptime,
  }) : super(key: key);

  @override
  State<Vreportsubcard> createState() => _VreportsubcardState();
}

class _VreportsubcardState extends State<Vreportsubcard> {
  // FORM key
  final _formkey = GlobalKey<FormState>();

  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();

  @override
  Widget build(context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 20,
            color: secondbg.withOpacity(0.23),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(s.width * 0.03),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: s.width * 0.11,
                      height: s.width * 0.11,
                      child: Image.asset("assets/icons/scooter-1.png"),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: s.width * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Text(
                                "${widget.name}",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${widget.uptime}",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                        Text(
                          "${widget.update}",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    padding: EdgeInsets.all(s.width * 0.03),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: black.withOpacity(.05),
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formkey,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Vehicle Report",
                            style: TextStyle(
                              color: Color(0xff828a96),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          width: s.width * 0.15,
                          height: 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff828a96),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Starting KM :",
                              style: TextStyle(
                                color: Color(0xff828a96),
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: s.width * 0.02,
                            ),
                            Flexible(
                              child: TextFormField(
                                autofocus: false,
                                controller: startController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("Please Enter Your Email");
                                  }
                                  // reg expression for email validation
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return ("Please Enter a valid email");
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  startController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Iconsax.speedometer5),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
