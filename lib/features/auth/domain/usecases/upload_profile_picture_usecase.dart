import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class UploadProfilePictureUseCase {
  final AuthRepository _repository;

  UploadProfilePictureUseCase(this._repository);

  Future<Either<Failure, User>> call({
    required File imageFile,
  }) async {
    return await _repository.uploadProfilePicture(imageFile: imageFile);
  }
}
