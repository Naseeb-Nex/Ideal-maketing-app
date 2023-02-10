class VehicleLog {

  String? start;
  String? end;
  String? docname;
  String? upDate;
  String? upTime;
  String? techname;
  String? edited;


  VehicleLog({
    this.start,
    this.end,
    this.docname,
    this.upDate,
    this.upTime,
    this.techname,
    this.edited
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
      edited: map['edited'],
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
      'edited': edited,
    };
  }
}
