import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/data/api_datasource_contract/sub_category_datasource_contract.dart';
import 'package:ecommerce_app/data/models/sub_category_model/SubCategoryResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SubCategoryDatasourceContract)
class SubCategoryDatasourceImpl extends SubCategoryDatasourceContract{
  ApiManager apiManager ;
  SubCategoryDatasourceImpl(this.apiManager);
  @override
  Future<Either<SubCategoryResponse, String>> getSubCategorise(String categoryId) async {
   try{
     var response =  await apiManager.getRequest(endPoint: "${EndPoint.allCategoriesEndPoint}/$categoryId/subcategories");
     var subCategoryResponse = SubCategoryResponse.fromJson(response);
     return Left(subCategoryResponse);
   }catch(error){
     return Right(error.toString());
   }
  }

}