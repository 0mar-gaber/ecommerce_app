import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/user_entity.dart';
import 'package:ecommerce_app/domain/repository_contract/get_user_data_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataUseCase{
  GetUserDataRepo getUserDataRepo;
  @factoryMethod
  GetUserDataUseCase(this.getUserDataRepo);
  Future<Either<UserEntity, String>> call(String userId){
    return getUserDataRepo.getUserData(userId);
  }
}