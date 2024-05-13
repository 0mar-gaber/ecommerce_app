import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_datasource_contract/products_by_category_id_contract.dart';

import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/Brand.dart';
import '../../domain/entities/Category.dart';
import '../../domain/repository_contract/products_by_subcategory_id_repo.dart';
@Injectable(as: ProductsBySubcategoryIdRepo)
class ProductsBySubcategoryIdRepoImpl extends ProductsBySubcategoryIdRepo{
  ProductsBySubCategoryId productsBySubCategoryId ;
  @factoryMethod
  ProductsBySubcategoryIdRepoImpl(this.productsBySubCategoryId);
  @override
  Future<Either<List<ProductEntity>, String>> getProductsBySubcategoryId(String subcategoryId) async {
    var result = await productsBySubCategoryId.getProductsBySubCategoryId(subcategoryId);
    return result.fold(
            (response) {
          var responseList = response.data??[];
          var mostSellingProducts = responseList.map((product) => ProductEntity(
            id: product.id,
            slug: product.slug,
            images: product.images,
            price: product.price,
            description: product.description,
            ratingsAverage: product.ratingsAverage,
            imageCover: product.imageCover,
            quantity: product.quantity,
            sold: product.sold,
            title: product.title,
            category: Category(
              id: product.category?.id,
              slug: product.category?.slug,
              name: product.category?.name,
              image: product.category?.image,
            ),
            brand: Brand(
              id: product.brand?.id,
              image: product.brand?.image,
              name: product.brand?.name,
              slug: product.brand?.slug,
            ),

          )).toList();
          return Left(mostSellingProducts);

        },
            (error) => Right(error)
    );
  }

}