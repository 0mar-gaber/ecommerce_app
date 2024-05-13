import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/data/api_datasource_contract/products_by_category_id_contract.dart';
import 'package:ecommerce_app/data/models/product_model/ProductResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsBySubCategoryId)
class ProductsByCategoryIdImpl extends ProductsBySubCategoryId{
  ApiManager apiManager ;
  @factoryMethod
  ProductsByCategoryIdImpl(this.apiManager);
  @override
  Future<Either<ProductResponse, String>> getProductsBySubCategoryId(String subcategoryId) async {
   try{
     var response = await apiManager.getRequest(endPoint: EndPoint.productsEndPoint,queryParameters: {"subcategory":subcategoryId});
     var productResponse = ProductResponse.fromJson(response);
     return Left(productResponse);
   }catch(error){
     return Right(error.toString());
   }
  }
  
}