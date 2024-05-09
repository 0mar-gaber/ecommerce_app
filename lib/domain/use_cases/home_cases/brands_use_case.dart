import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:ecommerce_app/domain/repository_contract/all_brands_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandUsecase{
  AllBrandsRepo allBrandsRepo ;
  @factoryMethod
  BrandUsecase(this.allBrandsRepo);
  Future<Either<List<BrandEntity>, String>> call(){
    return allBrandsRepo.getAllBrands();
  }
}