import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/sub_category_model/SubCategoryResponse.dart';

abstract class SubCategoryDatasourceContract{
  Future<Either<SubCategoryResponse,String>> getSubCategorise(String categoryId);
}