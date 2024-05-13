import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_datasource_contract/auth_datasource_contract.dart';
import 'package:ecommerce_app/domain/entities/AuthEntity.dart';
import 'package:ecommerce_app/domain/repository_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo{
  AuthDatasourceContract authDatasourceContract ;
  @factoryMethod
  AuthRepoImpl(this.authDatasourceContract);
  @override
  Future<Either<AuthEntity, String>> signup(String userName, String userEmail, String userPassword, String userPhone) async {
    var result = await authDatasourceContract.signup(userName, userEmail, userPassword, userPhone);

    return result.fold(
            (response) {
              AuthEntity entity =  AuthEntity(
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
  Future<Either<AuthEntity, String>> login(String userEmail, String userPassword) async {
    var result = await authDatasourceContract.login(userEmail, userPassword);
    return result.fold(
            (response) {
          AuthEntity entity =  AuthEntity(
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