import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/user_model/UserResponse.dart';

abstract class AuthDatasourceContract{
  Future<Either<UserResponse,String>> signup(String userName ,String userEmail, String userPassword,String userPhone);
  Future<Either<UserResponse,String>> login(String userEmail, String userPassword);
}