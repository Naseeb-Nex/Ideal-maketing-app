class VehicleLog {

  String? start;
  String? end;
  String? docname;
  String? upDate;
  String? upTime;
  String? techname;


  VehicleLog({
    this.start,
    this.end,
    this.docname,
    this.upDate,
    this.upTime,
    this.techname,
  });

  // receiving data from server
  factory VehicleLog.fromMap(map) {
    return VehicleLog(
      start: map['start'],
      end: map['end'],
      docname: map['docname'],
      upDate: map['upDate'],
      upTime: map['upTime'],
      techname: map['techname'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'start': start,
      'end': end,
      'upDate': upDate,
      'upTime': upTime,
      'docname': docname,
      'techname': techname,
    };
  }
}
