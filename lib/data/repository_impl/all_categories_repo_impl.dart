import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_datasource_contract/all_categories_datasource_contract.dart';
import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:ecommerce_app/domain/repository_contract/all_categories_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AllCategoriesRepo)
class AllCategoriesRepoImpl extends AllCategoriesRepo{
  AllCategoriesContract allCategoriesContract;
  @factoryMethod
  AllCategoriesRepoImpl(this.allCategoriesContract);
  @override
  Future<Either<List<CategoryEntity>, String>> getAllCategories() async {

    var result = await allCategoriesContract.getAllCategories();
    return result.fold(
            (response) {
              var responseList = response.data??[];
              var allCategoriesList = responseList.map((category) => CategoryEntity(
                  id: category.id,
                  image: category.image,
                  name: category.name,
                  slug: category.slug
              )).toList();
              return Left(allCategoriesList);

            },
            (error) => Right(error)
    );

  }

}