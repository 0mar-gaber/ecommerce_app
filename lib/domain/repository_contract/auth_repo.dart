import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/AuthEntity.dart';

abstract class AuthRepo{
  Future<Either<AuthEntity,String>> signup(String userName ,String userEmail, String userPassword,String userPhone);
  Future<Either<AuthEntity,String>> login(String userEmail, String userPassword);
}