import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/use_cases/home_cases/brands_use_case.dart';

@injectable
class BrandViewModel extends Cubit<BrandState>{
  BrandUsecase brandsUsecase ;
  BrandViewModel(this.brandsUsecase):super(BrandInitState());
  getAllBrands() async {
    emit(BrandLoadingState());
    var result = await brandsUsecase.call();
    result.fold(
            (brands) => emit(BrandSuccessState(brands)),
            (error) => emit(BrandErrorState(error.toString()))
    );
  }

}

abstract class BrandState{}
class BrandInitState extends BrandState{}
class BrandLoadingState extends BrandState{}
class BrandErrorState extends BrandState{
  String? errorMessage;
  BrandErrorState(this.errorMessage);
}
class BrandSuccessState extends BrandState{
  List<BrandEntity>? brandsList ;
  BrandSuccessState(this.brandsList);
}