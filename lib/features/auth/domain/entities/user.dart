import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    String? email,
    required String phone,
    required String firstName,
    required String lastName,
    String? profilePicture,
    required bool isAccountVerified,
    String? resetToken,
    String? companyName,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _User;

}

/// Extension methods for User
extension UserX on User {
  String get fullName => '$firstName $lastName';
  String get displayName {
    if (lastName.isNotEmpty) {
      return '$firstName ${lastName[0].toUpperCase()}.';
    }
    return firstName;
  }

  /// Check if user has completed profile
  bool get hasCompleteProfile => 
      firstName.isNotEmpty && 
      lastName.isNotEmpty && 
      (email?.isNotEmpty ?? true) && 
      phone.isNotEmpty;

}
