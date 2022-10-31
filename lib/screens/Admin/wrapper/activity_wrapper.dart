import 'package:flutter/material.dart';
import 'package:ideal_marketing/components/dailycompletedcard.dart';
import 'package:ideal_marketing/components/dailypendingcard.dart';
import 'package:ideal_marketing/components/dailyprocessingcard.dart';
import 'package:ideal_marketing/components/dailyassignedcard.dart';

// ignore: must_be_immutable
class Activitywrapper extends StatelessWidget {
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
  String? camount;
  String? remarks;
  String? ctime;
  String? cdate;
  String? ccollname;
  String? cdocname;
  String? custdocname;
  String? rpdocname;

  Activitywrapper({
    Key? key,
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
    this.camount,
    this.remarks,
    this.cdate,
    this.ctime,
    this.ccollname,
    this.cdocname,
    this.custdocname,
    this.rpdocname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == "completed") {
      return Dailycompltedcard(
        name: name,
        address: address,
        loc: loc,
        phn: phn,
        pgm: pgm,
        chrg: chrg,
        type: type,
        upDate: upDate,
        upTime: upTime,
        docname: docname,
        status: status,
        username: username,
        techname: techname,
        assignedtime: assignedtime,
        assigneddate: assigneddate,
        priority: priority,
        camount: camount,
        ctime: ctime,
        remarks: remarks,
      );
    } else if (status == "pending") {
      return Dailypendingcard(
        name: name,
        address: address,
        loc: loc,
        phn: phn,
        pgm: pgm,
        chrg: chrg,
        type: type,
        upDate: upDate,
        upTime: upTime,
        docname: docname,
        status: status,
        username: username,
        techname: techname,
        assignedtime: assignedtime,
        assigneddate: assigneddate,
        priority: priority,
        remarks: remarks,
        pdate: cdate,
        ptime: ctime,
      );
    } else if (status == "processing") {
      return Dailyprocessingcard(
        name: name,
        address: address,
        loc: loc,
        phn: phn,
        pgm: pgm,
        chrg: chrg,
        type: type,
        upDate: upDate,
        upTime: upTime,
        docname: docname,
        status: status,
        username: username,
        techname: techname,
        assignedtime: assignedtime,
        assigneddate: assigneddate,
        priority: priority,
        ptime: ctime,
        pdate: cdate,
        remarks: remarks,
      );
    }
    return Dailyassignedcard(
      name: name,
      address: address,
      loc: loc,
      phn: phn,
      pgm: pgm,
      chrg: chrg,
      type: type,
      upDate: upDate,
      upTime: upTime,
      docname: docname,
      status: status,
      username: username,
      techname: techname,
      assignedtime: assignedtime,
      assigneddate: assigneddate,
      priority: priority,
      custdocname: custdocname,
    );
  }
}