import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:intl/intl.dart';

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
                                  CircleAvatar(
                                    radius: s.width * 0.1,
                                    backgroundColor: Colors.blue.shade50,
                                    backgroundImage:
                                        AssetImage("assets/icons/bike.jpg"),
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
                                  CircleAvatar(
                                    radius: s.width * 0.1,
                                    backgroundColor: Colors.green.shade50,
                                    backgroundImage:
                                        AssetImage("assets/icons/truck.png"),
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
                          "Selef Vechicle",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: s.width * 0.1,
                              backgroundColor: Colors.blue.shade50,
                              backgroundImage:
                                  AssetImage("assets/icons/self_vehicle.jpg"),
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
                          onTap: ()=> Navigator.pop(context),
                          child: Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: s.height * 0.01),
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
                          onTap: () => regvechicle(),
                          child: Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: s.height * 0.01),
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
  Future<void> regvechicle() async {
    DateTime now = DateTime.now();
    String update = DateFormat('d MM y').format(now);
    String uptime = DateFormat('h:mma').format(now);

    if( form_key.currentState!.validate()) {
      // Add the fuction
    }
  }
}
