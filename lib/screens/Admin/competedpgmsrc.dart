import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:internet_popup/internet_popup.dart';
import 'package:intl/intl.dart';

import 'package:ideal_marketing/components/allcompletedpgmcard.dart';

class Completedpgmsrc extends StatefulWidget {
  const Completedpgmsrc({Key? key}) : super(key: key);

  @override
  _CompletedpgmsrcState createState() => _CompletedpgmsrcState();
}

class _CompletedpgmsrcState extends State<Completedpgmsrc> {
  
  @override
  void initState() {
    super.initState();
    InternetPopup().initialize(context: context);
  }
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Stack(fit: StackFit.expand, children: [
      Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade600,
              limegreen,
            ],
            begin: FractionalOffset.center,
            end: FractionalOffset.topCenter,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
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
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Center(
                              child: Icon(Icons.arrow_back, color: white, size: 25,),
                            ),
                          ),
                        ),
                        const Text(
                          "Programs",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 22,
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Completed Program Viewer",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
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
                    borderRadius:  BorderRadius.only(
                        topLeft:  Radius.circular(40),
                        topRight:  Radius.circular(40)),
                    color: newbg,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Pgmcardwrapper(),
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

class Pgmcardwrapper extends StatefulWidget {
  Pgmcardwrapper({Key? key}) : super(key: key);

  @override
  State<Pgmcardwrapper> createState() => _PgmcardwrapperState();
}

class _PgmcardwrapperState extends State<Pgmcardwrapper> {

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
                  Allcompletedpgmcard(
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
