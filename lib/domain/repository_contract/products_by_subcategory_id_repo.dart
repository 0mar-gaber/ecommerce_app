import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/ProductEntity.dart';

abstract class ProductsBySubcategoryIdRepo{
  Future<Either<List<ProductEntity>,String>> getProductsBySubcategoryId(String subcategoryId);
}