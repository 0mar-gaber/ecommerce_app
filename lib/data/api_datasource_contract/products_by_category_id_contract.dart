import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/product_model/ProductResponse.dart';

abstract class ProductsBySubCategoryId{
  Future<Either<ProductResponse,String>> getProductsBySubCategoryId(String subcategoryId);
}