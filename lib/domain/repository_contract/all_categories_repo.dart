import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';

abstract class AllCategoriesRepo{
  Future<Either<List<CategoryEntity>,String>> getAllCategories();
}