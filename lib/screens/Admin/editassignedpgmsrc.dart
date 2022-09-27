import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal_marketing/constants/profile.dart';

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
  bool _upload = false;
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
    collectionController.text = "${widget.pgm}";
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
          hint: const Text("Category"),
          elevation: 12,
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
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
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
                    child: SizedBox(
                      height: s.height * 0.75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      Container(
                                        height: 40,
                                        child: TextField(
                                          autofocus: false,
                                          controller: nameController,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                8.0, 5.0, 5.0, 5.0),
                                            filled: true,
                                            fillColor: const Color(0XFFe5e6e4),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
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
                                        "Address",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 40,
                                        child: TextField(
                                          autofocus: false,
                                          controller: addressController,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                8.0, 5.0, 5.0, 5.0),
                                            filled: true,
                                            fillColor: const Color(0XFFe5e6e4),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Container(
                                      height: 40,
                                      child: TextField(
                                        autofocus: false,
                                        controller: locController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              8.0, 5.0, 5.0, 5.0),
                                          filled: true,
                                          fillColor: const Color(0XFFfbfefb),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Container(
                                      height: 40,
                                      child: TextField(
                                        autofocus: false,
                                        controller: phnController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              8.0, 5.0, 5.0, 5.0),
                                          filled: true,
                                          fillColor: const Color(0XFFfbfefb),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                maxLines: 5,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(8.0, 5.0, 5.0, 5.0),
                                  filled: true,
                                  fillColor: const Color(0XFFfbfefb),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
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
                                    Container(
                                      height: 40,
                                      child: TextField(
                                        autofocus: false,
                                        controller: collectionController,
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
                                    Container(
                                        height: 40,
                                        child: categoryselector)
                                  ],
                                ),
                              ),
                            )
                          ]),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(20),
                                    color: cheryred,
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        color: black.withOpacity(0.2),
                                        offset: const Offset(0, 3)
                                      )
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
                              Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(20),
                                    color: limegreen,
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        color: black.withOpacity(0.2),
                                        offset: const Offset(0, 3)
                                      )
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
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
