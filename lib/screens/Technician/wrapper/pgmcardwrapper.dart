import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideal_marketing/components/programcard.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Pgmcardwrapper extends StatefulWidget {
  String? username;
  Pgmcardwrapper({Key? key, required this.username}) : super(key: key);

  @override
  State<Pgmcardwrapper> createState() => _PgmcardwrapperState();
}

class _PgmcardwrapperState extends State<Pgmcardwrapper> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
              const SizedBox(height: 30,)
            ],
          );
        });
  }
}
