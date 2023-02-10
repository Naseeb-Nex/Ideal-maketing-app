import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

// ignore: must_be_immutable
class Vehiclelogcard extends StatefulWidget {
  String? start;
  String? end;
  String? docname;
  String? upDate;
  String? upTime;
  String? techname;
  String? edited;

  Vehiclelogcard(
      {Key? key,
      this.start,
      this.end,
      this.docname,
      this.upDate,
      this.upTime,
      this.techname,
       this.edited})
      : super(key: key);

  @override
  State<Vehiclelogcard> createState() => _VehiclelogcardState();
}

class _VehiclelogcardState extends State<Vehiclelogcard> {
  int dis = 0;
  @override
  void initState() {
    super.initState();

    if (widget.start != null && widget.end != null) {
      dis = int.parse("${widget.end}") - int.parse("${widget.start}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 5,
                  color: bluebg.withOpacity(.2),
                  offset: Offset(1, 2),
                ),
              ],
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "${widget.techname}",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF333333),
                      ), 
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${widget.upTime}",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.blueGrey.shade300),
                      ),
                      Text(
                        "${widget.upDate}",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.blueGrey.shade300),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$dis",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey.shade400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    " Km",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 13,
                      color: Colors.blueGrey.shade400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),

              // SizedBox(height: s.height * 0.01),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greenbg),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "${widget.start}",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: LinearGradient(colors: [
                            Colors.green,
                            Colors.orangeAccent,
                            Colors.redAccent
                          ])),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: redbg),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "${widget.end}",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        color: redfg,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
        Container(
          child: widget.edited == "true" ? Positioned(
            top: 0,
            left: 5,
            child:  Image.asset(
              "assets/icons/editedbadge.png",
              height: 35,
              width: 25,
            ),
          ) : null,
        )
      ],
    );
  }
}
