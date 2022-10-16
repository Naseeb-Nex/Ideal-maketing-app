class Reportstatus {
  String? upDate;
  String? upTime;
  String? docname;
  String? status;
  String? techname;
  String? name;
  String? phn;
  String? pgm;
  String? month;
  String? day;
  String? more;
  String? username;

  Reportstatus(
      {
      this.techname,
      this.name,
      this.pgm,
      this.upDate,
      this.upTime,
      this.docname,
      this.phn,
      this.status,
      this.month,
      this.day,
      this.more,
      this.username,
      });

  // receiving data from server
  factory Reportstatus.fromMap(map) {
    return Reportstatus(
      techname: map['techname'],
      name: map['name'],
      pgm: map['pgm'],
      upDate: map['upDate'],
      upTime: map['upTime'],
      docname: map['docname'],
      status: map['status'],
      phn: map['phn'],
      month: map['month'],
      day: map['day'],
      more: map['more'],
      username: map['username'],
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
      'phn': phn,
      'month': month,
      'day': day,
      'more': more,
      'username': username,
    };
  }
}
