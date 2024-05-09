import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/use_cases/home_cases/most_selling_products_usecase.dart';
@injectable
class MostSellingProductsViewModel extends Cubit<MostSellingProductsState>{
  MostSellingProductsUsecase mostSellingProductsUsecase ;
  @factoryMethod
  MostSellingProductsViewModel(this.mostSellingProductsUsecase):super(MostSellingProductsInitState());
  getMostSellingProduct() async {
    emit(MostSellingProductsLoadingState());
    var result = await mostSellingProductsUsecase.call();
    result.fold(
            (products) => emit(MostSellingProductsSuccessState(products)),
            (error) => emit(MostSellingProductsErrorState(error.toString()))
    );
  }

}
abstract class MostSellingProductsState{}
class MostSellingProductsInitState extends MostSellingProductsState {}
class MostSellingProductsLoadingState extends MostSellingProductsState {}
class MostSellingProductsErrorState extends MostSellingProductsState {
  String? errorMessage ;
  MostSellingProductsErrorState(this.errorMessage);
}
class MostSellingProductsSuccessState extends MostSellingProductsState {
  List<ProductEntity>? productsList ;
  MostSellingProductsSuccessState(this.productsList);
}
