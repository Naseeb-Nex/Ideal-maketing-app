import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/assignvehiclecard.dart';
import 'package:ideal_marketing/components/loadingDialog.dart';
import 'package:ideal_marketing/services/vehicleusagehistory.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:url_launcher/url_launcher.dart';
// loading_indicator
import 'package:loading_indicator/loading_indicator.dart';
// Iconsax
import 'package:iconsax/iconsax.dart';

import 'package:ideal_marketing/constants/constants.dart';

import 'package:ideal_marketing/components/techpendingcard.dart';
import 'package:ideal_marketing/components/assignedpgmcard.dart';
import 'package:ideal_marketing/components/compelepgmcard.dart';
import 'package:ideal_marketing/components/processingpgmcard.dart';

// ignore: must_be_immutable
class Techstatus extends StatefulWidget {
  String? name;
  String? img;
  String? uid;
  String? username;
  Techstatus({Key? key, this.name, this.img, this.uid, this.username})
      : super(key: key);

  @override
  _TechstatusState createState() => _TechstatusState();
}

class _TechstatusState extends State<Techstatus>
    with SingleTickerProviderStateMixin {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    DateTime now = DateTime.now();
    String techvdoc = DateFormat('MM d').format(now);
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
        floatingActionButton: FloatingActionBubble(
          // Menu items
          items: <Bubble>[
            //Floating action menu item
            Bubble(
              title: "Impound Vehicle",
              iconColor: Colors.white,
              bubbleColor: bluebg,
              icon: Iconsax.tag_cross,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _animationController.reverse();
                showDialog(
                    context: context,
                    builder: (context) => RemoveVehicleDialog(
                        techname: widget.name, username: widget.username, name: widget.name,));
              },
            ),
            // Floating action menu item
            Bubble(
              title: "Vehicle Status",
              iconColor: Colors.white,
              bubbleColor: bluebg,
              icon: Icons.directions_bike_rounded,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _animationController.reverse();
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: s.height * 0.03,
                                horizontal: s.width * 0.02),
                            child: FutureBuilder<DocumentSnapshot>(
                              future: fb
                                  .collection("Technician")
                                  .doc(widget.username)
                                  .collection("Vehicle")
                                  .doc(techvdoc)
                                  .get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text("Something went wrong");
                                }

                                if (snapshot.hasData &&
                                    !snapshot.data!.exists) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: white,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(2, 4),
                                              blurRadius: 20,
                                              color: secondbg.withOpacity(0.23),
                                            ),
                                          ],
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: s.width * 0.02,
                                              vertical: s.width * 0.02),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                  "assets/icons/not_asigned.jpg"),
                                              Text(
                                                "No Vehicle Assigned",
                                                style: TextStyle(
                                                    fontFamily: "Montserrat",
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.blueGrey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Vehicle Status",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: bluebg),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        height: s.width * 0.5,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                          fontFamily: "Montserrat",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${data["upTime"]}",
                                                style: TextStyle(
                                                  fontFamily: "Montserrt",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                "${data["upDate"]}",
                                                style: TextStyle(
                                                  fontFamily: "Montserrt",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
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
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: white,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 10),
                                            blurRadius: 20,
                                            color: secondbg.withOpacity(0.23),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: s.width * 0.1),
                                        child: Center(
                                          child: SizedBox(
                                            width: s.width * 0.15,
                                            height: s.width * 0.15,
                                            child: LoadingIndicator(
                                              indicatorType: Indicator
                                                  .ballClipRotateMultiple,
                                              colors: const [bluebg],
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
            ),
            // Floating action menu item
            Bubble(
              title: "Add Vehicle",
              iconColor: Colors.white,
              bubbleColor: bluebg,
              icon: Iconsax.add_circle,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _animationController.reverse();
                showDialog(
                  context: context,
                  builder: (context) => AddvehicleDialog(
                    techname: widget.name,
                    username: widget.username,
                  ),
                );
              },
            ),
          ],

          // animation controller
          animation: _animation,

          // On pressed change animation state
          onPress: () => _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),

          // Floating Action button Icon color
          iconColor: bluebg,

          // Flaoting Action button Icon
          iconData: Icons.directions_bike_rounded,
          backGroundColor: Colors.white,
        ),
        body: SafeArea(
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                Container(
                  width: s.width,
                  height: s.height * 1 / 7,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          Text(
                            "${widget.name}'s Status",
                            style: const TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.person,
                              color: Colors.transparent,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const TabBar(
                        tabs: [
                          Tab(
                            text: "assigned",
                          ),
                          Tab(
                            text: "completed",
                          ),
                          Tab(
                            text: "pending",
                          ),
                          Tab(
                            text: "processing",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: newbg,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Assignedpgmwrapper(
                            username: widget.username,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Completepgmwrapper(
                            username: widget.username,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Pendingpgmwrapper(
                            username: widget.username,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Processingpgmwrapper(
                            username: widget.username,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

// ignore: must_be_immutable
class Assignedpgmwrapper extends StatefulWidget {
  String? username;
  Assignedpgmwrapper({Key? key, required this.username}) : super(key: key);

  @override
  State<Assignedpgmwrapper> createState() => _AssignedpgmwrapperState();
}

class _AssignedpgmwrapperState extends State<Assignedpgmwrapper> {
  bool _hasCallSupport = false;

  @override
  void initState() {
    super.initState();
    canLaunch('tel:123').then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        // this code is not updating
        // we want to update this code
        stream: FirebaseFirestore.instance
            .collection('/Technician/${widget.username}/Assignedpgm')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: bluebg,
              ),
            );
          }

          List _allpgm = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            _allpgm.add(a);
            a['uid'] = document.id;
          }).toList();
          _allpgm.sort((a, b) => a["priority"].compareTo(b["priority"]));
          return Column(
            children: [
              const SizedBox(height: 10),
              for (var i = 0; i < _allpgm.length; i++) ...[
                const SizedBox(
                  height: 5,
                ),
                Assignedpgmcard(
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
                  assigneddate: _allpgm[i]['assigneddate'],
                  priority: _allpgm[i]['priority'],
                  prospec: _allpgm[i]['prospec'],
                  instadate: _allpgm[i]['instadate'],
                  custdocname: _allpgm[i]['custdocname'],
                )
              ],
              // Assignedpgmcard(
              //     uid: 'uid',
              //     name: 'name',
              //     address: 'address',
              //     loc: 'loc',
              //     phn: 'phn',
              //     pgm: 'pgm',
              //     chrg: 'chrg',
              //     type: 'type',
              //     upDate: 'upDate',
              //     upTime: 'upTime',
              //     docname: 'docname',
              //     status: 'status',
              //     username: 'username',
              //     techname: 'techname',
              //     assignedtime: 'assignedtime',
              //     assigneddate: 'assigneddate',
              //     priority: 'priority',
              //     prospec: 'prospec',
              //     instadate: 'instadate',
              //     custdocname: 'custdocname',
              //   )
            ],
          );
        });
  }
}

// ignore: must_be_immutable
class Completepgmwrapper extends StatefulWidget {
  String? username;
  Completepgmwrapper({Key? key, required this.username}) : super(key: key);

  @override
  State<Completepgmwrapper> createState() => _CompletepgmwrapperState();
}

class _CompletepgmwrapperState extends State<Completepgmwrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
    return StreamBuilder<QuerySnapshot>(
        // this code is not updating
        // we want to update this code
        stream: FirebaseFirestore.instance
            .collection('Technician')
            .doc(widget.username)
            .collection("Completedpgm")
            .doc("Day")
            .collection(cday)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: bluebg,
              ),
            );
          }

          List _allpgm = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            _allpgm.add(a);
            a['uid'] = document.id;
          }).toList();
          _allpgm.sort((a, b) => a["priority"].compareTo(b["priority"]));
          return Container(
            child: Column(
              children: [
                const SizedBox(height: 10),
                for (var i = 0; i < _allpgm.length; i++) ...[
                  const SizedBox(
                    height: 5,
                  ),
                  Completedpgmcard(
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
                    assigneddate: _allpgm[i]['assigneddate'],
                    priority: _allpgm[i]['priority'],
                    camount: _allpgm[i]['camount'],
                    ctime: _allpgm[i]['ctime'],
                    remarks: _allpgm[i]['remarks'],
                  )
                ],
                // Completedpgmcard(
                //     uid: 'uid',
                //     name: 'name',
                //     address: 'address',
                //     loc: 'loc',
                //     phn: 'phn',
                //     pgm: 'pgm',
                //     chrg: '1000',
                //     type: 'type',
                //     upDate: 'upDate',
                //     upTime: 'upTime',
                //     docname: 'docname',
                //     status: 'status',
                //     username: 'username',
                //     techname: 'techname',
                //     assignedtime: 'assignedtime',
                //     assigneddate: 'assigneddate',
                //     priority: 'priority',
                //     camount: '500',
                //     ctime: 'ctime',
                //     remarks: 'remarks',
                //   )
              ],
            ),
          );
        });
  }
}

