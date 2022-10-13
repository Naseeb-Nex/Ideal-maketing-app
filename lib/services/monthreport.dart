class MonthReport {
  String? upDate;
  String? upTime;
  String? docname;
  String? status;
  String? techname;
  String? name;
  String? pgm;

  MonthReport(
      {
      this.techname,
      this.name,
      this.pgm,
      this.upDate,
      this.upTime,
      this.docname,
      this.status,
      });

  // receiving data from server
  factory MonthReport.fromMap(map) {
    return MonthReport(
      techname: map['techname'],
      name: map['name'],
      pgm: map['pgm'],
      upDate: map['upDate'],
      upTime: map['upTime'],
      docname: map['docname'],
      status: map['status'],
    );  
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'techname': techname,
      'name': name,
      'pgm': pgm,
      'upDate': upDate,
      'upTime': upTime,
      'docname': docname,
      'status': status,
    };
  }
}
