class UserGetModel {
  final String uid;
  final String name;
  final String email;
  final String phoneNo;

  UserGetModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNo,
  });


  factory UserGetModel.fromMap(Map<String, dynamic> map) {
    return UserGetModel(
      uid: (map['uid'] as String?) ?? '',
      name: (map['name'] as String?) ?? '',
      email: (map['email'] as String?) ?? '',
      phoneNo: (map['phoneNumber'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNo,
    };
  }
}