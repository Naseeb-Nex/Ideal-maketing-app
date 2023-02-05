class Getcount {
  int? count;


  Getcount({required this.count});

  // receiving data from server
  factory Getcount.fromMap(map) {
    return Getcount(
      count: map['count'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'count': count,
    };
  }
}