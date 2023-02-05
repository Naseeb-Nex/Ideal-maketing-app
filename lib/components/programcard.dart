import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ideal_marketing/screens/Technician/Detailingsrc.dart';

// ignore: must_be_immutable
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
  String? prospec;
  String? instadate;
  String? assignedtime;
  String? assigneddate;
  String? priority;
  String? custdocname;

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
    this.prospec,
    this.instadate,
    this.assignedtime,
    this.assigneddate,
    this.priority,
    this.custdocname,
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
                    prospec: prospec,
                    instadate: instadate,
                    custdocname: custdocname,
                  ))),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$name",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              child: RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            strutStyle: StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                              text: "$address",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        "$pgm",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _makePhoneCall(phn!);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(3, 0),
                          
                          )
                        ]),
                    height: 40,
                    width: 38,
                    child: Center(
                      child: Icon(
                        Icons.call,
                        size: 25,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.pin_drop_outlined,
                        color: cheryred,
                      ),
                      Text(
                        "$loc",
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "$type",
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 13,
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
