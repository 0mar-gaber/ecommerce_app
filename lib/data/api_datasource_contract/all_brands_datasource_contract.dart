import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/brand_model/BrandsResponse.dart';

abstract class AllBrandsDatasourceContract{
  Future<Either<BrandsResponse,String>> getAllBrands();
}