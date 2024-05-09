import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/data/api_datasource_contract/all_categories_datasource_contract.dart';
import 'package:ecommerce_app/data/models/category_model/CategoryModel.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AllCategoriesContract )
class AllCategoriesImpl extends AllCategoriesContract{
  ApiManager apiManager ;
  @factoryMethod
  AllCategoriesImpl(this.apiManager);
  @override
  Future<Either<CategoryResponse, String>> getAllCategories() async {
    try{
      var response = await apiManager.getRequest(endPoint: EndPoint.allCategoriesEndPoint);
      var categories = CategoryResponse.fromJson(response);
      return Left(categories);

    }catch(error){
      return Right(error.toString());
    }
  }


}