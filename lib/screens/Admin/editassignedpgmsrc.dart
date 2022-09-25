import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ideal_marketing/constants/profile.dart';
import 'package:ideal_marketing/components/alertbox.dart';

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

  // editing controller
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController phn1Controller = TextEditingController();
  TextEditingController phn2Controller = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // nameController.text = "${widget.name}";
    // designationController.text = "${widget.des}";
    // phn1Controller.text = "${widget.phn1}";
    // phn2Controller.text = "${widget.phn2}";
    // locationController.text = "${widget.loc}";
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    final namefield = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Feild Cannot be empty");
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Full Name",
        labelStyle: const TextStyle(fontFamily: "Nunito", fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //designation field
    final designationfield = TextFormField(
      autofocus: false,
      controller: designationController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        designationController.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your designation");
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Designation",
        labelStyle: const TextStyle(fontFamily: "Nunito", fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //phn2 field
    final phn2field = TextFormField(
      autofocus: false,
      controller: phn2Controller,
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        phn2Controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Personal Phone Number");
        } else if (value.length != 10) {
          return ("invalid Phone Number");
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Phone Number 2",
        labelStyle: const TextStyle(fontFamily: "Nunito", fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //phn1 field
    final phn1field = TextFormField(
      autofocus: false,
      controller: phn1Controller,
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        phn1Controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your Phone Number");
        } else if (value.length != 10) {
          return ("invalid Phone Number");
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Phone Number 1",
        labelStyle: const TextStyle(fontFamily: "Nunito", fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    //location field
    final locationfield = TextFormField(
      autofocus: false,
      controller: locationController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        locationController.text = value!;
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Home Location");
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Home Location",
        labelStyle: const TextStyle(fontFamily: "Nunito", fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: primarybg,
    );
  }
}
