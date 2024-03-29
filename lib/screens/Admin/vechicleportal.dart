import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/vehicleinfocard.dart';
import 'package:ideal_marketing/components/vusagehistorycard.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:intl/intl.dart';

// firebase firestore
import 'package:cloud_firestore/cloud_firestore.dart';
// iconsax
import 'package:iconsax/iconsax.dart';
// loading_indicator
import 'package:loading_indicator/loading_indicator.dart';
import 'package:motion_toast/motion_toast.dart';

class Vehicleportal extends StatefulWidget {
  const Vehicleportal({Key? key}) : super(key: key);

  @override
  _VehicleportalState createState() => _VehicleportalState();
}

class _VehicleportalState extends State<Vehicleportal> {
  FirebaseFirestore fb = FirebaseFirestore.instance;

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
        actions: [
          IconButton(
              onPressed: () => {},
              icon: Icon(
                Iconsax.trash,
                color: white,
              ))
        ],
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
                                color: secondbg.withOpacity(0.23),
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
                                  fontSize: 18,
                                  color: bluebg,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          StreamBuilder<QuerySnapshot>(
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
                                  // a['uid'] = document.id;
                                }).toList();
                                return Column(
                                  children: [
                                    Container(
                                        child: vehicle.length == 0
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: s.width * 0.01),
                                                child: Image.asset(
                                                    "assets/icons/no_vehicles.jpg"),
                                              )
                                            : null),
                                    for (var i = 0;
                                        i < vehicle.length;
                                        i++) ...[
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: VechicleInfoCard(
                                          name: vehicle[i]['name'],
                                          desc: vehicle[i]['description'],
                                          type: vehicle[i]['type'],
                                          status: vehicle[i]['status'],
                                          techname: vehicle[i]['techname'],
                                          username: vehicle[i]['username'],
                                          vdocname: vehicle[i]['docname'],
                                          statusdesc: vehicle[i]['statusdesc'],
                                          update: vehicle[i]['update'],
                                          uptime: vehicle[i]['uptime'],
                                        ),
                                      )
                                    ]
                                  ],
                                );
                              }),
                        ]),
                      ),
                      SizedBox(
                        height: 20,
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
                                color: secondbg.withOpacity(0.23),
                                offset: Offset(5, 7),
                              ),
                            ]),
                        child: Column(children: [
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/icons/history.png",
                                height: s.width * 0.1,
                                width: s.width * 0.1,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Recent Activity",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xFF3763D2),
                                    ),
                                  ),
                                  Text(
                                    "Manage vehicle usage activities",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                      color: Colors.blueGrey.shade300,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream: fb
                                  .collection("GarageUsage")
                                  .orderBy('docname', descending: true)
                                  .limit(15)
                                  .snapshots(),
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
                                  // a['uid'] = document.id;
                                }).toList();
                                return Column(
                                  children: [
                                    Container(
                                        child: vehicle.length == 0
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: s.width * 0.01),
                                                child: Image.asset(
                                                    "assets/icons/no_result.png"),
                                              )
                                            : null),
                                    for (var i = 0;
                                        i < vehicle.length;
                                        i++) ...[
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: Vusagehistorycard(
                                          name: vehicle[i]['name'],
                                          desc: vehicle[i]['description'],
                                          type: vehicle[i]['type'],
                                          status: vehicle[i]['status'],
                                          techname: vehicle[i]['techname'],
                                          username: vehicle[i]['username'],
                                          docname: vehicle[i]['docname'],
                                          upDate: vehicle[i]['upDate'],
                                          upTime: vehicle[i]['upTime'],
                                          start: vehicle[i]['start'],
                                          end: vehicle[i]['end'],
                                        ),
                                      )
                                    ]
                                  ],
                                );
                              }),
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
          showDialog(
            context: context,
            builder: ((context) => Dialog(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: s.width * 0.02,
                      vertical: s.width * 0.02,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: bluebg),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: s.height * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add Vechicle",
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
                        // Divider(),
                        SizedBox(
                          height: s.height * 0.02,
                        ),
                        Text(
                          "Ideal Marketing Vehicle",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog(
                                          context: context,
                                          builder: (context) => NamedescDialog(
                                                type: "Scooter",
                                              ));
                                    },
                                    child: CircleAvatar(
                                      radius: s.width * 0.1,
                                      backgroundColor: Colors.red.shade50,
                                      backgroundImage: AssetImage(
                                          "assets/icons/scooter.jpg"),
                                    ),
                                  ),
                                  Text(
                                    "Scooter",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog(
                                          context: context,
                                          builder: (context) => NamedescDialog(
                                                type: "Bike",
                                              ));
                                    },
                                    child: CircleAvatar(
                                      radius: s.width * 0.1,
                                      backgroundColor: Colors.blue.shade50,
                                      backgroundImage:
                                          AssetImage("assets/icons/bike.jpg"),
                                    ),
                                  ),
                                  Text(
                                    "Bike",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog(
                                          context: context,
                                          builder: (context) => NamedescDialog(
                                                type: "Truck",
                                              ));
                                    },
                                    child: CircleAvatar(
                                      radius: s.width * 0.1,
                                      backgroundColor: Colors.green.shade50,
                                      backgroundImage:
                                          AssetImage("assets/icons/truck.png"),
                                    ),
                                  ),
                                  Text(
                                    "Truck",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                        SizedBox(
                          height: s.height * 0.02,
                        ),
                        Text(
                          "Self Vehicle",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (context) => NamedescDialog(
                                          type: "Self Vehicle",
                                        ));
                              },
                              child: CircleAvatar(
                                radius: s.width * 0.1,
                                backgroundColor: Colors.blue.shade50,
                                backgroundImage:
                                    AssetImage("assets/icons/self_vehicle.jpg"),
                              ),
                            ),
                            Text(
                              "Self Vehicle",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          )
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

