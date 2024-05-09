import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/data/api_datasource_contract/all_brands_datasource_contract.dart';
import 'package:ecommerce_app/data/models/brand_model/BrandsResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AllBrandsDatasourceContract)
class AllBrandsDataSourceImpl extends AllBrandsDatasourceContract {
  ApiManager apiManager ;
  @factoryMethod
  AllBrandsDataSourceImpl(this.apiManager);
  @override
  Future<Either<BrandsResponse, String>> getAllBrands() async {
    try{
      var response = await apiManager.getRequest(endPoint: EndPoint.allBrandsEndPoint);
      var allBrandResponse = BrandsResponse.fromJson(response);
      return Left(allBrandResponse);
    }catch(error){
      return Right(error.toString());
    }

  }

}