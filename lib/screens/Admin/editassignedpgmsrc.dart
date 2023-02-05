import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/screens/Admin/homeadminsrc.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal_marketing/constants/profile.dart';
import 'package:ideal_marketing/services/customer_history.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

// ignore: must_be_immutable
class Editassignedpgm extends StatefulWidget {
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

  Editassignedpgm({
    Key? key,
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
  _EditassignedpgmState createState() => _EditassignedpgmState();
}

class _EditassignedpgmState extends State<Editassignedpgm> {
  Profile profile = Profile();
  FirebaseFirestore fb = FirebaseFirestore.instance;
  // form
  final _formKey = GlobalKey<FormState>();
  String? _selectedcategory;

  // editing controller
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController pgmController = TextEditingController();
  TextEditingController collectionController = TextEditingController();

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> categorylist = [
      "Follow Up Service",
      "Collection",
      "Installation",
      "Service",
      "Other"
    ];
    return categorylist
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    nameController.text = "${widget.name}";
    addressController.text = "${widget.address}";
    locController.text = "${widget.loc}";
    phnController.text = "${widget.phn}";
    pgmController.text = "${widget.pgm}";
    collectionController.text = "${widget.chrg}";
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    final categoryselector = InputDecorator(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.more_vert_sharp),
        contentPadding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        hintText: "Category",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: _selectedcategory,
          items: _dropDownItem(),
          onChanged: (value) {
            setState(() {
              _selectedcategory = value as String?;
            });
          },
          hint: const Text("Select Category"),
          elevation: 10,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
          icon: const Icon(Icons.arrow_drop_down_circle),
          iconDisabledColor: Colors.grey,
          iconEnabledColor: const Color(0xFFfaa307),
          isExpanded: true,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: primarybg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(parent: BouncingScrollPhysics()),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: s.width * 0.12,
                        height: s.width * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFF3F5F7),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xFFfaa307),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Edit Assigned Program",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFfaa307)),
                    ),
                  )
                ],
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              Divider(),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(parent: ScrollPhysics()),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: s.height * 0.7,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              right: s.width * 0.01),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Full Name",
                                                style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              TextField(
                                                autofocus: false,
                                                controller: nameController,
                                                enabled: false,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          8.0, 5.0, 5.0, 5.0),
                                                  filled: true,
                                                  fillColor:
                                                      const Color(0XFFe5e6e4),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              left: s.width * 0.01),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Address",
                                                style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              TextField(
                                                autofocus: false,
                                                controller: addressController,
                                                enabled: false,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          8.0, 5.0, 5.0, 5.0),
                                                  filled: true,
                                                  fillColor:
                                                      const Color(0XFFe5e6e4),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 5.0,
                                            bottom: 5.0,
                                            right: s.width * 0.01),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Location",
                                              style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextFormField(
                                              autofocus: false,
                                              controller: locController,
                                              keyboardType: TextInputType.text,
                                              onSaved: (value) {
                                                locController.text = value!;
                                              },
                                              textInputAction:
                                                  TextInputAction.next,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ("Location field Can't be empty!");
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        8.0, 5.0, 5.0, 5.0),
                                                filled: true,
                                                fillColor:
                                                    const Color(0XFFfbfefb),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 5.0,
                                            bottom: 5.0,
                                            left: s.width * 0.01),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Phone Number",
                                              style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextFormField(
                                              autofocus: false,
                                              controller: phnController,
                                              keyboardType: TextInputType.phone,
                                              onSaved: (value) {
                                                phnController.text = value!;
                                              },
                                              textInputAction:
                                                  TextInputAction.next,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ("Please Enter Phone Number");
                                                } else if (value.length != 10) {
                                                  return ("invalid Phone Number");
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        8.0, 5.0, 5.0, 5.0),
                                                filled: true,
                                                fillColor:
                                                    const Color(0XFFfbfefb),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Program",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        autofocus: false,
                                        controller: pgmController,
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          pgmController.text = value!;
                                        },
                                        textInputAction: TextInputAction.next,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return ("Please enter the Program!");
                                          }
                                          return null;
                                        },
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              8.0, 10.0, 5.0, 5.0),
                                          filled: true,
                                          fillColor: const Color(0XFFfbfefb),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 5.0,
                                            bottom: 5.0,
                                            right: s.width * 0.01),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Collection Amount",
                                              style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextFormField(
                                              autofocus: false,
                                              controller: collectionController,
                                              keyboardType: TextInputType.text,
                                              onSaved: (value) {
                                                collectionController.text =
                                                    value!;
                                              },
                                              textInputAction:
                                                  TextInputAction.next,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ("Please enter collection Amount");
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        8.0, 2.0, 2.0, 2.0),
                                                filled: true,
                                                fillColor:
                                                    const Color(0XFFfbfefb),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 5.0,
                                            bottom: 5.0,
                                            left: s.width * 0.01),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Category",
                                              style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            categoryselector
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: s.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: 120,
                                  height: s.height * 0.06,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: cheryred,
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            color: black.withOpacity(0.2),
                                            offset: const Offset(0, 3))
                                      ]),
                                  child: Center(
                                      child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () => upEditedData(),
                                child: Container(
                                  width: 120,
                                  height: s.height * 0.06,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: limegreen,
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            color: black.withOpacity(0.2),
                                            offset: const Offset(0, 3))
                                      ]),
                                  child: Center(
                                      child: Text(
                                    "Update",
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> upEditedData() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM d y kk:mm:ss').format(now);
    String assigneddate = DateFormat('d MM y').format(now);
    String assignedtime = DateFormat('h:mma').format(now);

    CustomerPgmHistory custhistory = CustomerPgmHistory(
        upDate: assigneddate,
        upTime: assignedtime,
        msg: "Assigned Program updated By Admin",
        techname: widget.techname,
        status: "editted",
        docname: formattedDate,
        custdocname: widget.custdocname);

    if (_formKey.currentState!.validate() && _selectedcategory != null) {
    // Loading circle
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(
                color: bluebg,
              ),
            );
          });

      // Update the Program status
      fb.collection("Programs").doc(widget.docname).update({
        'loc': locController.text,
        'phn': phnController.text,
        'pgm': pgmController.text,
        'chrg': collectionController.text,
        'type': _selectedcategory,
        'status': 'assigned',
        'techname': '${widget.techname}',
        'techuname': '${widget.username}'
      });

      // Updating the Customer program data with new data
      await fb
          .collection("Customer")
          .doc(widget.custdocname)
          .collection("Programs")
          .doc(widget.docname)
          .update({
        'loc': locController.text,
        'phn': phnController.text,
        'pgm': pgmController.text,
        'chrg': collectionController.text,
        'type': _selectedcategory,
      });

      // Update data in tech assigned pgm
      await fb
          .collection("Technician")
          .doc(widget.username)
          .collection("Assignedpgm")
          .doc(widget.docname)
          .update({
        'loc': locController.text,
        'phn': phnController.text,
        'pgm': pgmController.text,
        'chrg': collectionController.text,
        'type': _selectedcategory,
      });

      // customer program history updated
      await fb
          .collection("Customer")
          .doc(widget.custdocname)
          .collection("Programs")
          .doc(widget.docname)
          .collection("History")
          .doc(formattedDate)
          .set(custhistory.toMap());

      Navigator.of(context).pop();
      PanaraInfoDialog.show(
        context,
        title: "Success!",
        message: "Your update was completed Successfully :)",
        buttonText: "Okay",
        onTapDismiss: () {
          Navigator.pop(context);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeAdmin()));
        },
        panaraDialogType: PanaraDialogType.success,
        barrierDismissible: false,
        textColor: Color(0XFF727272),
      );
    } else {
      PanaraInfoDialog.show(
        context,
        title: "Oops",
        message: "Please verify feilds and Category",
        buttonText: "Okay",
        onTapDismiss: () {
          Navigator.pop(context);
        },
        panaraDialogType: PanaraDialogType.error,
        barrierDismissible: false,
        textColor: Color(0XFF727272),
      );
    }
  }
}
