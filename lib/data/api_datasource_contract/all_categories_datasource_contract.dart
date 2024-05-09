import 'package:dartz/dartz.dart';

import '../models/category_model/CategoryModel.dart';

abstract class AllCategoriesContract{
  Future<Either<CategoryResponse,String>> getAllCategories();
}