// ignore: must_be_immutable
class Pendingpgmwrapper extends StatefulWidget {
  String? username;
  Pendingpgmwrapper({Key? key, required this.username}) : super(key: key);

  @override
  State<Pendingpgmwrapper> createState() => _PendingpgmwrapperState();
}

class _PendingpgmwrapperState extends State<Pendingpgmwrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Technician')
            .doc(widget.username)
            .collection("Pendingpgm")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: bluebg,
              ),
            );
          }

          List _allpgm = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            _allpgm.add(a);
            a['uid'] = document.id;
          }).toList();
          _allpgm.sort((a, b) => a["priority"].compareTo(b["priority"]));
          return Column(
            children: [
              const SizedBox(height: 10),
              for (var i = 0; i < _allpgm.length; i++) ...[
                const SizedBox(
                  height: 5,
                ),
                TechpendingCard(
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
                  assigneddate: _allpgm[i]['assigneddate'],
                  priority: _allpgm[i]['priority'],
                  remarks: _allpgm[i]['remarks'],
                  pdate: _allpgm[i]['pdate'],
                  ptime: _allpgm[i]['ptime'],
                )
              ]
            ],
          );
        });
  }
}

// ignore: must_be_immutable
class Processingpgmwrapper extends StatefulWidget {
  String? username;
  Processingpgmwrapper({Key? key, required this.username}) : super(key: key);

