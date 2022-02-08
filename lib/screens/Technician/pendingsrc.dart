import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

class Pendingsrc extends StatefulWidget {
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
  Pendingsrc({
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
  _PendingsrcState createState() => _PendingsrcState();
}

class _PendingsrcState extends State<Pendingsrc> {
  @override
  bool _value = false;
  bool _err = false;
  bool _upload = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController reason = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newbg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
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
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        Text(
                          "Pending Programs",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
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
                          color: Colors.redAccent,
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
                    SizedBox(height: 10),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.12,
                      child: Text(
                        "Note : If there is no reason for pending or cancel a program will be decrease the performance",
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 130,
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Reason :",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  height: 130,
                                  child: TextFormField(
                                    autofocus: false,
                                    controller: reason,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 6,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Enter the Reason!!");
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      reason.text = value!;
                                    },
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      hintText: "Enter the Reason",
                                      hintStyle: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 15,
                                      ),
                                      focusColor: Colors.green,
                                      hoverColor: bluebg,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _value = !_value;
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: _value
                                    ? Icon(
                                        Icons.check,
                                        size: 20.0,
                                        color: Colors.greenAccent,
                                      )
                                    : null),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Verify the Details",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: _err
                          ? Text(
                              "please verify the details then check the box",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            )
                          : null,
                    ),
                    SizedBox(height: 25,),
                    InkWell(
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.greenAccent),
                        child: Center(
                          child: Text(
                            "Update",
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
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.redAccent),
                        child: Center(
                          child: Text(
                            "Cancel",
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
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: _upload
                      ? CircularProgressIndicator(
                          color: bluebg,
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
