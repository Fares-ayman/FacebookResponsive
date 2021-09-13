import 'package:facebook/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String name,
    required String imageUrl,
  }) : super(
          name: name,
          imageUrl: imageUrl,
        );

  factory UserModel.fromjson(Map<String, dynamic> snapshot) {
    return UserModel(
      name: snapshot['name'],
      imageUrl: snapshot['imageUrl'],
    );
  }
}
