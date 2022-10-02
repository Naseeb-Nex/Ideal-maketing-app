import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal_marketing/services/assignedpgmdata.dart';
import 'package:intl/intl.dart';

import '../services/customer_history.dart';
import '../services/pgmhistory.dart';

// ignore: must_be_immutable
class Confirmationcard extends StatefulWidget {
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
  String? custdocname;
  String? techname;
  String? assignedtime;
  String? assigneddate;
  String? priority;
  String? prospec;
  String? instadate;

  Confirmationcard({
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
    this.custdocname,
    this.upTime,
    this.docname,
    this.status,
    this.username,
    this.techname,
    this.assignedtime,
    this.assigneddate,
    this.priority,
    this.prospec,
    this.instadate,
  }) : super(key: key);

  @override
  State<Confirmationcard> createState() => _ConfirmationcardState();
}

class _ConfirmationcardState extends State<Confirmationcard> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                children: [
                  SizedBox(
                    height: s.width * 0.15,
                    width: s.width * 0.15,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/icons/customer_icon.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: s.width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: s.width * 0.65,
                        child: Text(
                          "${widget.name}",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: s.width * 0.55,
                        child: Text(
                          "${widget.address}",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFcaf0f8),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 3,
                            color: Color(0xFF5e6472).withOpacity(0.1),
                          )
                        ]),
                    child: Text(
                      "Assigned : ${widget.techname}",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    child: loading ? CircularProgressIndicator( color: bluebg) : null,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffe8e8e4)),
                    child: Text("${widget.priority}"),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Program : ",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: s.width * 0.6,
                    child: Text(
                      "${widget.pgm}",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Product Spec : ",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: s.width * 0.45,
                    child: Text(
                      "${widget.prospec}",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Location : ",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: s.width * 0.6,
                    child: Text(
                      "${widget.loc}",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Phone : ",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: s.width * 0.6,
                    child: Text(
                      "${widget.phn}",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Collection : ",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: s.width * 0.3,
                    child: Text(
                      "${widget.chrg}",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0XFFf8f9fa),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.assigneddate}",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "${widget.assignedtime}",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                            ),
                          ),
                        ]),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Assigntechup(),
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0XFFe8fd9d),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(2, 3))
                            ],
                          ),
                          child: Center(child: Icon(Icons.done)),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () => Cancelassinged(),
                        child: Container(
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0XFFf7cad0),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(2, 3))
                              ],
                            ),
                            child: Center(
                              child: Text(
                                " X ",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  void Assigntechup() {
    FirebaseFirestore fb = FirebaseFirestore.instance;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM d y kk:mm:ss').format(now);
    String assigneddate = DateFormat('d MM y').format(now);
    String assignedtime = DateFormat('h:mma').format(now);

    Assignpgmdata apgm = Assignpgmdata(
      uid: widget.uid,
      name: widget.name,
      address: widget.address,
      loc: widget.loc,
      phn: widget.phn,
      pgm: widget.pgm,
      chrg: widget.chrg,
      type: widget.type,
      upDate: widget.upDate,
      upTime: widget.upTime,
      docname: widget.docname,
      prospec: widget.prospec,
      instadate: widget.instadate,
      status: "assigned",
      username: widget.username,
      techname: widget.techname,
      priority: widget.priority,
      assigneddate: assigneddate,
      assignedtime: assignedtime,
      custdocname: widget.custdocname,
    );

    CustomerPgmHistory custhistory = CustomerPgmHistory(
        upDate: assigneddate,
        upTime: assignedtime,
        msg: "Program Assigned to ${widget.techname}",
        techname: widget.techname,
        status: "assigned",
        docname: formattedDate,
        custdocname: widget.custdocname);

    Pgmhistory history = Pgmhistory(
      name: widget.name,
      address: widget.address,
      loc: widget.loc,
      phn: widget.phn,
      pgm: widget.pgm,
      chrg: widget.chrg,
      type: widget.type,
      upDate: assigneddate,
      upTime: assignedtime,
      docname: formattedDate,
      prospec: widget.prospec,
      instadate: widget.instadate,
      status: "assigned",
      ch: "Program Assigned",
      techname: widget.techname,
    );

    setState(() {
      loading = true;
    });

// Update the Program status
    fb.collection("Programs").doc(widget.docname).update({
      'status': 'assigned',
      'techname': '${widget.techname}',
      'techuname': '${widget.username}'
    });

    // Updating the Customer program status
    fb
        .collection("Customer")
        .doc(widget.custdocname)
        .collection("Programs")
        .doc(widget.docname)
        .update({'status': 'assigned'});

    //  check this updation is importent or not
    fb
        .collection("Programs")
        .doc(widget.docname)
        .collection("AssignedPgm")
        .doc("Technician")
        .set(apgm.toMap());

    fb
        .collection("Technician")
        .doc(widget.username)
        .collection("Assignedpgm")
        .doc(widget.docname)
        .set(apgm.toMap())
        .then((value) {
      fb.collection("history").doc(formattedDate).set(history.toMap());

      // customer program history updated
      fb
          .collection("Customer")
          .doc(widget.custdocname)
          .collection("Programs")
          .doc(widget.docname)
          .collection("History")
          .doc(formattedDate)
          .set(custhistory.toMap());

      fb
      .collection("ConfirmList")
      .doc(widget.docname)
      .delete();

      setState(() {
        loading = false;
      });
    }).catchError((error) => print("Failed to assign program : $error"));
  }

  void Cancelassinged() {
    FirebaseFirestore fb = FirebaseFirestore.instance;
    setState(() {
      loading = true;
    });
    fb
      .collection("ConfirmList")
      .doc(widget.docname)
      .delete();
    setState(() {
      loading = false;
    });
  }
}
