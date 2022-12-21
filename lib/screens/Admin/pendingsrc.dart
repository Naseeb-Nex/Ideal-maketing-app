import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/adminpendingcard.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/components/pendingpgmcard.dart';


class Pendingsrc extends StatefulWidget {
  const Pendingsrc({Key? key}) : super(key: key);

  @override
  _PendingsrcState createState() => _PendingsrcState();
}

class _PendingsrcState extends State<Pendingsrc> {

  @override
  void initState() {
    super.initState();
  }
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
                      "Pending Program Viewer",
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
    return StreamBuilder<QuerySnapshot>(
        // this code is not updating
        // we want to update this code
        stream: FirebaseFirestore.instance
            .collection('Programs')
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
          return Column(
            children: [
              const SizedBox(height: 10),
              for (var i = 0; i < _allpgm.length; i++) ...[
                const SizedBox(
                  height: 5,
                ),
                AdminpendingCard(
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
                  techname: _allpgm[i]['techname'],
                  custdocname: _allpgm[i]['custdocname'],
                )
              ]
            ],
          );
        });
  }
}
