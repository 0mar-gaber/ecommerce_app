import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/use_cases/home_cases/categories_usecase.dart';

@injectable
class LeftSideViewModel extends Cubit<LeftSideState> {
  CategoriesUseCase categoriesUseCase;

  @factoryMethod
  LeftSideViewModel(this.categoriesUseCase) : super(LeftSideInitState());

  getCategorise() async {
    emit(LeftSideLoadingState());
    var result = await categoriesUseCase.call();
    return result.fold((categorise) => emit(LeftSideSuccessState(categorise)),
        (error) => emit(LeftSideErrorState(error)));
  }
}

abstract class LeftSideState {}

class LeftSideInitState extends LeftSideState {}

class LeftSideLoadingState extends LeftSideState {}

class LeftSideErrorState extends LeftSideState {
  String? errorMessage;

  LeftSideErrorState(this.errorMessage);
}

class LeftSideSuccessState extends LeftSideState {
  List<CategoryEntity>? categoriseList;

  LeftSideSuccessState(this.categoriseList);
}
