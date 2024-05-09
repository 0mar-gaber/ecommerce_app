import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_datasource_contract/product_datasource_contract.dart';
import 'package:ecommerce_app/domain/entities/Brand.dart';
import 'package:ecommerce_app/domain/entities/Category.dart';
import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:ecommerce_app/domain/repository_contract/product_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo{
  ProductDatasourceContract productDatasourceContract ;
  @factoryMethod
  ProductsRepoImpl(this.productDatasourceContract);

  @override
  Future<Either<List<ProductEntity>, String>> getMostSellingProduct() async {
    var result = await productDatasourceContract.getMostSellingProduct();
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