import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/Subcategory.dart';

abstract class SubCategoryRepo{
  Future<Either<List<SubcategoryEntity>,String>> getSubCategorise(String categoryId);
}