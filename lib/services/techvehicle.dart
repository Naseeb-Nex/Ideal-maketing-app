class Techvehicle {
  String? name;
  String? start;
  String? end;
  String? username;
  String? vdocname;
  String? docname;
  String? upDate;
  String? upTime;
  String? desc;
  String? type;

  Techvehicle({
    this.name,
    this.start,
    this.end,
    this.username,
    this.vdocname,
    this.docname,
    this.upDate,
    this.upTime,
    this.desc,
    this.type,
  });

  // receiving data from server
  factory Techvehicle.fromMap(map) {
    return Techvehicle(
      name: map['name'],
      start: map['start'],
      end: map['end'],
      vdocname: map['vdocname'],
      docname: map['docname'],
      upDate: map['upDate'],
      upTime: map['upTime'],
      username: map['username'],
      desc: map['desc'],
      type: map['type'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'start': start,
      'name': name,
      'end': end,
      'upDate': upDate,
      'upTime': upTime,
      'vdocname': vdocname,
      'docname': docname,
      'username': username,
      'desc': desc,
      'type': type,
    };
  }
}
