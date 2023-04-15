class UserModel {
  String fullName;
  String email;
  String phone;
  String photo;


  UserModel({

    required this.email,
    required this.fullName,

    required this.photo,

    required this.phone,

  });

  Map<String, dynamic> toMap() {
    return {

      'email': this.email,
      'fullName': this.fullName,

      'photo': this.photo,

      'phone': this.phone,

    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(

      email: map['email'] as String,
   photo: map['photo'] as String,

      phone: map['phone'] as String,
      fullName: map['fullName'] as String,
    );
  }
}
