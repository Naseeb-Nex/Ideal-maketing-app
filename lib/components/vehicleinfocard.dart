import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ideal_marketing/constants/constants.dart';

// ignore: must_be_immutable
class VechicleInfoCard extends StatefulWidget {
  String? name;
  String? desc;
  String? type;
  String? status;
  String? statusdesc;
  String? techname;
  String? username;
  String? update;
  String? uptime;

  VechicleInfoCard({
    Key? key,
    this.name,
    this.desc,
    this.type,
    this.status,
    this.statusdesc,
    this.techname,
    this.username,
    this.update,
    this.uptime,
  }) : super(key: key);

  @override
  State<VechicleInfoCard> createState() => _VechicleInfoCardState();
}

class _VechicleInfoCardState extends State<VechicleInfoCard> {
  bool isviz = false;

  @override
  Widget build(BuildContext context) {
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: s.width * 0.2,
                  height: s.width * 0.2,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: greenbg,
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    color: black.withOpacity(.05),
                                    offset: Offset(1, 1),
                                  ),
                                ],
                              ),
                              child: Text(
                                "${widget.status}",
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Text(
                                "${widget.desc}",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                ),
                              ),
                            ),

                            // Center(
                            //   child: widget.status == "Ongoing"
                            //       ? Container(
                            //           padding: EdgeInsets.symmetric(
                            //               vertical: 5, horizontal: 8),
                            //           decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(10),
                            //             color: white,
                            //             boxShadow: [
                            //               BoxShadow(
                            //                 spreadRadius: 1,
                            //                 blurRadius: 1,
                            //                 color: black.withOpacity(.05),
                            //                 offset: Offset(1, 1),
                            //               ),
                            //             ],
                            //           ),
                            //           child: Text(
                            //             "Recall",
                            //             style: TextStyle(
                            //               fontFamily: "Montserrat",
                            //               fontSize: 14,
                            //               color: cheryred,
                            //               fontWeight: FontWeight.w600,
                            //             ),
                            //           ),
                            //         )
                            //       : null,
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: s.width * 0.2,
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Padding(
                          padding: const EdgeInsets.only(top : 5),
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  color: black.withOpacity(.05),
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: Icon(Iconsax.arrow_down_1, color: Colors.blueGrey),
                          ),
                        ),
              ]),
            ),
          ],
        ),
      ),
    );
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
