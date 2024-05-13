import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_datasource_contract/auth_datasource_contract.dart';
import 'package:ecommerce_app/domain/entities/UserEntity.dart';
import 'package:ecommerce_app/domain/repository_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepo)
class SignupRepoImpl extends AuthRepo{
  AuthDatasourceContract signupDatasourceContract ;
  @factoryMethod
  SignupRepoImpl(this.signupDatasourceContract);
  @override
  Future<Either<UserEntity, String>> signup(String userName, String userEmail, String userPassword, String userPhone) async {
    var result = await signupDatasourceContract.signup(userName, userEmail, userPassword, userPhone);

    return result.fold(
            (response) {
              UserEntity entity =  UserEntity(
                name: response.user?.name,
                email: response.user?.email,
                role: response.user?.role,
                token: response.token,
              );
              return Left(entity);
            },
            (error) => Right(error)
    );

  }

  @override
  Future<Either<UserEntity, String>> login(String userEmail, String userPassword) async {
    var result = await signupDatasourceContract.login(userEmail, userPassword);
    return result.fold(
            (response) {
          UserEntity entity =  UserEntity(
            name: response.user?.name,
            email: response.user?.email,
            role: response.user?.role,
            token: response.token,
          );
          return Left(entity);
        },
            (error) => Right(error)
    );
  }

}