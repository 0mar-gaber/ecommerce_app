import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_datasource_contract/get_user_data_datasource_contract.dart';
import 'package:ecommerce_app/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository_contract/get_user_data_repo.dart';

@Injectable(as: GetUserDataRepo)
class GetUserDataRepoImpl extends GetUserDataRepo{
  GetUserDataDatasourceContract getUserDataDatasourceContract ;
  @factoryMethod
  GetUserDataRepoImpl(this.getUserDataDatasourceContract);
  @override
  Future<Either<UserEntity, String>> getUserData(String userId) async {
    var result = await getUserDataDatasourceContract.getUserData(userId) ;
    return result.fold(
            (response) {
              var userResponse = UserEntity(
                email: response.data?.email,
                name: response.data?.name,
                id: response.data?.id,
                phone: response.data?.phone,
              );
              return Left(userResponse);
            },
            (error) => Right(error)
    );
  }

}