  @override
  State<Processingpgmwrapper> createState() => _ProcessingpgmwrapperState();
}

class _ProcessingpgmwrapperState extends State<Processingpgmwrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Technician')
            .doc(widget.username)
            .collection("Processingpgm")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: bluebg,
              ),
            );
          }

          List _allpgm = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            _allpgm.add(a);
            a['uid'] = document.id;
          }).toList();
          _allpgm.sort((a, b) => a["priority"].compareTo(b["priority"]));
          return Column(
            children: [
              const SizedBox(height: 10),
              for (var i = 0; i < _allpgm.length; i++) ...[
                const SizedBox(
                  height: 5,
                ),
                Processingpgmcard(
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
                  assigneddate: _allpgm[i]['assigneddate'],
                  priority: _allpgm[i]['priority'],
                  ptime: _allpgm[i]['upTime'],
                  pdate: _allpgm[i]['upDate'],
                  remarks: _allpgm[i]['remarks'],
                )
              ],
              //Test Calll

              // Processingpgmcard(
              //     uid: "uid",
              //     name: "name",
              //     address: "address",
              //     loc: "loc",
              //     phn: "phn",
              //     pgm: "pgm",
              //     chrg: "chrg",
              //     type: "type",
              //     upDate: "upDate",
              //     upTime: "upTime",
              //     docname: "docname",
              //     status: "status",
              //     username: "username",
              //     techname: "techname",
              //     assignedtime: "assignedtime",
              //     assigneddate: "assigneddate",
              //     priority: "priority",
              //     ptime: "upTime",
              //     pdate: "upDate",
              //     remarks: "remarks",
              //   )
            ],
          );
        });
  }
}

// ignore: must_be_immutable
class AddvehicleDialog extends StatefulWidget {
  String? techname;
  String? username;

  AddvehicleDialog({this.techname, this.username});

  @override
  State<AddvehicleDialog> createState() => _AddvehicleDialogState();
}

