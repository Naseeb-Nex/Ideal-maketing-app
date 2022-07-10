import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal_marketing/services/customer_history.dart';
import 'package:ideal_marketing/services/techhistory.dart';
import 'package:intl/intl.dart';

import 'package:ideal_marketing/constants/completepgmdata.dart';
import 'package:ideal_marketing/screens/Technician/hometech.dart';
import 'package:ideal_marketing/services/pgmhistory.dart';
import 'hometech.dart';

class Completedsrc extends StatefulWidget {
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

  Completedsrc({
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
  _CompletedsrcState createState() => _CompletedsrcState();
}

class _CompletedsrcState extends State<Completedsrc> {
  bool _value = false;
  bool _err = false;
  bool _upload = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController cost = TextEditingController();
  final TextEditingController remarks = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                              color: bluebg,
                            ),
                          ),
                        ),
                        const Text(
                          "Program Completion",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: bluebg,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                          width: 50,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        height: 130,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: bluebg),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.name}",
                              style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "${widget.address}",
                              style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              "${widget.phn}",
                              style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Collection amount :",
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${widget.chrg}",
                                  style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Collected Amount :",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 160,
                                height: 50,
                                child: TextFormField(
                                    autofocus: false,
                                    controller: cost,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Collection Amount!!");
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      cost.text = value!;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.attach_money_outlined,
                                        color: Colors.green,
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          20, 15, 20, 15),
                                      hintText: "Collection",
                                      focusColor: Colors.green,
                                      hoverColor: bluebg,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Row(
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.74,
                                  height: 130,
                                  child: TextFormField(
                                    autofocus: false,
                                    controller: remarks,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 6,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Enter the Remarks!!");
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      remarks.text = value!;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      hintText: "Remarks",
                                      focusColor: Colors.green,
                                      hoverColor: bluebg,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
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
                            width: 40,
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
                            width: 10,
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
                            : null),
                    const SizedBox(
                      height: 35,
                    ),
                    InkWell(
                      onTap: () => detailsup(),
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.greenAccent),
                        child: const Center(
                          child: Text(
                            "Completed",
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void detailsup() async {
    FirebaseFirestore fb = FirebaseFirestore.instance;
    DateTime now = DateTime.now();
    String completeddate = DateFormat('d MMM y').format(now);
    String completedtime = DateFormat('kk:mm').format(now);
    String ccollname = DateFormat('MM d y').format(now);
    String cdocname = DateFormat('MM d y kk:mm:ss').format(now);
    String mcollname = DateFormat('MM y').format(now);
    String ycollname = DateFormat('y').format(now);

    Completepgmdata cpgm = Completepgmdata(
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
      status: "completed",
      username: widget.username,
      techname: widget.techname,
      priority: widget.priority,
      assigneddate: widget.assigneddate,
      assignedtime: widget.assignedtime,
      camount: cost.text,
      remarks: remarks.text,
      cdate: completeddate,
      ctime: completedtime,
      ccollname: ccollname,
      cdocname: cdocname,
      mcollname: mcollname,
      ycollname: ycollname,
    );

    Pgmhistory history = Pgmhistory(
        name: widget.name,
        address: widget.address,
        loc: widget.loc,
        phn: widget.phn,
        pgm: widget.pgm,
        chrg: widget.chrg,
        type: widget.type,
        collection: cost.text,
        remarks: remarks.text,
        upDate: completeddate,
        upTime: completeddate,
        techname: widget.techname,
        prospec: widget.prospec,
        instadate: widget.instadate,
        docname: cdocname,
        status: "completed",
        ch: "Program Completed");

    Techhistory techhis = Techhistory(
      name: widget.name,
      loc: widget.loc,
      pgm: widget.pgm,
      chrg: widget.chrg,
      collection: cost.text,
      remarks: remarks.text,
      upDate: completeddate,
      upTime: completedtime,
      username: widget.username,
      docname: cdocname,
      status: "completed",
    );

    //customer program history
    CustomerPgmHistory custhistory = CustomerPgmHistory(
        upDate: completeddate,
        upTime: completedtime,
        msg: "${widget.techname} completed the Program",
        remarks: remarks.text,
        techname: widget.techname,
        status: "completed",
        camount: cost.text,
        docname: cdocname,
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
            .collection("Completedpgm")
            .doc("Day")
            .collection(ccollname)
            .doc(cdocname)
            .set(cpgm.toMap())
            .then((value) {
          print("Daylist Updated");
        }).catchError((error) => print("Failed to update Daily list : $error"));

        // Updating the Customer program status
        fb
            .collection("Customer")
            .doc(widget.custdocname)
            .collection("Programs")
            .doc(widget.docname)
            .set({'status': 'completed', 'camount': cost.text},
                SetOptions(merge: true));

        fb
            .collection("Technician")
            .doc(widget.username)
            .collection("Completedpgm")
            .doc("Month")
            .collection(mcollname)
            .doc(cdocname)
            .set(cpgm.toMap())
            .then((value) {
          print("Monthly list Updated");
        }).catchError(
                (error) => print("Failed to update Monthilylist : $error"));

        fb
            .collection("Completedpgm")
            .doc("Day")
            .collection(ccollname)
            .doc(cdocname)
            .set(cpgm.toMap())
            .then((value) {
          print("Daylist Updated");
        }).catchError((error) => print("Failed to update Daily list : $error"));

        // customer program history updated
        fb
            .collection("Customer")
            .doc(widget.custdocname)
            .collection("Programs")
            .doc(widget.docname)
            .collection("History")
            .doc(cdocname)
            .set(custhistory.toMap());

        fb
            .collection("Completedpgm")
            .doc("Month")
            .collection(mcollname)
            .doc(cdocname)
            .set(cpgm.toMap())
            .then((value) {
          print("Monthly list Updated");
        }).catchError(
                (error) => print("Failed to update Monthilylist : $error"));

        // history of the technician
        fb
            .collection("Programs")
            .doc(widget.docname)
            .delete()
            .then((value) => fb.collection("Technician").doc(widget.username).collection("History").doc(cdocname).set(techhis.toMap()))
            .catchError((error) =>
                print("Failed to delete from office list program : $error"));

        fb.collection("history").doc(cdocname).set(history.toMap());

        fb
            .collection("Technician")
            .doc(widget.username)
            .collection("Assignedpgm")
            .doc(widget.docname)
            .delete()
            .then((value) {
          setState(() {
            _upload = false;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomeAlertbx("Program Registration Completed!",
                    Colors.greenAccent, "Sucessfull", widget.username);
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
                  MaterialPageRoute(
                      builder: (context) => HomeTech(
                            username: username,
                          )),
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
