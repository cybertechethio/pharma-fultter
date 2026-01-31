import '../../domain/entities/user.dart';
import '../models/user_model.dart';

extension UserMapper on UserModel {
  UserEntity toDomain() {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      isActive: isActive,
      createdAt: createdAt,
    );
  }
}

