import 'package:dartz/dartz.dart';
import '../models/product_model/ProductResponse.dart';

abstract class ProductDatasourceContract {
  Future<Either<ProductResponse,String>> getMostSellingProduct();
}