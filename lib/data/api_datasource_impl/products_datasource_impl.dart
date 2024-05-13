import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/data/api_datasource_contract/product_datasource_contract.dart';
import 'package:ecommerce_app/data/models/product_model/ProductResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductDatasourceContract)
class ProductDatasourceImpl extends ProductDatasourceContract{
  ApiManager apiManager;
  @factoryMethod
  ProductDatasourceImpl(this.apiManager);
  @override
  Future<Either<ProductResponse, String>> getMostSellingProduct() async {
   try{
     var response = await apiManager.getRequest(endPoint: EndPoint.productsEndPoint,queryParameters: {"sort":"-sold"});
     var productResponse = ProductResponse.fromJson(response);
     return Left(productResponse);

   }catch(error){
     return Right(error.toString());
   }


  }

}