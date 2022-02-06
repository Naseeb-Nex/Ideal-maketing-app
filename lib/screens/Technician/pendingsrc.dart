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
  bool _upload = false;
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
                              color: bluebg,
                            ),
                          ),
                        ),
                        Text(
                          "Pending Programs",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
