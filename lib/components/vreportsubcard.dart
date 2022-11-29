import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:iconsax/iconsax.dart';
// package
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class Vreportsubcard extends StatefulWidget {
  String? name;
  String? username;
  String? vdocname;
  String? update;
  String? uptime;

  Vreportsubcard({
    Key? key,
    this.name,
    this.username,
    this.vdocname,
    this.update,
    this.uptime,
  }) : super(key: key);

  @override
  State<Vreportsubcard> createState() => _VreportsubcardState();
}

class _VreportsubcardState extends State<Vreportsubcard> {

  @override
  Widget build(context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 20,
            color: secondbg.withOpacity(0.23),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(s.width * 0.03),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: s.width * 0.11,
                      height: s.width * 0.11,
                      child: Image.asset("assets/icons/scooter-1.png"),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: s.width * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Text(
                                "${widget.name}",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${widget.uptime}",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                        Text(
                          "${widget.update}",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) => VehicleinfoDialog()),
                        child: Container(
                          padding: EdgeInsets.all(s.width * 0.03),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: bluebg,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 3,
                                color: black.withOpacity(.05),
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.add,
                                  color: white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Add Usage",
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade50,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class VehicleinfoDialog extends StatefulWidget {
  String? name;
  String? username;
  String? vdocname;
  String? update;
  String? uptime;

  VehicleinfoDialog({
    this.name,
    this.username,
    this.vdocname,
    this.update,
    this.uptime,
  });

  @override
  State<VehicleinfoDialog> createState() => _NamedescDialogState();
}

class _NamedescDialogState extends State<VehicleinfoDialog> {
  // Form Key
  final form_key = GlobalKey<FormState>();
  FirebaseFirestore fb = FirebaseFirestore.instance;

  // Text editor controller
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Vehicle Usage Info",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Text(
                  "Starting KM",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  autofocus: false,
                  controller: startController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Starting KM");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    startController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.stacked_line_chart),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Starting Km",
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
                  "Closing KM",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  autofocus: false,
                  controller: endController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Closing KM");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    endController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.stacked_line_chart),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Closing Km",
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
                                  color: Color(0XFFeef1f7)),
                              child: Center(
                                  child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0XFFa4a6aa),
                                  fontSize: 15,
                                ),
                              ))),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: InkWell(
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
}
