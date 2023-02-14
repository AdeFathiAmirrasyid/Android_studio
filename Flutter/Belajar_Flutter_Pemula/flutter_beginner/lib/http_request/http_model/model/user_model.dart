import 'dart:convert';

// UserModels userModelsFromJson(String str) =>
//     UserModels.fromJson(json.decode(str));
// String userModelToJson(UserModels data) => json.encode(data.parseJson());

class UserModel {
  int id;
  String email, firstName, lastName, avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> dataJson) => UserModel(
        id: dataJson['id'],
        email: dataJson['email'],
        firstName: dataJson['first_name'],
        lastName: dataJson['last_name'],
        avatar: dataJson['avatar'],
      );

  // Map<String, dynamic> parseJson() => {
  //       "id": id,
  //       "email": email,
  //       "first_name": firstName,
  //       "last_name": lastName,
  //       "avatar": avatar
  //     };
}
