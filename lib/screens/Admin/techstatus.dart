import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/components/pendingpgmcard.dart';
import 'package:ideal_marketing/components/assignedpgmcard.dart';
import 'package:ideal_marketing/components/compelepgmcard.dart';
import 'package:intl/intl.dart';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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

class _TechstatusState extends State<Techstatus> {
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
                    
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Assignedpgmwrapper(username: widget.username,),
                        ),
                        SingleChildScrollView(
                          child: Completepgmwrapper(username: widget.username,),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: bluebg,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.blue,
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
    // TODO: implement initState
    super.initState();
    canLaunch('tel:123').then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
      print("its working or not :$_hasCallSupport");
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
          _allpgm.sort((a, b) => a["priority"].compareTo(b["priority"]));
          return Container(
            child: Column(
              children: [
                SizedBox(height: 10),
                for (var i = 0; i < _allpgm.length; i++) ...[
                  SizedBox(
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
                  )
                ]
              ],
            ),
          );
        });
  }
}


class Completepgmwrapper extends StatefulWidget {
  String? username;
  Completepgmwrapper({Key? key, required this.username}) : super(key: key);

  @override
  State<Completepgmwrapper> createState() => _CompletepgmwrapperState();
}

class _CompletepgmwrapperState extends State<Completepgmwrapper> {
  bool _hasCallSupport = false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
    return StreamBuilder<QuerySnapshot>(
        // this code is not updating
        // we want to update this code
        stream: 
            FirebaseFirestore.instance
                .collection('Technician')
                .doc(widget.username)
                .collection("Completedpgm")
                .doc("Day")
                .collection(cday).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
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
          _allpgm.sort((a, b) => a["priority"].compareTo(b["priority"]));
          return Container(
            child: Column(
              children: [
                SizedBox(height: 10),
                for (var i = 0; i < _allpgm.length; i++) ...[
                  SizedBox(
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
                ]
              ],
            ),
          );
        });
  }
}


