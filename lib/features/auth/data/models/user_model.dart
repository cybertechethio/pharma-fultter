// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(fromJson: _idFromJson) required String id,
    String? email,
    required String phone,
    required String firstName,
    required String lastName,
    String? avatar,
    @Default(false) bool isAccountVerified,
    String? resetToken,
    String? companyName,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json); 
}

/// Helper function to convert id from int to String
String _idFromJson(dynamic value) {
  print('🔍 ID CONVERSION DEBUG:');
  print('📍 Input Value: $value');
  print('📍 Input Type: ${value.runtimeType}');
  
  if (value is int) {
    final result = value.toString();
    print('📍 Converted int to String: $result');
    return result;
  } else if (value is String) {
    print('📍 Already String: $value');
    return value;
  } else {
    print('❌ UNEXPECTED TYPE FOR ID:');
    print('📍 Value: $value');
    print('📍 Type: ${value.runtimeType}');
    throw ArgumentError('Expected int or String for id, got ${value.runtimeType}');
  }
}