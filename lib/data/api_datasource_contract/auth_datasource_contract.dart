import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/auth_model/AuthResponse.dart';

abstract class AuthDatasourceContract{
  Future<Either<AuthResponse,String>> signup(String userName ,String userEmail, String userPassword,String userPhone);
  Future<Either<AuthResponse,String>> login(String userEmail, String userPassword);
}