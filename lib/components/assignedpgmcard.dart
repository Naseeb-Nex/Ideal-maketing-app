import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/screens/Admin/editassignedpgmsrc.dart';
import 'package:ideal_marketing/screens/Admin/homeadminsrc.dart';
import 'package:ideal_marketing/screens/loadingsrc.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import '../services/customer_history.dart';
import '../services/pgmhistory.dart';

// ignore: must_be_immutable
class Assignedpgmcard extends StatefulWidget {
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
  String? prospec;
  String? instadate;
  String? custdocname;

  Assignedpgmcard({
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
    this.prospec,
    this.instadate,
    this.custdocname,
  }) : super(key: key);

  @override
  State<Assignedpgmcard> createState() => _AssignedpgmcardState();
}

class _AssignedpgmcardState extends State<Assignedpgmcard> {
  bool _isviz = false;
  bool _ismore = false;
  bool _loading = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Column(
      children: [
        InkWell(
          onTap: () => {
            setState(() {
              _isviz = !_isviz;
            })
          },
          child: Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.name}",
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
                                        text: "${widget.address}",
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
                                  "${widget.pgm}",
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
                              _makePhoneCall(widget.phn!);
                            },
                            child: const SizedBox(
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
                                SizedBox(
                                  width: s.width * 0.45,
                                  child: Text(
                                    "${widget.loc}",
                                    style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${widget.type}",
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: _isviz,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0XFFe1ecf7)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "More Details",
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Address :",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        "${widget.address}",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Program :",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        "${widget.pgm}",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Phone :",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "  ${widget.phn}",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Date :",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "  ${widget.upDate}",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Time :",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "  ${widget.upTime}",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Location :",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "  ${widget.loc}",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Collection Amount :",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        "${widget.chrg}",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Product Specification :",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        "${widget.prospec}",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Installation Date :",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        "${widget.instadate}",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  //delete this if wanted
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () => setState(() {
                                  _ismore = !_ismore;
                                }),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            _ismore ? redbg : Color(0XFFe9eff9),
                                      ),
                                      child: Center(
                                        child: _ismore
                                            ? Icon(Icons.close, color: cheryred)
                                            : Icon(Icons.more_horiz,
                                                color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: _ismore,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 8),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () =>
                                                PanaraConfirmDialog.show(
                                              context,
                                              title: "Are you sure?",
                                              message:
                                                  "Do you really want to convert this program? It will be convert to the MainList",
                                              confirmButtonText: "Confirm",
                                              cancelButtonText: "Cancel",
                                              onTapCancel: () {
                                                Navigator.pop(context);
                                              },
                                              onTapConfirm: () =>
                                                  converttomainlist(),
                                              panaraDialogType:
                                                  PanaraDialogType.error,
                                              barrierDismissible: false,
                                              textColor: Color(0XFF727272),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: redfg),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              child: Text(
                                                "Convert",
                                                style: TextStyle(
                                                    fontFamily: "Nunito",
                                                    fontSize: 16,
                                                    color: white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            onTap: () =>
                                                PanaraConfirmDialog.show(
                                              context,
                                              title: "Do you want to edit?",
                                              message:
                                                  "This will be change the details of the Program!",
                                              confirmButtonText: "Confirm",
                                              cancelButtonText: "Cancel",
                                              onTapCancel: () {
                                                Navigator.pop(context);
                                              },
                                              onTapConfirm: () {
                                                Navigator.pop(context);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Editassignedpgm(
                                                              name: widget.name,
                                                              address: widget
                                                                  .address,
                                                              loc: widget.loc,
                                                              phn: widget.phn,
                                                              pgm: widget.pgm,
                                                              chrg: widget.chrg,
                                                              type: widget.type,
                                                              upDate:
                                                                  widget.upDate,
                                                              upTime:
                                                                  widget.upTime,
                                                              docname: widget
                                                                  .docname,
                                                              status:
                                                                  widget.status,
                                                              username: widget
                                                                  .username,
                                                              techname: widget
                                                                  .techname,
                                                              assignedtime: widget
                                                                  .assignedtime,
                                                              assigneddate: widget
                                                                  .assigneddate,
                                                              priority: widget
                                                                  .priority,
                                                              prospec: widget
                                                                  .prospec,
                                                              instadate: widget
                                                                  .instadate,
                                                              custdocname: widget
                                                                  .custdocname,
                                                            )));
                                              },
                                              panaraDialogType:
                                                  PanaraDialogType.warning,
                                              barrierDismissible: false,
                                              textColor: Color(0XFF727272),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Color(0xFFf48c06)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    fontFamily: "Nunito",
                                                    fontSize: 16,
                                                    color: white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: s.height * 0.3,
                            child: _loading
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: cheryred))
                                : null,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  Future<void> converttomainlist() async {
    Navigator.pop(context);

    // Loading circle
    setState(() {
      _loading = true;
    });

    FirebaseFirestore fb = FirebaseFirestore.instance;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM d y kk:mm:ss').format(now);
    String assigneddate = DateFormat('d MM y').format(now);
    String assignedtime = DateFormat('h:mma').format(now);

    CustomerPgmHistory custhistory = CustomerPgmHistory(
        upDate: assigneddate,
        upTime: assignedtime,
        msg: "Convert the program to MainList",
        techname: widget.techname,
        status: "pending",
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
      status: "pending",
      ch: "program converted to MainList",
    );

// Update the Program status with pending
    await fb.collection("Programs").doc(widget.docname).update({
      'status': 'pending',
      'techname': null,
      'techuname': null,
    });

    // Updating the Customer program status as pending
    await fb
        .collection("Customer")
        .doc(widget.custdocname)
        .collection("Programs")
        .doc(widget.docname)
        .update({'status': 'pending'});



    await fb.collection("history").doc(formattedDate).set(history.toMap());
    // customer program history updated
    await fb
        .collection("Customer")
        .doc(widget.custdocname)
        .collection("Programs")
        .doc(widget.docname)
        .collection("History")
        .doc(formattedDate)
        .set(custhistory.toMap());

    // Loading circle
    setState(() {
      _loading = false;
      _ismore = false;
      _isviz = false;
    });

        await fb
        .collection("Programs")
        .doc(widget.docname)
        .collection("AssignedPgm")
        .doc("Technician")
        .delete();

    await fb
        .collection("Technician")
        .doc(widget.username)
        .collection("Assignedpgm")
        .doc(widget.docname)
        .delete();
  }
}
