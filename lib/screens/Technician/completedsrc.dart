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
                    height: 100,
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
                          SizedBox(width: 20,),
                          Container(
                            width: 160,
                            height: 50,
                            child: TextFormField(
                                autofocus: false,
                                controller: cost,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("Please Enter Your Email");
                                  }
                                  // reg expression for email validation
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return ("Please Enter a valid email");
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  cost.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.attach_money_outlined, color: Colors.green,),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Collection",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                )),
                          )
                        ],
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
