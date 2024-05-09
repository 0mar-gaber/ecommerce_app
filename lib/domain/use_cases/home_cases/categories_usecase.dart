import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:ecommerce_app/domain/repository_contract/all_categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesUseCase{
  AllCategoriesRepo allCategoriesRepo ;
  @factoryMethod
  CategoriesUseCase(this.allCategoriesRepo);
  Future<Either<List<CategoryEntity>, String>> call(){
    return allCategoriesRepo.getAllCategories();
  }

}
