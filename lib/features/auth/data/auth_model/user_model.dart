class UserModel {
  final String? uid;
  final String name;
  final String email;
  final String phoneNumber;
  final int? createdAt;

  UserModel({
    this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.createdAt,
});

  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'],
      phoneNumber: map['phoneNumber'] ?? '',
      createdAt: map['createdAt']?.toInt() ?? 0,
      uid: map['uid'] ?? '',
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt,
    };
  }
}
