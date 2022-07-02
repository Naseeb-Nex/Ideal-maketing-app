import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal_marketing/services/pgmhistory.dart';
import 'package:intl/intl.dart';

import 'package:ideal_marketing/constants/pendingpgmdata.dart';
import 'hometech.dart';

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
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 350,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: pclr,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "  ${widget.name}",
                              style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                const Text(
                                  "Address :",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "  ${widget.address}",
                                  style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                const Text(
                                  "Phone :",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "  ${widget.phn}",
                                  style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                const Text(
                                  "Location :",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "  ${widget.loc}",
                                  style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: const <Widget>[
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Program :",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "  ${widget.pgm}",
                                style: const TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Text(
                                      "Type :",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "  ${widget.type}",
                                      style: const TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "Date :",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "  ${widget.assigneddate}",
                                          style: const TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Time :",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "  ${widget.assignedtime}",
                                          style: const TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                const Text(
                                  "Collection Amount :",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "  ${widget.chrg}",
                                  style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
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
    String protime = DateFormat('kk:mm').format(now);
    String pcollname = DateFormat('MM d y').format(now);
    String pdocname = DateFormat('MM d y kk:mm:ss').format(now);

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
      status: "completed",
      username: widget.username,
      techname: widget.techname,
      priority: widget.priority,
      assigneddate: widget.assigneddate,
      assignedtime: widget.assignedtime,
      remarks: reason.text,
      pdate: prodate,
      ptime: protime,
      pcollname: pcollname,
      pdocname: pdocname,
    );

    Pgmhistory history = Pgmhistory(
        name: widget.name,
        address: widget.address,
        loc: widget.loc,
        phn: widget.phn,
        pgm: widget.pgm,
        chrg: widget.chrg,
        type: widget.type,
        remarks: reason.text,
        upDate: prodate,
        upTime: protime,
        techname: widget.techname,
        prospec: widget.prospec,
        instadate: widget.instadate,
        docname: pdocname,
        status: "pro",
        ch: "Program in processing");

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
          print("Pending pgmlist Updated");
        }).catchError(
                (error) => print("Failed to update Pending pgm list : $error"));

        fb
            .collection("Programs")
            .doc(widget.docname)
            .delete()
            .then((value) => print("Pgm Deleted From office list"))
            .catchError((error) =>
                print("Failed to delete from office list program : $error"));

        fb.collection("history").doc(pdocname).set(history.toMap());

        fb
            .collection("Technician")
            .doc(widget.username)
            .collection("Assignedpgm")
            .doc(widget.docname)
            .delete()
            .then((value) {
          print("Delete pgm to technicain");
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
      child: Container(
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
