class UserModel {
  String? uid;
  String? email;
  String? category;
  String? password;

  UserModel({this.uid, this.email, this.category, this.password});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      category: map['category'],
      password: map['password'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'category': category,
      'password': password,
    };
  }
}