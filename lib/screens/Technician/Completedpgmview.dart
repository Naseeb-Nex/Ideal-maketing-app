import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/compelepgmcard.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Compeltedpgmview extends StatefulWidget {
  String? username;
  Compeltedpgmview({Key? key, this.username}) : super(key: key);

  @override
  _CompeltedpgmviewState createState() => _CompeltedpgmviewState();
}

class _CompeltedpgmviewState extends State<Compeltedpgmview> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
    return Scaffold(
      backgroundColor: limegreen,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: s.width,
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
                        child: SizedBox(
                            height: 50,
                            width: 60,
                            child: Center(
                                child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: white,
                            ))),
                      ),
                      const Text(
                        "Completed Program List",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      )
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Technician')
                          .doc(widget.username)
                          .collection("Completedpgm")
                          .doc("Day")
                          .collection(cday)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print('Something went Wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Padding(
                            padding: EdgeInsets.only(top: s.height * 0.35),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: limegreen,
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
                        _allpgm.sort(
                            (a, b) => a["priority"].compareTo(b["priority"]));
                        return Container(
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Container(
                                child: _allpgm.isEmpty
                                    ? Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: s.height * 0.35),
                                            child: SizedBox(
                                                height: s.width * 0.4,
                                                width: s.width * 0.4,
                                                child: Image.asset(
                                                    "assets/icons/no_result.png")),
                                          ),
                                          Center(
                                            child: Text(
                                              "No Programs Found",
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 16,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : null,
                              ),
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
                              ]
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
