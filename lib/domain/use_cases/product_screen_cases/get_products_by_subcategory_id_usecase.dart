import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository_contract/products_by_subcategory_id_repo.dart';
import 'package:injectable/injectable.dart';

import '../../entities/ProductEntity.dart';

@injectable
class GetProductsBySubcategoryIdUsecase {
  ProductsBySubcategoryIdRepo productsBySubcategoryIdRepo;

  @factoryMethod
  GetProductsBySubcategoryIdUsecase(this.productsBySubcategoryIdRepo);

  Future<Either<List<ProductEntity>, String>> call(String subcategoryId) {
    return productsBySubcategoryIdRepo
        .getProductsBySubcategoryId(subcategoryId);
  }
}
