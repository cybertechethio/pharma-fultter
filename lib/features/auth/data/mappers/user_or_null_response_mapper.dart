import '../../domain/entities/user.dart';
import '../models/user_or_null_response_model.dart';
import 'user_mapper.dart';

extension UserOrNullResponseModelMapper on UserOrNullResponseModel {
  User? toDomain() => user?.toDomain();
}
