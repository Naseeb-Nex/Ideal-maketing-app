class Techhistory {
  String? name;
  String? loc;
  String? pgm;
  String? chrg;
  String? upDate;
  String? upTime;
  String? docname;
  String? status;
  String? remarks;
  String? collection;
  String? username;

  Techhistory(
      {
      this.name,
      this.loc,
      this.pgm,
      this.chrg,
      this.upDate,
      this.upTime,
      this.docname,
      this.status,
      this.remarks,
      this.collection,
      this.username,
      });

  // receiving data from server
  factory Techhistory.fromMap(map) {
    return Techhistory(
      name: map['name'],
      loc: map['loc'],
      pgm: map['pgm'],
      chrg: map['chrg'],
      upDate: map['upDate'],
      upTime: map['upTime'],
      docname: map['docname'],
      status: map['status'],
      remarks: map['remarks'],
      collection: map['collection'],
      username: map['username'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'loc': loc,
      'pgm': pgm,
      'chrg': chrg,
      'upDate': upDate,
      'upTime': upTime,
      'docname': docname,
      'status': status,
      'remarks': remarks,
      'collection': collection,
      'username': username,
    };
  }
}
