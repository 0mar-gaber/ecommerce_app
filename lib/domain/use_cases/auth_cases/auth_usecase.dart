import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../entities/UserEntity.dart';

@injectable
class SignupUseCase{
  AuthRepo signupRepo ;
  @factoryMethod
  SignupUseCase(this.signupRepo);
  Future<Either<UserEntity,String>> callSignup(String userName ,String userEmail, String userPassword,String userPhone) {
   return signupRepo.signup(userName, userEmail, userPassword, userPhone);
  }
  Future<Either<UserEntity,String>> callLogin(String userEmail, String userPassword) {
   return signupRepo.login( userEmail,userPassword);
  }

}