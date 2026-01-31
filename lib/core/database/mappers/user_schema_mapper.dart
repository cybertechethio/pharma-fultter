import 'package:cyber_pos/features/auth/domain/entities/user.dart';
import '../schemas/user_schema.dart';

extension UserSchemaMapper on UserSchema {
  User toDomain() => User(
    id: userId,
    email: email,
    phone: phone,
    firstName: firstName,
    lastName: lastName,
    profilePicture: profilePicture,
    isAccountVerified: isAccountVerified,
    resetToken: resetToken,
    companyName: companyName,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension UserToSchemaMapper on User {
  UserSchema toSchema() => UserSchema()
    ..userId = id
    ..email = email
    ..phone = phone
    ..firstName = firstName
    ..lastName = lastName
    ..profilePicture = profilePicture
    ..isAccountVerified = isAccountVerified
    ..resetToken = resetToken
    ..companyName = companyName
    ..createdAt = createdAt
    ..updatedAt = updatedAt;
}

