import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ideal_marketing/screens/Technician/Detailingsrc.dart';

class Programcard extends StatelessWidget {
  String? uid;
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? pgm;
  String? chrg;
  String? type;
  String? upDate;
  String? upTime;
  String? docname;
  String? status;
  String? username;
  String? techname;
  String? assignedtime;
  String? assigneddate;
  String? priority;

  Programcard({
    Key? key,
    this.uid,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.pgm,
    this.chrg,
    this.type,
    this.upDate,
    this.upTime,
    this.docname,
    this.status,
    this.username,
    this.techname,
    this.assignedtime,
    this.assigneddate,
    this.priority,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Detailingsrc(
                    uid: uid,
                    name: name,
                    address: address,
                    loc: loc,
                    phn: phn,
                    pgm: pgm,
                    chrg: chrg,
                    type: type,
                    upDate: upDate,
                    upTime: upTime,
                    docname: docname,
                    status: status,
                    username: username,
                    techname: techname,
                    assignedtime: assignedtime,
                    assigneddate: assigneddate,
                    priority: priority,
                  ))),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 20,
              color: secondbg.withOpacity(0.23),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      child: Text(
                        "$name",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        child: Text(
                          "$address",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        "$pgm",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Phone call initiated");
                    _makePhoneCall(phn!);
                  },
                  child: Container(
                    height: 40,
                    width: 35,
                    child: Icon(
                      Icons.call,
                      size: 25,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.pin_drop_outlined,
                    color: cheryred,
                  ),
                  Container(
                    child: Text(
                      "$loc",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "$type",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}
