import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal_marketing/services/customer_history.dart';
import 'package:ideal_marketing/services/pgmhistory.dart';
import 'package:ideal_marketing/services/reportdata.dart';
import 'package:ideal_marketing/services/reportstatus.dart';
import 'package:ideal_marketing/services/techhistory.dart';
import 'package:intl/intl.dart';

import 'package:ideal_marketing/constants/pendingpgmdata.dart';
import 'hometech.dart';

// ignore: must_be_immutable
class Processingsrc extends StatefulWidget {
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

  Processingsrc({
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
  _ProcessingsrcState createState() => _ProcessingsrcState();
}

class _ProcessingsrcState extends State<Processingsrc> {
  bool _value = false;
  bool _err = false;
  bool _upload = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController reason = TextEditingController();

  // Random Images setup
  var random = Random();
  List<String> custimg = [
    "assets/icons/customer1.jpg",
    "assets/icons/customer2.jpg",
    "assets/icons/customer3.png"
  ];

  @override
  Widget build(BuildContext context) {
    int num = random.nextInt(100);
    int loc = num % 3;

    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: newbg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 50,
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.arrow_back_sharp,
                              size: 30,
                              color: pclr,
                            ),
                          ),
                        ),
                        const Text(
                          "Processing Programs",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: pclr,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                          width: 50,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(s.width * 0.02),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFFc0d5ff),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  color: Colors.black.withOpacity(0.13),
                                  offset: const Offset(0, 3))
                            ]),
                        padding: EdgeInsets.symmetric(
                            horizontal: s.width * 0.01, vertical: 30),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: s.width * 0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Circular avatar with name and address
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: s.width * 0.2,
                                    width: s.width * 0.2,
                                    child: CircleAvatar(
                                        backgroundColor: Color(0Xffffe6a7),
                                        backgroundImage:
                                            AssetImage("${custimg[loc]}")),
                                  ),
                                  SizedBox(
                                    width: s.width * 0.02,
                                  ),
                                  Container(
                                    width: s.width * 0.66,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: s.width * 0.08,
                                        ),
                                        Text(
                                          "${widget.name}",
                                          style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "${widget.address}",
                                          style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Location :",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "  ${widget.loc}",
                                      style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        // fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Program :",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${widget.pgm}",
                                      style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Collection Amount :",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFd7e3fc),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    child: Text(
                                      "${widget.chrg}",
                                      style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 14,
                                        // fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Product Specification :",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${widget.prospec}",
                                      style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Installation Date :",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "  ${widget.instadate}",
                                      style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFd7e3fc),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "${widget.type}",
                                      style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "${widget.assigneddate}",
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "${widget.assignedtime}",
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 130,
                                alignment: Alignment.topCenter,
                                child: const Text(
                                  "Remarks :",
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: 130,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: reason,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 6,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Enter the Remarks!!");
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    reason.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: "Enter the Reason",
                                    hintStyle: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 15,
                                    ),
                                    focusColor: Colors.green,
                                    hoverColor: bluebg,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _value = !_value;
                        });
                      },
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: _value
                                    ? const Icon(
                                        Icons.check,
                                        size: 20.0,
                                        color: Colors.greenAccent,
                                      )
                                    : null),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "Verify the Details",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: _err
                          ? const Text(
                              "please verify the details then check the box",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            )
                          : null,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () => processingupdate(),
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: pclr),
                        child: const Center(
                          child: Text(
                            "Upload Details",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.redAccent),
                        child: const Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: _upload
                      ? const CircularProgressIndicator(
                          color: bluebg,
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void processingupdate() async {
    FirebaseFirestore fb = FirebaseFirestore.instance;
    DateTime now = DateTime.now();
    String prodate = DateFormat('d MMM y').format(now);
    String protime = DateFormat('h:mma').format(now);
    String pcollname = DateFormat('MM d y').format(now);
    String pdocname = DateFormat('MM d y kk:mm:ss').format(now);
    String monthdoc = DateFormat('MM y').format(now);

    // Daily report docname
    String daydoc = DateFormat('kk:mm:ss').format(now);

    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    Pendingpgmdata ppgm = Pendingpgmdata(
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
      status: "processing",
      username: widget.username,
      techname: widget.techname,
      priority: widget.priority,
      assigneddate: widget.assigneddate,
      assignedtime: widget.assignedtime,
      custdocname: widget.custdocname,
      prospec: widget.prospec,
      instadate: widget.instadate,
      remarks: reason.text,
      pdate: prodate,
      ptime: protime,
      pcollname: pcollname,
      pdocname: pdocname,
    );

    // report data
    Reportdata rpdata = Reportdata(
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
      status: "processing",
      username: widget.username,
      techname: widget.techname,
      priority: widget.priority,
      assigneddate: widget.assigneddate,
      assignedtime: widget.assignedtime,
      remarks: reason.text,
      cdate: prodate,
      ctime: protime,
      custdocname: widget.custdocname,
      rpdocname: pdocname,
    );

    // Daily report status
    Reportstatus dayrpdata = Reportstatus(
      name: widget.name,
      pgm: widget.pgm,
      techname: widget.techname,
      docname: "${widget.techname} $daydoc",
      phn: widget.phn,
      status: "processing",
      upDate: prodate,
      upTime: protime,
      day: day,
      month: month,
      username: widget.username,
      more: pdocname,
    );

    // Montly reports status
    Reportstatus monthrpdata = Reportstatus(
      name: widget.name,
      pgm: widget.pgm,
      techname: widget.techname,
      docname: "${widget.techname} $daydoc",
      phn: widget.phn,
      status: "completed",
      upDate: prodate,
      upTime: protime,
      day: day,
      month: month,
      username: widget.username,
      more: pdocname,
    );

    //customer program history
    CustomerPgmHistory custhistory = CustomerPgmHistory(
        upDate: prodate,
        upTime: protime,
        msg: "${widget.techname} Changed to Processing List",
        remarks: reason.text,
        techname: widget.techname,
        status: "processing",
        docname: pdocname,
        custdocname: widget.custdocname);

    if (_formKey.currentState!.validate()) {
      if (_value == true) {
        setState(() {
          _err = false;
          _upload = true;
        });

        fb
            .collection("Technician")
            .doc(widget.username)
            .collection("Processingpgm")
            .doc(pdocname)
            .set(ppgm.toMap())
            .then((value) {
          print("Processing pgmlist Updated");
        }).catchError(
                (error) => print("Failed to update Pending pgm list : $error"));

        // Report session

        // Update the reportdata
        await fb
            .collection("Reports")
            .doc(year)
            .collection("Month")
            .doc(month)
            .collection(day)
            .doc("Tech")
            .collection("${widget.username}")
            .doc(pdocname)
            .set(rpdata.toMap());

        // Update the dayily report data
        await fb
            .collection("Reports")
            .doc(year)
            .collection("Month")
            .doc(month)
            .collection(day)
            .doc("summary")
            .collection("all")
            .doc("${widget.techname} $daydoc")
            .set(dayrpdata.toMap());

        // Daily counter update
        await fb
            .collection("Reports")
            .doc(year)
            .collection("Month")
            .doc(month)
            .collection(day)
            .doc("Counter")
            .get()
            .then(
          (DocumentSnapshot doc) {
            if (!doc.exists) {
              fb
                  .collection("Reports")
                  .doc(year)
                  .collection("Month")
                  .doc(month)
                  .collection(day)
                  .doc("Counter")
                  .set({'processing': 1}, SetOptions(merge: true));
            } else {
              fb
                  .collection("Reports")
                  .doc(year)
                  .collection("Month")
                  .doc(month)
                  .collection(day)
                  .doc("Counter")
                  .update({'processing': FieldValue.increment(1)});
            }
          },
          onError: (e) => print("Processing Counter update Error: $e"),
        );

        // Update the montly report data
        await fb
            .collection("Reports")
            .doc(year)
            .collection("Month")
            .doc(month)
            .collection("summary")
            .doc("${widget.techname} $pdocname")
            .set(monthrpdata.toMap());

        // Update the monthly counter Report
        await fb
            .collection("Reports")
            .doc(year)
            .collection("Month")
            .doc(month)
            .get()
            .then(
          (DocumentSnapshot doc) {
            if (!doc.exists) {
              fb
                  .collection("Reports")
                  .doc(year)
                  .collection("Month")
                  .doc(month)
                  .set({'processing': 1}, SetOptions(merge: true));
            } else {
              fb
                  .collection("Reports")
                  .doc(year)
                  .collection("Month")
                  .doc(month)
                  .update({'processing': FieldValue.increment(1)});
            }
          },
          onError: (e) => print("processing Counter update Error: $e"),
        );

        // Report session end

        // Tech perfromance Counter

        fb
            .collection("Technician")
            .doc(widget.username)
            .collection("Performance")
            .doc("Processing")
            .collection("Month")
            .doc(monthdoc)
            .get()
            .then(
          (DocumentSnapshot doc) {
            if (!doc.exists) {
              fb
                  .collection("Technician")
                  .doc(widget.username)
                  .collection("Performance")
                  .doc("Processing")
                  .collection("Month")
                  .doc(monthdoc)
                  .set({'count': 1});
            } else {
              fb
                  .collection("Technician")
                  .doc(widget.username)
                  .collection("Performance")
                  .doc("Processing")
                  .collection("Month")
                  .doc(monthdoc)
                  .update({'count': FieldValue.increment(1)});
            }
          },
          onError: (e) => print("Processing Counter updated: $e"),
        );

        // Updating the Customer program status
        fb
            .collection("Customer")
            .doc(widget.custdocname)
            .collection("Programs")
            .doc(widget.docname)
            .update({'status': 'processing'});

        fb.collection("Programs").doc(widget.docname).delete().catchError(
            (error) =>
                print("Failed to delete from office list program : $error"));

        fb
            .collection("Technician")
            .doc(widget.username)
            .collection("Assignedpgm")
            .doc(widget.docname)
            .delete()
            .then((value) {
          print("Delete pgm to technicain");

          // customer program history updated
          fb
              .collection("Customer")
              .doc(widget.custdocname)
              .collection("Programs")
              .doc(widget.docname)
              .collection("History")
              .doc(pdocname)
              .set(custhistory.toMap());

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomeAlertbx("Processing Program Updated",
                    Colors.greenAccent, "Sucessfull", widget.username);
              });
          setState(() {
            _upload = false;
          });
        }).catchError((error) {
          print("Failed to delete from technician list program : $error");
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomeAlertbx("Something went Wrong, Try again!",
                    Colors.redAccent, "Error", widget.username);
              });
        });
      } else {
        setState(() {
          _err = true;
        });
      }
    }
  }
}

class CustomeAlertbx extends StatelessWidget {
  String? username;
  final String? titles;
  final Color colorr;
  final String? done;
  CustomeAlertbx(this.titles, this.colorr, this.done, this.username);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: colorr,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        height: 200,
        width: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: primarybg,
                    size: 30,
                  ),
                  Text(
                    done!,
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              titles!,
              style: const TextStyle(
                fontFamily: "Nunito",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeTech()),
                );
              },
              color: Colors.white,
              child: Text(
                "Okay",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: colorr,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