class _AddvehicleDialogState extends State<AddvehicleDialog> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    // Tech vehicle docname
    DateTime now = DateTime.now();
    String techvdoc = DateFormat('MM d').format(now);
    return Dialog(
      insetAnimationCurve: Curves.easeInCubic,
      insetAnimationDuration: Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.all(
          s.width * 0.03,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: bluebg),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: s.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Assign Vehicle",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            FutureBuilder<DocumentSnapshot>(
              future: fb
                  .collection("Technician")
                  .doc(widget.username)
                  .collection("Vehicle")
                  .doc(techvdoc)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Text(
                          "Avaliable Vehicle List",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: s.width * 0.02),
                        child: Container(
                          height: s.height * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 5,
                                color: secondbg.withOpacity(0.23),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: StreamBuilder<QuerySnapshot>(
                                stream: fb.collection("Garage").snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {}
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: SizedBox(
                                        width: s.width * 0.25,
                                        height: s.width * 0.25,
                                        child: LoadingIndicator(
                                          indicatorType:
                                              Indicator.ballClipRotateMultiple,
                                          colors: const [bluebg],
                                        ),
                                      ),
                                    );
                                  }

                                  final List vehicle = [];
                                  snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                    Map a =
                                        document.data() as Map<String, dynamic>;
                                    vehicle.add(a);
                                  }).toList();

                                  List avaliable_vehicles = vehicle
                                      .where((i) => i['status'] == 'Available')
                                      .toList();
                                  return Column(
                                    children: [
                                      Container(
                                          child: avaliable_vehicles.length == 0
                                              ? Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          s.width * 0.01),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                          "assets/icons/not_asigned.jpg"),
                                                      Text(
                                                        "No Vehicle Available",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontSize: 15,
                                                            color: Colors
                                                                .blueGrey),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : null),
                                      for (var i = 0;
                                          i < avaliable_vehicles.length;
                                          i++) ...[
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Assignvehiclecard(
                                            name: avaliable_vehicles[i]['name'],
                                            desc: avaliable_vehicles[i]
                                                ['description'],
                                            type: avaliable_vehicles[i]['type'],
                                            status: avaliable_vehicles[i]
                                                ['status'],
                                            docname: avaliable_vehicles[i]
                                                ['docname'],
                                            techname: widget.techname,
                                            username: widget.username,
                                            statusdesc: avaliable_vehicles[i]
                                                ['statusdesc'],
                                            update: avaliable_vehicles[i]
                                                ['update'],
                                            uptime: avaliable_vehicles[i]
                                                ['uptime'],
                                          ),
                                        )
                                      ]
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/warning.png",
                        fit: BoxFit.fitHeight,
                        width: s.width * 0.3,
                        height: s.width * 0.3,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: s.height * 0.02),
                        child: Text(
                          "${data["name"]} Already assigned to ${widget.techname}",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${data["upTime"]}",
                                style: TextStyle(
                                  fontFamily: "Montserrt",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "${data["upDate"]}",
                                style: TextStyle(
                                  fontFamily: "Montserrt",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 20,
                            color: secondbg.withOpacity(0.23),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: s.width * 0.1),
                        child: Center(
                          child: SizedBox(
                            width: s.width * 0.15,
                            height: s.width * 0.15,
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballClipRotateMultiple,
                              colors: const [bluebg],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RemoveVehicleDialog extends StatefulWidget {
  String? techname;
  String? username;
  String? name;

  RemoveVehicleDialog({this.techname, this.username, this.name});

  @override
  State<RemoveVehicleDialog> createState() => _RemoveVehicleDialogState();
}

class _RemoveVehicleDialogState extends State<RemoveVehicleDialog> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    String techvdoc = DateFormat('MM d').format(now);
    return Dialog(
      child: Container(
        child: FutureBuilder<DocumentSnapshot>(
          future: fb
              .collection("Technician")
              .doc(widget.username)
              .collection("Vehicle")
              .doc(techvdoc)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(2, 4),
                          blurRadius: 20,
                          color: secondbg.withOpacity(0.23),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: s.width * 0.02, vertical: s.width * 0.02),
                      child: Column(
                        children: [
                          Image.asset("assets/icons/not_asigned.jpg"),
                          Text(
                            "No Assigned Vehicle To Impound",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: s.height * 0.03, horizontal: s.width * 0.02),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/warning_2.png",
                      fit: BoxFit.fitHeight,
                      width: s.width * 0.3,
                      height: s.width * 0.3,
                    ),
                    Text(
                      "Are you sure ?",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: bluebg),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Do you really want to Impound ',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            color: black,
                            // fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '${data["name"]}',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' From ',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.techname} ?',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: bluebg,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      color: white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () => removeV(context, data["vdocname"],data["type"], data["name"] ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: bluebg,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Text(
                                  "Ok",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      color: white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 20,
                        color: secondbg.withOpacity(0.23),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: s.width * 0.1),
                    child: Center(
                      child: SizedBox(
                        width: s.width * 0.15,
                        height: s.width * 0.15,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballClipRotateMultiple,
                          colors: const [bluebg],
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
    );
  }

  Future<void> removeV(BuildContext context, String? docname, String? type, String? name) async {
    DateTime now = DateTime.now();
    String techvdoc = DateFormat('MM d').format(now);
    String usagedocname = DateFormat('MM d y kk:mm:ss').format(now);

    // Vehicle usage history
    String update = DateFormat('d MM y').format(now);
    String uptime = DateFormat('h:mma').format(now);

    // Vehicle history class is added
    VehicleUsageHistory vusage = VehicleUsageHistory(
      name: name,
      upDate: update,
      upTime: uptime,
      username: widget.username,
      docname: usagedocname,
      techname: widget.techname,
      type: type,
      status: "Impounded"
    );
    
    showDialog(context: context, builder: ((context) => LoadingDialog()));
    await fb
        .collection("Technician")
        .doc(widget.username)
        .collection("Vehicle")
        .doc(techvdoc)
        .delete()
        .then((value) => (print("data deleted suscessfully")));

    // status change
    await fb.collection("Garage").doc(docname).set(
        {"status": "Available", "techname": "none", "username": "none"},
        SetOptions(merge: true));

    // history added
    await fb
        .collection("GarageUsage")
        .doc(usagedocname)
        .set(vusage.toMap())
        .then((v) => print("Vehicle assigned history added"));

    Navigator.of(context).pop();
    Navigator.pop(context);
    MotionToast.success(
      title: Text(
        "Vehicle impounded from ${widget.techname}",
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      description: Text(
        "Successfully vehicle Impounded",
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    ).show(context);
  }
}
