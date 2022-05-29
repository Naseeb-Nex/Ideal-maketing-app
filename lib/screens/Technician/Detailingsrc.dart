import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:ideal_marketing/screens/Technician/completedsrc.dart';
import 'package:ideal_marketing/screens/Technician/pendingsrc.dart';
import 'package:ideal_marketing/screens/Technician/processingsrc.dart';

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
  String? prospec;
  String? instadate;
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
    this.prospec,
    this.instadate,
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
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
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
                        child: const Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                          color: bluebg,
                        ),
                      ),
                    ),
                    const Text(
                      "Program Details",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: bluebg,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                      width: 50,
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: bluebg,
                      boxShadow: [BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.13),
                          offset: const Offset(0, 3)
                        )]
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 60),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: s.width * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "  ${widget.name}",
                            style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Address :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                child: Text(
                                  "${widget.address}",
                                  style: const TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Phone :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "  ${widget.phn}",
                                style: const TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Location :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "  ${widget.loc}",
                                style: const TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Program :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                child: Text(
                                  "${widget.pgm}",
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Product Specification :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "  ${widget.prospec}",
                                style: const TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Installation Date :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "  ${widget.instadate}",
                                style: const TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Type :",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "  ${widget.type}",
                                    style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Date :",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "  ${widget.assigneddate}",
                                    style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Collection Amount :",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "  ${widget.chrg}",
                                    style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Time :",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "  ${widget.assignedtime}",
                                    style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
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
                                prospec: widget.prospec,
                                instadate: widget.instadate,
                              ))),
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFF7ae582),
                        boxShadow: [BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.13),
                          offset: const Offset(0, 3)
                        )]
                        ),
                    child: const Center(
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
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Pendingsrc(
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
                        color: Colors.redAccent,
                        boxShadow: [BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.13),
                          offset: const Offset(0, 3)
                        )]),
                    child: const Center(
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
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Processingsrc(
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
                        color: const Color(0xFF56cfe1),
                        boxShadow: [BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.13),
                          offset: const Offset(0, 3)
                        )]),
                    child: const Center(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
