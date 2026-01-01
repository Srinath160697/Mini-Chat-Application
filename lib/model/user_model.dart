class UserModel {
  final String name;

  UserModel({required this.name});

  String get initial => name[0].toUpperCase();
}
