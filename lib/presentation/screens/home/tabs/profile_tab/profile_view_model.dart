import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/use_cases/profile_cases/get_user_data_case.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState>{
  GetUserDataUseCase getUserDataUseCase ;
  @factoryMethod
  ProfileViewModel(this.getUserDataUseCase):super(ProfileInitState());
  getUserData(String userId) async {
    emit(ProfileLoadingState());
   var userData = await getUserDataUseCase.call(userId);
   userData.fold(
           (user) => emit(ProfileSuccessState(user)),
           (errorMessage) => emit(ProfileErrorState(errorMessage))
   );
  }


}
abstract class ProfileState{}

class ProfileInitState extends ProfileState{}
class ProfileLoadingState extends ProfileState{}
class ProfileErrorState extends ProfileState{
  String? errorMessage ;
  ProfileErrorState(this.errorMessage);
}
class ProfileSuccessState extends ProfileState{
  UserEntity? userData ;
  ProfileSuccessState(this.userData);

}