class Techvehicle {
  String? name;
  String? start;
  String? end;
  String? username;
  String? vdocname;
  String? upDate;
  String? upTime;
  String? desc;

  Techvehicle({
    this.name,
    this.start,
    this.end,
    this.username,
    this.vdocname,
    this.upDate,
    this.upTime,
    this.desc,
  });

  // receiving data from server
  factory Techvehicle.fromMap(map) {
    return Techvehicle(
      name: map['name'],
      start: map['start'],
      end: map['end'],
      vdocname: map['vdocname'],
      upDate: map['upDate'],
      upTime: map['upTime'],
      username: map['username'],
      desc: map['desc'],
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
      'username': username,
      'desc': desc,
    };
  }
}
