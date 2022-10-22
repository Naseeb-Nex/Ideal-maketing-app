import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/confirmationcard.dart';
import 'package:ideal_marketing/constants/constants.dart';

class Confirmationlist extends StatefulWidget {
  const Confirmationlist({Key? key}) : super(key: key);

  @override
  _ConfirmationlistState createState() => _ConfirmationlistState();
}

class _ConfirmationlistState extends State<Confirmationlist> {
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
          child: Column(
            children: [
              Container(
                width: s.width,
                height: s.height * 0.09,
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
                              child: Icon(
                                Icons.arrow_back,
                                color: white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "Confirmation List",
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: confrimationcardwrapper(),
                    ),
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

class confrimationcardwrapper extends StatefulWidget {
  confrimationcardwrapper({Key? key}) : super(key: key);

  @override
  State<confrimationcardwrapper> createState() =>
      _confrimationcardwrapperState();
}

class _confrimationcardwrapperState extends State<confrimationcardwrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        // this code is not updating
        // we want to update this code
        stream:
            FirebaseFirestore.instance.collection('ConfirmList').snapshots(),
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

          // sorting by priority
          _allpgm.sort((a, b) => a["priority"].compareTo(b["priority"]));

          return Column(
            children: [
              const SizedBox(height: 10),
              for (var i = 0; i < _allpgm.length; i++) ...[
                const SizedBox(
                  height: 5,
                ),
                Confirmationcard(
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
                  custdocname: _allpgm[i]['custdocname'],
                  prospec: _allpgm[i]['prospec'],
                  instadate: _allpgm[i]['instadate'],
                  status: _allpgm[i]['status'],
                  username: _allpgm[i]['username'],
                  techname: _allpgm[i]['techname'],
                  assignedtime: _allpgm[i]['assignedtime'],
                  assigneddate: _allpgm[i]['assigneddate'],
                  priority: _allpgm[i]['priority'],
                )
              ]
            ],
          );
        });
  }
}
