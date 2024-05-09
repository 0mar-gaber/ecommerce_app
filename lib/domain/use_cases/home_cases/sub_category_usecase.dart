import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/Subcategory.dart';
import 'package:ecommerce_app/domain/repository_contract/sub_category_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class SubCategoryUseCase{
  SubCategoryRepo subCategoryRepo ;
  @factoryMethod
  SubCategoryUseCase(this.subCategoryRepo);
  Future<Either<List<SubcategoryEntity>,String>> call(String categoryId){
    return subCategoryRepo.getSubCategorise(categoryId);
  }
}