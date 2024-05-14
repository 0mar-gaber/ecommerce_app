import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/user_entity.dart';

abstract class GetUserDataRepo{
  Future<Either<UserEntity,String>> getUserData(String userId);
}