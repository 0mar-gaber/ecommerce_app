import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/use_cases/home_cases/categories_usecase.dart';
@injectable
class CategoriesViewModel extends Cubit<CategoriesState> {
  CategoriesUseCase categoriesUseCase ;
  @factoryMethod
  CategoriesViewModel(this.categoriesUseCase):super(CategoriesInitState());

  gelAllCategories() async {
    emit(CategoriesLoadingState());
    var result = await categoriesUseCase.call();
    result.fold(
            (categories) => emit(CategoriesSuccessState(categories)),
            (error) => emit(CategoriesErrorState(error.toString()))
    );
  }

}
abstract class CategoriesState{}
class CategoriesInitState extends CategoriesState{}
class CategoriesLoadingState extends CategoriesState{}
class CategoriesErrorState extends CategoriesState{
  String? errorMessage ;
  CategoriesErrorState(this.errorMessage);
}
class CategoriesSuccessState extends CategoriesState{
  List<CategoryEntity>? categoryList  ;
  CategoriesSuccessState(this.categoryList);
}