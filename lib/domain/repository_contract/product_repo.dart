import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/ProductEntity.dart';

abstract class ProductsRepo{
  Future<Either<List<ProductEntity>,String>> getMostSellingProduct();
}