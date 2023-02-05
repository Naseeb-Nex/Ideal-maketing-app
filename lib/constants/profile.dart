class Profile {
  String? uid;
  String? username;
  String? name;
  String? designation;
  String? phn1;
  String? phn2;
  String? location;

  Profile(
      {this.uid,
      this.name,
      this.designation,
      this.phn1,
      this.phn2,
      this.location,
      this.username});

  // receiving data from server
  factory Profile.fromMap(map) {
    return Profile(
      uid: map['uid'],
      username: map['username'],
      name: map['name'],
      designation: map['designation'],
      phn1: map['phn1'],
      phn2: map['phn2'],
      location: map['location'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'name': name,
      'designation': designation,
      'phn1': phn1,
      'phn2': phn2,
      'location': location,
    };
  }
}
