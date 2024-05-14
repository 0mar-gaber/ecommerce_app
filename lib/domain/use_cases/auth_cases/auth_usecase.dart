import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../entities/AuthEntity.dart';

@injectable
class SignupUseCase{
  AuthRepo signupRepo ;
  @factoryMethod
  SignupUseCase(this.signupRepo);
  Future<Either<AuthEntity,String>> callSignup(String userName ,String userEmail, String userPassword,String userPhone) {
   return signupRepo.signup(userName, userEmail, userPassword, userPhone);
  }
  Future<Either<AuthEntity,String>> callLogin(String userEmail, String userPassword) {
   return signupRepo.login( userEmail,userPassword);
  }

}