import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<Either<Failure, User>> call({
    required String phone,
    String? email,
    required String password,
    required String firstName,
    required String lastName,
    required String companyName,
  }) async {
    print('6...................................................🚀 REGISTER USE CASE STARTED:');
    print('📍 Phone: $phone');
    print('📍 Email: $email');
    print('📍 First Name: $firstName');
    print('📍 Last Name: $lastName');
    print('📍 Company Name: $companyName');
    
    print('7...................................................🚀 CALLING REPOSITORY:');
    final result = await _repository.register(
      phone: phone,
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      companyName: companyName,
    );
    
    print('8...................................................🚀 REPOSITORY RESULT: $result');
    return result;
  }
}
