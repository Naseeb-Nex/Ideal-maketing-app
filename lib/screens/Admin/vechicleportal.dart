import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
// firebase firestore
import 'package:cloud_firestore/cloud_firestore.dart';
// iconsax
import 'package:iconsax/iconsax.dart';

class Vehicleportal extends StatefulWidget {
  const Vehicleportal({Key? key}) : super(key: key);

  @override
  _VehicleportalState createState() => _VehicleportalState();
}

class _VehicleportalState extends State<Vehicleportal> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bluebg,
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_rounded),
        ),
        elevation: 0,
        title: const Text(
          "Vehicle Portal",
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
            SizedBox(height: s.height * 0.01),
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: s.height * 0.03,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: s.width * 0.03, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 4,
                                color: black.withOpacity(.1),
                                offset: Offset(5, 7),
                              ),
                            ]),
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                "Vehicle Garage",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: bluebg,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: s.width * 0.01),
                            child: Image.asset("assets/icons/no_vehicles.jpg"),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () => {
          //Add Dialog from starting

          // showDialog(
          //   context: context,
          //   builder: ((context) => Container(
          //         padding: EdgeInsets.symmetric(
          //             horizontal: s.width * 0.03, vertical: 15),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: white,
          //             boxShadow: [
          //               BoxShadow(
          //                 spreadRadius: 2,
          //                 blurRadius: 4,
          //                 color: black.withOpacity(.1),
          //                 offset: Offset(5, 7),
          //               ),
          //             ]),
          //         child: Text(
          //           "Add Vechicle",
          //           style: TextStyle(
          //             fontFamily: "Nunito",
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       )),
          // )
        },
        child: Container(
          width: s.width * 0.17,
          height: s.width * 0.17,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bluebg),
          child: Icon(
            Iconsax.add,
            color: white,
          ),
        ),
      ),
    );
  }
}
