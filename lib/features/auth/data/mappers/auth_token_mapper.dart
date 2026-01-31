import '../../domain/entities/auth_token.dart';
import '../models/auth_token_model.dart';

extension AuthTokenModelMapper on AuthTokenModel {
  AuthToken toDomain() => AuthToken(
    accessToken: accessToken,
    refreshToken: refreshToken,
  );
}
