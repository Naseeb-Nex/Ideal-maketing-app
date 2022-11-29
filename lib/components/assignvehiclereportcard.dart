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
class AssignVehiclereportcard extends StatefulWidget {
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

  AssignVehiclereportcard({
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
  State<AssignVehiclereportcard> createState() =>
      _AssignVehiclereportcardState();
}

class _AssignVehiclereportcardState extends State<AssignVehiclereportcard> {
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
                    padding: EdgeInsets.symmetric(
                        horizontal: s.height * 0.01, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.danger,
                              color: Colors.yellow,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Are you sure?",
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "* Please ensure that you ${widget.name} is not already existed in the Vehicle list",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              color: Color(0XFF949494),
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Do you really Drive ',
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                color: black,
                                // fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${widget.name}',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Today?',
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 20,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                  onTap: () => assignvehicle(context),
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: s.height * 0.01),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
    String doc_name = DateFormat('kk:mm:ss').format(now);

    // Report
    String day = DateFormat('d').format(now);
    String month = DateFormat('MM').format(now);
    String year = DateFormat('y').format(now);

    Techvehicle techv = Techvehicle(
      name: widget.name,
      upDate: update,
      upTime: uptime,
      username: widget.username,
      vdocname: widget.docname,
      docname: doc_name,
    );

    showDialog(context: context, builder: (context) => LoadingDialog());

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
