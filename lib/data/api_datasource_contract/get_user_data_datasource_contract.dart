import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/user_model/UserResponse.dart';

abstract class GetUserDataDatasourceContract {
  Future<Either<UserResponse,String>> getUserData(String userId);
}