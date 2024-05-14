import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/data/api_datasource_contract/get_user_data_datasource_contract.dart';
import 'package:ecommerce_app/data/models/user_model/UserResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetUserDataDatasourceContract)
class GetUserDataDatasourceImpl extends GetUserDataDatasourceContract{
  ApiManager apiManager;
  @factoryMethod
  GetUserDataDatasourceImpl(this.apiManager);

  @override
  Future<Either<UserResponse, String>> getUserData(String userId) async {
    try{
      var response = await apiManager.getRequest(endPoint: "${EndPoint.userEndPoint}$userId");
      var userResponse = UserResponse.fromJson(response);
      if(userResponse.message!=null){
        return Right(userResponse.message??"some thing went wrong");
      }
      return Left(userResponse);
    }catch(error){
      return Right(error.toString());
    }
  }
}