import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ideal_marketing/constants/profile.dart';
import 'package:ideal_marketing/screens/Technician/hometech.dart';

class CreateProfile extends StatefulWidget {
  CreateProfile({Key? key, required this.uid}) : super(key: key);
  String? uid;
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  //image upload
  late String imageUrl = "Empty";

  // form
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController phn1Controller = TextEditingController();
  final TextEditingController phn2Controller = TextEditingController();
  final TextEditingController locationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final usernamefield = TextFormField(
      autofocus: false,
      controller: usernameController,
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
        labelText: "Username",
        labelStyle: const TextStyle(fontFamily: "Nunito", fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
    //name field
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
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.centerLeft,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Create Profile",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
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
                          offset: const Offset(0, 10))
                    ],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/icons/avataricon.png")),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      usernamefield,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    // padding: const EdgeInsets.symmetric(horizontal: 50),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("CANCEL",
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      uploadData();
                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "SAVE",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return ("Feild Cannot be empty");
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: labelText,
          labelStyle: const TextStyle(fontFamily: "Nunito", fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void uploadData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    if (_formKey.currentState!.validate()) {
      Profile profile = Profile(
        uid: widget.uid,
        username: usernameController.text,
        name: nameController.text,
        designation: designationController.text,
        phn1: phn1Controller.text,
        phn2: phn2Controller.text,
        location: locationController.text,
      );

      await firebaseFirestore
          .collection("users")
          .doc("${widget.uid}")
          .collection("Profile")
          .doc("profile")
          .set(profile.toMap())
          .then((value) => print("Successfully created profile"))
          .catchError((error) => print("Failed to add user: $error"));

      await firebaseFirestore
          .collection("Technician")
          .doc(profile.username)
          .set(profile.toMap())
          .then((value) {
        print("admin");
        Fluttertoast.showToast(msg: "Profile Created Successfully");
      }).catchError((error) {
        print("Failed to add user: $error");
        Fluttertoast.showToast(msg: "Failed to create profile :( $error");
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeTech()));
      // assign all data

    }
  }
}
