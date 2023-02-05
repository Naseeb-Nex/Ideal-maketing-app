import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/loadingDialog.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/services/techvehicle.dart';
// date
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
import 'package:motion_toast/motion_toast.dart';

// ignore: must_be_immutable
class Assignvehiclecard extends StatefulWidget {
  String? name;
  String? desc;
  String? type;
  String? status;
  String? statusdesc;
  String? techname;
  String? docname;
  String? username;
  String? update;
  String? uptime;

  Assignvehiclecard({
    Key? key,
    this.name,
    this.desc,
    this.type,
    this.status,
    this.statusdesc,
    this.techname,
    this.docname,
    this.username,
    this.update,
    this.uptime,
  }) : super(key: key);

  @override
  State<Assignvehiclecard> createState() => _AssignvehiclecardState();
}

class _AssignvehiclecardState extends State<Assignvehiclecard> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  bool isviz = false;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) => Dialog(
                  child: Padding(
                    padding: EdgeInsets.all(s.height * 0.01),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Iconsax.warning_2,
                                color: yellowfg,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Are you sure?",
                                style: const TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Do you really want to ',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                color: black,
                                // fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Assign ${widget.name}',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: ' to ',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: '${widget.techname} ?',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => assignvehicle(context),
                              child: Text(
                                "Okay",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ));
      },
      child: Container(
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: s.width * 0.16,
                height: s.width * 0.16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: vybg),
                clipBehavior: Clip.hardEdge,
                child: Vehicleimagewrapper(widget.type),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: s.width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.name}",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${widget.desc}",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // upload asssigned details
  Future<void> assignvehicle(BuildContext context) async {
    DateTime now = DateTime.now();
    String update = DateFormat('d MM y').format(now);
    String uptime = DateFormat('h:mma').format(now);

    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);
    String techvdoc = DateFormat('MM d').format(now);
    String doc_name = DateFormat('kk:mm:ss').format(now);



    Techvehicle techv = Techvehicle(
      name: widget.name,
      upDate: update,
      upTime: uptime,
      username: widget.username,
      vdocname: widget.docname,
      docname: doc_name,
    );

    showDialog(context: context, builder: (context)=> LoadingDialog());

    // Profile vehicle updated
    await fb
        .collection("Technician")
        .doc(widget.username)
        .collection("Vehicle")
        .doc(techvdoc)
        .set(techv.toMap())
        .then((v) => print("profile updated"));

    // report added
    await fb
        .collection("Reports")
        .doc(year)
        .collection("Month")
        .doc(month)
        .collection(day)
        .doc("Tech")
        .collection("Reports")
        .doc("${widget.username}")
        .collection("vehicle")
        .doc(doc_name)
        .set(techv.toMap());

    // status change
    await fb.collection("Garage").doc(widget.docname).set({
      "status": "Ongoing",
      "techname": widget.techname,
      "username": widget.username
    }, SetOptions(merge: true));

    Navigator.of(context).pop();
    Navigator.pop(context);
    MotionToast.success(
      title: Text(
        "Vehicle assigned to ${widget.techname}",
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      description: Text(
        "Successfully vehicle assigned",
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    ).show(context);
  }
}

// ignore: must_be_immutable
class Vehicleimagewrapper extends StatelessWidget {
  String? type;
  Vehicleimagewrapper(this.type);

  @override
  Widget build(BuildContext context) {
    if (type == "Scooter") {
      return Image.asset(
        "assets/icons/scooter.jpg",
        fit: BoxFit.cover,
      );
    } else if (type == "Truck") {
      return Image.asset(
        "assets/icons/truck.png",
        fit: BoxFit.cover,
      );
    } else if (type == "Self Vehicle") {
      return Image.asset(
        "assets/icons/self_vehicle.jpg",
        fit: BoxFit.cover,
      );
    }
    return Image.asset(
      "assets/icons/bike.jpg",
      fit: BoxFit.cover,
    );
  }
}
