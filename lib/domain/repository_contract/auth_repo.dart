import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/UserEntity.dart';

abstract class AuthRepo{
  Future<Either<UserEntity,String>> signup(String userName ,String userEmail, String userPassword,String userPhone);
  Future<Either<UserEntity,String>> login(String userEmail, String userPassword);
}