// ignore: must_be_immutable
class NamedescDialog extends StatefulWidget {
  String? type;

  NamedescDialog({this.type});

  @override
  State<NamedescDialog> createState() => _NamedescDialogState();
}

class _NamedescDialogState extends State<NamedescDialog> {
  // Form Key
  final form_key = GlobalKey<FormState>();
  FirebaseFirestore fb = FirebaseFirestore.instance;

  // Text editor controller
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Dialog(
      insetAnimationCurve: Curves.easeInCubic,
      insetAnimationDuration: Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: s.width * 0.03,
          vertical: s.height * 0.03,
        ),
        child: Form(
          key: form_key,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: bluebg),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: s.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add Name and Discription",
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
                Text(
                  "${widget.type} Name",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  autofocus: false,
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Vehicle Name");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nameController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  autofocus: false,
                  minLines: 3,
                  maxLines: 4,
                  controller: descController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please fill Description");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    descController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: s.height * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bluebg),
                              child: Center(
                                  child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: white,
                                  fontSize: 15,
                                ),
                              ))),
                        ),
                      ),
                      Spacer(),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () => regvechicle(context),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: s.height * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bluebg),
                              child: Center(
                                  child: Text(
                                "Add",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: white,
                                  fontSize: 15,
                                ),
                              ))),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }

  // update reg values
  Future<void> regvechicle(BuildContext context) async {
    DateTime now = DateTime.now();
    String vehicleinit = DateFormat('MM d y kk:mm:ss').format(now);
    String update = DateFormat('d MM y').format(now);
    String uptime = DateFormat('h:mma').format(now);

    if (form_key.currentState!.validate()) {
      // LoadingIndicator
      showDialog(
          context: context,
          builder: ((context) => Dialog(
                backgroundColor: trans,
                elevation: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: white,
                      ),
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballClipRotateMultiple,
                        colors: const [bluebg],
                      ),
                    ),
                  ],
                ),
              )));

      await fb.collection("Garage").doc(vehicleinit).set({
        "name": nameController.text,
        "description": descController.text,
        "type": widget.type,
        "status": "Available",
        "statusdesc": "All clear",
        "techname": "none",
        "username": "none",
        "update": update,
        "uptime": uptime,
        "docname": vehicleinit,
      }).then((value) {
        // loading close
        Navigator.pop(context);
        // close Dialog
        Navigator.pop(context);

        MotionToast.success(
          title: Text(
            "New vehicle Registrated",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          description: Text(
            "Successfully added vehicle",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ).show(context);
      }).onError((error, stackTrace) {
        MotionToast.error(
          title: Text("Error"),
          description: Text("Something went wrong :( try again"),
        ).show(context);
      });
    }
  }
}
