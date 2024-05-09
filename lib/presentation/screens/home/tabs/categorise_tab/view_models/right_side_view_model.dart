import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/entities/Subcategory.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/use_cases/home_cases/sub_category_usecase.dart';
@injectable
class RightSideViewModel extends Cubit<RightSideState>{
  SubCategoryUseCase subCategoryUseCase;
  @FactoryMethod()
  RightSideViewModel(this.subCategoryUseCase):super(RightSideInitState());

  getSubCategorise(String categoryId) async {
    emit(RightSideLoadingState());
    var result = await subCategoryUseCase.call(categoryId);
    return result.fold(
            (categoriseList) => emit(RightSideSuccessState(categoriseList)),
            (error) => emit(RightSideErrorState(error))
    );
  }

}
abstract class  RightSideState {}
class RightSideInitState extends RightSideState {}
class RightSideLoadingState extends RightSideState {}
class RightSideErrorState extends RightSideState {
  String? errorMessage;
  RightSideErrorState(this.errorMessage);
}
class RightSideSuccessState extends RightSideState {
  List<SubcategoryEntity>? subCategoriseList ;
  RightSideSuccessState(this.subCategoriseList);
}