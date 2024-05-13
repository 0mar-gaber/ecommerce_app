import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/product_screen_cases/get_products_by_subcategory_id_usecase.dart';
@injectable
class ProductsBySubcategoryIdViewModel extends Cubit<ProductsBySubcategoryIdState>{
  GetProductsBySubcategoryIdUsecase usecase ;
  @factoryMethod
  ProductsBySubcategoryIdViewModel(this.usecase):super(ProductsBySubcategoryIdInitState());

  getProducts(String subcategoryId) async {
    emit(ProductsBySubcategoryIdLoadingState());
    var result = await usecase.call(subcategoryId);
    result.fold(
            (products) => emit(ProductsBySubcategoryIdSuccessState(products)),
            (error) => emit(ProductsBySubcategoryIdErrorState(error))
    );
    return usecase.call(subcategoryId);
  }

}
abstract class ProductsBySubcategoryIdState{}
 class ProductsBySubcategoryIdInitState extends ProductsBySubcategoryIdState {}
 class ProductsBySubcategoryIdLoadingState extends ProductsBySubcategoryIdState {}
 class ProductsBySubcategoryIdErrorState extends ProductsBySubcategoryIdState {
  String? errorMessage ;
  ProductsBySubcategoryIdErrorState(this.errorMessage);
 }
 class ProductsBySubcategoryIdSuccessState extends ProductsBySubcategoryIdState {
  List<ProductEntity>? productsList;
  ProductsBySubcategoryIdSuccessState(this.productsList);
 }