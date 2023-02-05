import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ideal_marketing/constants/profile.dart';
import 'package:ideal_marketing/components/alertbox.dart';

// ignore: must_be_immutable
class Editprofile extends StatefulWidget {
  String? name;
  String? uid;
  String? username;
  String? des;
  String? loc;
  String? phn1;
  String? phn2;

  Editprofile(
      {Key? key,
      this.name,
      this.uid,
      this.username,
      required this.des,
      required this.loc,
      required this.phn1,
      required this.phn2})
      : super(key: key);

  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
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
    nameController.text = "${widget.name}";
    designationController.text = "${widget.des}";
    phn1Controller.text = "${widget.phn1}";
    phn2Controller.text = "${widget.phn2}";
    locationController.text = "${widget.loc}";
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: s.width,
                height: s.height * 0.06,
                color: white,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: bluebg,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: bluebg,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 10))
                    ],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/icons/avataricon.png")),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        color: secondbg.withOpacity(0.20),
                      ),
                    ],
                  ),
                  child: Text(
                    "${widget.name} 's Profile",
                    style: const TextStyle(
                        fontFamily: "Montserrat",
                        color: bluebg,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          namefield,
                          const SizedBox(
                            height: 35,
                          ),
                          designationfield,
                          const SizedBox(
                            height: 35,
                          ),
                          phn1field,
                          const SizedBox(
                            height: 35,
                          ),
                          phn2field,
                          const SizedBox(
                            height: 35,
                          ),
                          locationfield,
                          const SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: s.height * 0.15),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: s.width * 0.1, vertical: 15),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 10,
                              color: secondbg.withOpacity(0.20),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red[400]),
                      child: const Text("CANCEL",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black)),
                    ),
                  ),
                  InkWell(
                    onTap: uploadData,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: s.width * 0.1, vertical: 15),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 10,
                              color: secondbg.withOpacity(0.20),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green[400]),
                      child: const Text(
                        "SAVE",
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: s.height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }

  void uploadData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    if (_formKey.currentState!.validate()) {
      setState(() {
        _upload = true;
      });

      await firebaseFirestore
          .collection("users")
          .doc("${widget.uid}")
          .collection("Profile")
          .doc("profile")
          .update({
            'name': nameController.text,
            'designation': designationController.text,
            'phn1': phn1Controller.text,
            'phn2': phn2Controller.text,
            'location': locationController.text
          })
          .then((value) => print("Successfully UPdated profile"))
          .catchError((error) => print("Failed to add user: $error"));

      await firebaseFirestore
          .collection("Technician")
          .doc(widget.username)
          .update({
        'name': nameController.text,
        'designation': designationController.text,
        'phn1': phn1Controller.text,
        'phn2': phn2Controller.text,
        'location': locationController.text,
      }).then((value) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomeAlertbx("Technician Profile Updation Completed!",
                  Colors.greenAccent, "Sucessfull", widget.username);
            });
        setState(() {
          _upload = false;
        });
      }).catchError((error) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomeAlertbx("Something went Wrong, Try again!",
                  Colors.redAccent, "Error", widget.username);
            });
      });
    }
  }
}
