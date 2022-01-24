import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/constants/profile.dart';
import 'package:ideal_marketing/screens/Technician/hometech.dart';
import 'package:ideal_marketing/services/user_model.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfile extends StatefulWidget {
  CreateProfile({Key? key, required this.uid}) : super(key: key);
  String? uid;
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  //image upload
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  late String imageUrl = "Empty";

  // form
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController designationController =
      new TextEditingController();
  final TextEditingController phn1Controller = new TextEditingController();
  final TextEditingController phn2Controller = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();

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
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Username",
        labelStyle: TextStyle(fontFamily: "Nunito", fontSize: 14),
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
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Full Name",
        labelStyle: TextStyle(fontFamily: "Nunito", fontSize: 14),
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
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Designation",
        labelStyle: TextStyle(fontFamily: "Nunito", fontSize: 14),
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
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Phone Number 2",
        labelStyle: TextStyle(fontFamily: "Nunito", fontSize: 14),
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
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Phone Number 1",
        labelStyle: TextStyle(fontFamily: "Nunito", fontSize: 14),
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
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Home Location",
        labelStyle: TextStyle(fontFamily: "Nunito", fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
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
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Create Profile",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
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
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: _imageFile == null
                                // ? const AssetImage("assets/icons/avataricon.png")
                                // : AssetImage("assets/icons/up.png"),
                                // : FileImage(File(_imageFile.path)),
                                ? NetworkImage(
                                    "https://www.w3schools.com/howto/img_avatar.png")
                                : NetworkImage(imageUrl)),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()),
                              );
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      usernamefield,
                      SizedBox(
                        height: 35,
                      ),
                      namefield,
                      SizedBox(
                        height: 35,
                      ),
                      designationfield,
                      SizedBox(
                        height: 35,
                      ),
                      phn1field,
                      SizedBox(
                        height: 35,
                      ),
                      phn2field,
                      SizedBox(
                        height: 35,
                      ),
                      locationfield,
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("CANCEL",
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
                    child: Text(
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
              SizedBox(
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
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          labelText: labelText,
          labelStyle: TextStyle(fontFamily: "Nunito", fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  label: Text("Camera"),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  label: Text("Gallery"),
                ),
              ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final _firebasein = FirebaseStorage.instance;
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
    if (_imageFile!.path != null) {
      var file = File(_imageFile!.path);
      //Upload to Firebase
      var snapshot = await _firebasein
          .ref()
          .child('Technician/Profile/' + nameController.text)
          .putFile(file);

      var downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
      });
    }
  }

  void uploadData() async {
    final _firebasein = FirebaseStorage.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    if (_formKey.currentState!.validate()) {
      if (imageUrl != "Empty") {
        Profile profile = Profile(
            uid: widget.uid,
            username: usernameController.text,
            name: nameController.text,
            designation: designationController.text,
            phn1: phn1Controller.text,
            phn2: phn2Controller.text,
            location: locationController.text,
            profilepic: imageUrl);

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
      } else {
        print('Select your profile pic');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Errorimg("Please select your profile pic!");
            });
      }

      // assign all data

    }
  }
}

class Errorimg extends StatelessWidget {
  final title;
  Errorimg(this.title);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.redAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 230,
        width: MediaQuery.of(context).size.width - 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: primarybg,
                    size: 30,
                  ),
                  Text(
                    " Error",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 28,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.white,
              child: Text(
                "Okay",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
