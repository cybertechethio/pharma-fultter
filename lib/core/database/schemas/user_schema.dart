import 'package:isar_community/isar.dart';

part 'user_schema.g.dart';

@collection
class UserSchema {
  Id id = Isar.autoIncrement; // Isar internal ID
  
  @Index(unique: true)
  late String userId; // User ID from API
  
  String? email;
  late String phone;
  late String firstName;
  late String lastName;
  String? profilePicture;
  late bool isAccountVerified;
  String? resetToken;
  String? companyName;
  late DateTime createdAt;
  DateTime? updatedAt;
}

