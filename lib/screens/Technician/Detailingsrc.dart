import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/screens/Technician/completedsrc.dart';

class Detailingsrc extends StatefulWidget {
  String? uid;
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? pgm;
  String? chrg;
  String? type;
  String? upDate;
  String? upTime;
  String? docname;
  String? status;
  String? username;
  String? techname;
  String? assignedtime;
  String? assigneddate;
  String? priority;
  Detailingsrc({
    Key? key,
    this.uid,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.pgm,
    this.chrg,
    this.type,
    this.upDate,
    this.upTime,
    this.docname,
    this.status,
    this.username,
    this.techname,
    this.assignedtime,
    this.assigneddate,
    this.priority,
  }) : super(key: key);

  @override
  _DetailingsrcState createState() => _DetailingsrcState();
}

class _DetailingsrcState extends State<Detailingsrc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newbg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 50,
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                          color: bluebg,
                        ),
                      ),
                    ),
                    Text(
                      "Program Details",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: bluebg,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 50,
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: bluebg,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "  ${widget.name}",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              child: Text(
                                "Address :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "  ${widget.address}",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              child: Text(
                                "Phone :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "  ${widget.phn}",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              child: Text(
                                "Location :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "  ${widget.loc}",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              child: Text(
                                "Program :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "  ${widget.pgm}",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  child: Text(
                                    "Type :",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "  ${widget.type}",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Date :",
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "  ${widget.assigneddate}",
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Time :",
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "  ${widget.assignedtime}",
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              child: Text(
                                "Collection Amount :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "  ${widget.chrg}",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Completedsrc(
                                uid: widget.uid,
                                name: widget.name,
                                address: widget.address,
                                loc: widget.loc,
                                phn: widget.phn,
                                pgm: widget.pgm,
                                chrg: widget.chrg,
                                type: widget.type,
                                upDate: widget.upDate,
                                upTime: widget.upTime,
                                docname: widget.docname,
                                status: widget.status,
                                username: widget.username,
                                techname: widget.techname,
                                assignedtime: widget.assignedtime,
                                assigneddate: widget.assigneddate,
                                priority: widget.priority,
                              ))),
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFF7ae582)),
                    child: Center(
                      child: Text(
                        "Completed",
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFFc71f37)),
                  child: Center(
                    child: Text(
                      "Pending",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF56cfe1)),
                  child: Center(
                    child: Text(
                      "Processing",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
