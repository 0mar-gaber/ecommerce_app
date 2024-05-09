import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_datasource_contract/all_brands_datasource_contract.dart';

import 'package:ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository_contract/all_brands_repo.dart';
@Injectable(as: AllBrandsRepo)
class AllBrandsRepoImpl extends AllBrandsRepo{
  AllBrandsDatasourceContract allBrandsDatasourceContract ;
  @factoryMethod
  AllBrandsRepoImpl(this.allBrandsDatasourceContract);
  @override
  Future<Either<List<BrandEntity>, String>> getAllBrands() async {
    var result = await allBrandsDatasourceContract.getAllBrands();
    return result.fold(
            (response) {
          var responseList = response.data??[];
          var allCategoriesList = responseList.map((category) => BrandEntity(
              id: category.id,
              image: category.image,
              name: category.name,
              slug: category.slug
          )).toList();
          return Left(allCategoriesList);

        },
            (error) => Right(error)
    );  }

}