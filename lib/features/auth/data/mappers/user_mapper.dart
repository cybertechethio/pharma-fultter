import '../../domain/entities/user.dart';
import '../models/user_model.dart';

extension UserModelMapper on UserModel {
  User toDomain() => User(
    id: id,
    email: email,
    phone: phone,
    firstName: firstName,
    lastName: lastName,
    profilePicture: avatar,
    isAccountVerified: isAccountVerified,
    resetToken: resetToken,
    companyName: companyName,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension UserMapper on User {
  UserModel toModel() => UserModel(
    id: id,
    email: email,
    phone: phone,
    firstName: firstName,
    lastName: lastName,
    avatar: profilePicture,
    isAccountVerified: isAccountVerified,
    resetToken: resetToken,
    companyName: companyName,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
