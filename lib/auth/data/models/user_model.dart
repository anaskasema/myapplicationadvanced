class UserModel {
  final String email;
  final String password;
  final String? name;
  final String? uId; // معرف المستخدم الفريد من فيربيز

  UserModel({
    required this.email,
    required this.password,
    this.name,
    this.uId,
  });

  // تحويل البيانات من JSON (مثلاً عند القراءة من قاعدة البيانات)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      uId: json['uId'],
    );
  }

  // تحويل الكائن إلى Map (مثلاً عند الحفظ في Firestore)
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'uId': uId,
    };
  }
}
