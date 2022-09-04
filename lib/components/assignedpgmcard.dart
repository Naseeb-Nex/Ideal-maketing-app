import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Assignedpgmcard extends StatefulWidget {
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
  String? prospec;
  String? instadate;

  Assignedpgmcard({
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
    this.prospec,
    this.instadate,
  }) : super(key: key);

  @override
  State<Assignedpgmcard> createState() => _AssignedpgmcardState();
}

class _AssignedpgmcardState extends State<Assignedpgmcard> {
  bool isviz = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => {
            setState(() {
              isviz = !isviz;
            })
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.name}",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.32,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        child: RichText(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      strutStyle: StrutStyle(fontSize: 12.0),
                                      text: TextSpan(
                                        text: "${widget.address}",
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  "${widget.pgm}",
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _makePhoneCall(widget.phn!);
                            },
                            child: const SizedBox(
                              height: 40,
                              width: 35,
                              child: Icon(
                                Icons.call,
                                size: 25,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.pin_drop_outlined,
                                  color: cheryred,
                                ),
                                Text(
                                  "${widget.loc}",
                                  style: const TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${widget.type}",
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isviz,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: greenbg),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "More Details",
                            style: const TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Address :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    "${widget.address}",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Program :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    "${widget.pgm}",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Phone :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "  ${widget.phn}",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Date :",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "  ${widget.upDate}",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Time :",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "  ${widget.upTime}",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Location :",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "  ${widget.loc}",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Collection Amount :",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "  ${widget.chrg}",
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Product Specification :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    "${widget.prospec}",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Installation Date :",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    "${widget.instadate}",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}
