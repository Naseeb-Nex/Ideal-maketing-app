import 'package:flutter/material.dart';
import 'package:ideal_marketing/constants/constants.dart';

class Completedsrc extends StatefulWidget {
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? type;
  String? pgm;
  String? upDate;
  String? upTime;
  String? docname;
  String? chrg;
  Completedsrc({
    Key? key,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.type,
    this.pgm,
    this.upDate,
    this.upTime,
    this.docname,
    this.chrg,
  }) : super(key: key);

  @override
  _CompletedsrcState createState() => _CompletedsrcState();
}

class _CompletedsrcState extends State<Completedsrc> {
  @override
  bool _value = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cost = new TextEditingController();
  final TextEditingController remarks = new TextEditingController();

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
                          color: bluebg,
                        ),
                      ),
                    ),
                    Text(
                      "Program Completion",
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
                    width: double.infinity,
                    height: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), color: bluebg),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.name}",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "${widget.address}",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        Text(
                          "${widget.phn}",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Collection amount :",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${widget.chrg}",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Collected Amount :",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 160,
                              height: 50,
                              child: TextFormField(
                                  autofocus: false,
                                  controller: cost,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Collection Amount!!");
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    cost.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.attach_money_outlined,
                                      color: Colors.green,
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 15, 20, 15),
                                    hintText: "Collection",
                                    focusColor: Colors.green,
                                    hoverColor: bluebg,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 130,
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Remarks :",
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
                              width: MediaQuery.of(context).size.width / 2,
                              height: 130,
                              child: TextFormField(
                                autofocus: false,
                                controller: remarks,
                                keyboardType: TextInputType.multiline,
                                maxLines: 6,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("Enter the Remarks!!");
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  remarks.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: "Remarks",
                                  focusColor: Colors.green,
                                  hoverColor: bluebg,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
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
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _value = !_value;
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 5,),
                      Container(
                        height: 30,
                        width: 30,
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
                              : null
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                      "Verifed",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: bluebg),
                    ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.greenAccent),
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
                SizedBox(height: 20),
                Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
