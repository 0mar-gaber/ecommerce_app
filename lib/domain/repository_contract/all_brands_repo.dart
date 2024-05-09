import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/BrandEntity.dart';

abstract class AllBrandsRepo {
  Future<Either<List<BrandEntity>,String>> getAllBrands();
}