import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/data/models/auth_model/AuthResponse.dart';
import 'package:injectable/injectable.dart';

import '../api_datasource_contract/auth_datasource_contract.dart';

@Injectable(as: AuthDatasourceContract)
class AuthDatasourceImpl extends AuthDatasourceContract{
  ApiManager apiManager ;
  @factoryMethod
  AuthDatasourceImpl(this.apiManager);
  @override
  Future<Either<AuthResponse, String>> signup( String userName ,String userEmail, String userPassword,String userPhone) async {
    try{
      var request =  await apiManager.postRequest(
          endPoint: EndPoint.signupEndPoint,
          body:{
            "name": userName,
            "email":userEmail,
            "password":userPassword,
            "rePassword":userPassword,
            "phone":userPhone
          }
      );

      var signupResponse = AuthResponse.fromJson(request.data);
      if(signupResponse.statusMsg!=null){
        return Right(signupResponse.message??"some thing went wrong");
      }
      return Left(signupResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

  @override
  Future<Either<AuthResponse, String>> login(String userEmail, String userPassword) async {
    try{
      var request = await apiManager.postRequest(
          endPoint: EndPoint.loginEndPoint,
          body:{
            "email":userPassword,
            "password":userPassword
          }
      );

      var loginRequest = AuthResponse.fromJson(request.data);

      if(loginRequest.statusMsg!=null){
        return Right("if ${loginRequest.message}some thing error");
      }
      return Left(loginRequest);
    }catch(error){
      return Right(error.toString());
    }
  }
  

}