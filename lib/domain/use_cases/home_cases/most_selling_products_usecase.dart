import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:ecommerce_app/domain/repository_contract/product_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class MostSellingProductsUsecase{
  ProductsRepo productsRepo;
  @factoryMethod
  MostSellingProductsUsecase(this.productsRepo);
  Future <Either<List<ProductEntity>,String>> call(){
    return productsRepo.getMostSellingProduct();
  }
}