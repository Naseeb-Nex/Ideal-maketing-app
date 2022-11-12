import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/programcard.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/constants/profile.dart';
import 'package:ideal_marketing/screens/Technician/Createprofile.dart';
import 'package:ideal_marketing/screens/Technician/profilesrc.dart';
// Loading indicator
import "package:loading_indicator/loading_indicator.dart";

import 'package:ideal_marketing/services/user_model.dart';

import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class HomeTech extends StatefulWidget {
  HomeTech({
    Key? key,
  }) : super(key: key);

  @override
  _HomeTechState createState() => _HomeTechState();
}

class _HomeTechState extends State<HomeTech> {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore fb = FirebaseFirestore.instance;

  UserModel loggedInUser = UserModel();
  Profile profile = Profile();
  String? name;
  String? username;
  int pgm_size = -1;

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users/${user!.uid}/Profile")
        .doc("profile")
        .get()
        .then((value) {
      profile = Profile.fromMap(value.data());
      setState(() {
        name = profile.name;
        username = profile.username;
      });
    });
  }

  // report visiblity
  bool rp_viz = false;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Stack(fit: StackFit.expand, children: [
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(38, 0, 91, 1),
              Color.fromRGBO(55, 48, 255, 1),
            ],
            begin: FractionalOffset.center,
            end: FractionalOffset.topCenter,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Drawer(
            backgroundColor: Color(0XFF403795),
            child: Builder(
              builder: (context) => SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: s.height * 0.2,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.only(
                          //   bottomLeft: Radius.circular(20),
                          //   bottomRight: Radius.circular(20),
                          // ),
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage("assets/icons/drawyerbg.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(s.height * 0.01),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/tech_avatar1.png",
                                height: s.height * 0.12,
                              ),
                              Center(
                                child: Text(
                                  "$name",
                                  style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Navigation List

                      Padding(
                        padding: EdgeInsets.only(
                            left: s.width * 0.04,
                            right: s.width * 0.1,
                            bottom: s.height * 0.03,
                            top: s.height * 0.03),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(s.width * 0.02),
                              child: InkWell(
                                onTap: () => Scaffold.of(context).closeDrawer(),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Iconsax.home,
                                        color: white,
                                      ),
                                      SizedBox(
                                        width: s.width * 0.04,
                                      ),
                                      Text(
                                        "Home",
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(s.width * 0.02),
                              child: InkWell(
                                onTap: () {
                                  Scaffold.of(context).closeDrawer();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profilewrapper(
                                              name: profile.name,
                                              uid: loggedInUser.uid,
                                              username: user?.photoURL,
                                            )),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Iconsax.personalcard,
                                        color: white,
                                      ),
                                      SizedBox(
                                        width: s.width * 0.04,
                                      ),
                                      Text(
                                        "Profile",
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(s.width * 0.02),
                              child: InkWell(
                                onTap: () {
                                  Scaffold.of(context).closeDrawer();
                                  if (pgm_size == -1) {
                                    // something is wrong
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                s.width * 0.02,
                                                            vertical:
                                                                s.width * 0.02),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Something went wrong :(",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                                0XFF607cf2),
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                        Text(
                                                          "try again later?",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                                0XFF607cf2),
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            color: white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                offset:
                                                                    const Offset(
                                                                        2, 4),
                                                                blurRadius: 20,
                                                                color: secondbg
                                                                    .withOpacity(
                                                                        0.23),
                                                              ),
                                                            ],
                                                          ),
                                                          clipBehavior:
                                                              Clip.hardEdge,
                                                          child: Image.asset(
                                                              "assets/icons/something_w.jpg"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ));
                                  }
                                  if (pgm_size == 0) {
                                    print("report screen");
                                  }
                                  if (pgm_size > 0) {
                                    print("complete all pgm assigned");
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                s.width * 0.02,
                                                            vertical:
                                                                s.width * 0.02),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "You have more work to do",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                                0XFF9bdffe),
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            color: white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                offset:
                                                                    const Offset(
                                                                        2, 4),
                                                                blurRadius: 20,
                                                                color: secondbg
                                                                    .withOpacity(
                                                                        0.23),
                                                              ),
                                                            ],
                                                          ),
                                                          clipBehavior:
                                                              Clip.hardEdge,
                                                          child: Image.asset(
                                                              "assets/icons/not_completed.jpg"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ));
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Iconsax.receipt,
                                        color: white,
                                      ),
                                      SizedBox(
                                        width: s.width * 0.04,
                                      ),
                                      Text(
                                        "Report status",
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(s.width * 0.02),
                              child: InkWell(
                                onTap: () {
                                  Scaffold.of(context).closeDrawer();
                                  showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: s.height * 0.03,
                                                  horizontal: s.width * 0.02),
                                              child: FutureBuilder<
                                                  DocumentSnapshot>(
                                                future: fb
                                                    .collection("Technician")
                                                    .doc(username)
                                                    .collection("Vehicle")
                                                    .doc("vehicle")
                                                    .get(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<
                                                            DocumentSnapshot>
                                                        snapshot) {
                                                  if (snapshot.hasError) {
                                                    return Text(
                                                        "Something went wrong");
                                                  }

                                                  if (snapshot.hasData &&
                                                      !snapshot.data!.exists) {
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      s.width *
                                                                          0.02,
                                                                  vertical:
                                                                      s.width *
                                                                          0.02),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "No Vehicle Assigned",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .blueGrey),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25),
                                                                  color: white,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      offset:
                                                                          const Offset(
                                                                              2,
                                                                              4),
                                                                      blurRadius:
                                                                          20,
                                                                      color: secondbg
                                                                          .withOpacity(
                                                                              0.23),
                                                                    ),
                                                                  ],
                                                                ),
                                                                clipBehavior:
                                                                    Clip.hardEdge,
                                                                child: Image.asset(
                                                                    "assets/icons/empty_garage.jpg"),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }

                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    Map<String, dynamic> data =
                                                        snapshot.data!.data()
                                                            as Map<String,
                                                                dynamic>;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Vehicle Status",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: bluebg),
                                                        ),
                                                        SizedBox(height: 10),
                                                        Container(
                                                          height: s.width * 0.5,
                                                          clipBehavior:
                                                              Clip.hardEdge,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color: redbg,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/gif/delivery.gif',
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "${data["name"]}",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  "${data["upTime"]}",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Montserrt",
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "${data["upDate"]}",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Montserrt",
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    );
                                                  }

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                          color: white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              offset:
                                                                  const Offset(
                                                                      0, 10),
                                                              blurRadius: 20,
                                                              color: secondbg
                                                                  .withOpacity(
                                                                      0.23),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      s.width *
                                                                          0.1),
                                                          child: Center(
                                                            child: SizedBox(
                                                              width: s.width *
                                                                  0.15,
                                                              height: s.width *
                                                                  0.15,
                                                              child:
                                                                  LoadingIndicator(
                                                                indicatorType:
                                                                    Indicator
                                                                        .ballClipRotateMultiple,
                                                                colors: const [
                                                                  bluebg
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: white),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Iconsax.truck,
                                        color: white,
                                      ),
                                      SizedBox(
                                        width: s.width * 0.04,
                                      ),
                                      Text(
                                        "Vehicle Status",
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (context) => Padding(
              padding: EdgeInsets.all(s.width * 0.03),
              child: InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Image.asset(
                  "assets/icons/menu.png",
                  color: white,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profilewrapper(
                            name: profile.name,
                            uid: loggedInUser.uid,
                            username: user?.photoURL,
                          )),
                );
              },
              icon: const Icon(Icons.person),
              color: Colors.white,
              iconSize: 30,
            ),
          ],
          elevation: 0,
          title: const Text(
            "Home",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: s.width,
                height: s.height * 0.09,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: s.width * 0.035),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: s.width * 0.1,
                            height: s.width * 0.1,
                          ),
                          const Text(
                            "Today's Program",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Stack(
                            children: [
                              InkWell(
                                onTap: () => showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: s.height * 0.03,
                                                horizontal: s.width * 0.02),
                                            child:
                                                FutureBuilder<DocumentSnapshot>(
                                              future: fb
                                                  .collection("Technician")
                                                  .doc(username)
                                                  .collection("Vehicle")
                                                  .doc("vehicle")
                                                  .get(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (snapshot.hasError) {
                                                  return Text(
                                                      "Something went wrong");
                                                }

                                                if (snapshot.hasData &&
                                                    !snapshot.data!.exists) {
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    s.width *
                                                                        0.02,
                                                                vertical:
                                                                    s.width *
                                                                        0.02),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              "No Vehicle Assigned",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .blueGrey),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25),
                                                                color: white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    offset:
                                                                        const Offset(
                                                                            2,
                                                                            4),
                                                                    blurRadius:
                                                                        20,
                                                                    color: secondbg
                                                                        .withOpacity(
                                                                            0.23),
                                                                  ),
                                                                ],
                                                              ),
                                                              clipBehavior:
                                                                  Clip.hardEdge,
                                                              child: Image.asset(
                                                                  "assets/icons/empty_garage.jpg"),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }

                                                if (snapshot.connectionState ==
                                                    ConnectionState.done) {
                                                  Map<String, dynamic> data =
                                                      snapshot.data!.data()
                                                          as Map<String,
                                                              dynamic>;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Vehicle Status",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: bluebg),
                                                      ),
                                                      SizedBox(height: 10),
                                                      Container(
                                                        height: s.width * 0.5,
                                                        clipBehavior:
                                                            Clip.hardEdge,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color: redbg,
                                                        ),
                                                        child: Image.asset(
                                                          'assets/gif/delivery.gif',
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "${data["name"]}",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                "${data["upTime"]}",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Montserrt",
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                              ),
                                                              Text(
                                                                "${data["upDate"]}",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Montserrt",
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Flexible(
                                                          child: InkWell(
                                                        onTap: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: Container(
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: white,
                                                            border: Border.all(
                                                                color: bluebg),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            "Got it!",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: bluebg,
                                                            ),
                                                          )),
                                                        ),
                                                      ))
                                                    ],
                                                  );
                                                }

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        color: white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            offset:
                                                                const Offset(
                                                                    0, 10),
                                                            blurRadius: 20,
                                                            color: secondbg
                                                                .withOpacity(
                                                                    0.23),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    s.width *
                                                                        0.1),
                                                        child: Center(
                                                          child: SizedBox(
                                                            width:
                                                                s.width * 0.15,
                                                            height:
                                                                s.width * 0.15,
                                                            child:
                                                                LoadingIndicator(
                                                              indicatorType:
                                                                  Indicator
                                                                      .ballClipRotateMultiple,
                                                              colors: const [
                                                                bluebg
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        )),
                                child: Container(
                                  width: s.width * 0.1,
                                  height: s.width * 0.1,
                                  child:
                                      Image.asset("assets/icons/scooter.png"),
                                ),
                              ),
                              Positioned(
                                  left: s.width * 0.08,
                                  top: s.width * 0.005,
                                  child: Container(
                                    width: s.width * 0.02,
                                    height: s.width * 0.02,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: limegreen),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: newbg,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection(
                                '/Technician/${user?.photoURL}/Assignedpgm')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            pgm_size = -1;
                            print('Something went Wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            pgm_size = -1;
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: bluebg,
                                ),
                              ),
                            );
                          }

                          List _allpgm = [];
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map a = document.data() as Map<String, dynamic>;
                            _allpgm.add(a);
                            a['uid'] = document.id;
                          }).toList();

                          pgm_size = _allpgm.length;

                          // Report button visiblity
                          if (_allpgm.isEmpty) {
                            rp_viz = true;
                          }

                          _allpgm.sort(
                              (a, b) => a["priority"].compareTo(b["priority"]));
                          return Column(
                            children: [
                              SizedBox(height: 10),
                              for (var i = 0; i < _allpgm.length; i++) ...[
                                SizedBox(
                                  height: 5,
                                ),
                                Programcard(
                                  uid: _allpgm[i]['uid'],
                                  name: _allpgm[i]['name'],
                                  address: _allpgm[i]['address'],
                                  loc: _allpgm[i]['loc'],
                                  phn: _allpgm[i]['phn'],
                                  pgm: _allpgm[i]['pgm'],
                                  chrg: _allpgm[i]['chrg'],
                                  type: _allpgm[i]['type'],
                                  upDate: _allpgm[i]['upDate'],
                                  upTime: _allpgm[i]['upTime'],
                                  docname: _allpgm[i]['docname'],
                                  status: _allpgm[i]['status'],
                                  username: _allpgm[i]['username'],
                                  techname: _allpgm[i]['techname'],
                                  assignedtime: _allpgm[i]['assignedtime'],
                                  prospec: _allpgm[i]['prospec'],
                                  instadate: _allpgm[i]['instadate'],
                                  assigneddate: _allpgm[i]['assigneddate'],
                                  priority: _allpgm[i]['priority'],
                                  custdocname: _allpgm[i]['custdocname'],
                                ),
                              ],
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

// ignore: must_be_immutable
class Profilewrapper extends StatelessWidget {
  String? uid;
  String? name;
  String? pic;
  String? username;
  Profilewrapper({Key? key, this.name, this.uid, this.pic, this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (name == null) {
      // print("No profile");
      return CreateProfile(
        uid: uid,
      );
    }
    return Profilesrc(
      uid: uid,
      name: name,
      img: pic,
      username: username,
    );
  }
}
