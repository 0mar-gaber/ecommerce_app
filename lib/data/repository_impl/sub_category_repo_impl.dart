import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_datasource_contract/sub_category_datasource_contract.dart';
import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:ecommerce_app/domain/entities/Subcategory.dart';
import 'package:ecommerce_app/domain/repository_contract/sub_category_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SubCategoryRepo)
class SubCategoryRepoImpl extends SubCategoryRepo{
  SubCategoryDatasourceContract subCategoryDatasourceContract ;
  @factoryMethod
  SubCategoryRepoImpl(this.subCategoryDatasourceContract);
  @override
  Future<Either<List<SubcategoryEntity>, String>> getSubCategorise(String categoryId) async {
    var result = await subCategoryDatasourceContract.getSubCategorise(categoryId);
    return result.fold(
            (subCategorise) {
              var responseList = subCategorise.data??[];
              var categoriseList = responseList.map((subCategory) => SubcategoryEntity(
                id: subCategory.id,
                slug: subCategory.slug,
                name: subCategory.name,
                category: subCategory.category,
              )).toList();

              return Left(categoriseList);
            },
            (error) => Right(error)
    );
  }

}