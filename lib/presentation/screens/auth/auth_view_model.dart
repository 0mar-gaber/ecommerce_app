import 'package:ecommerce_app/domain/entities/UserEntity.dart';
import 'package:ecommerce_app/domain/use_cases/auth_cases/auth_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthViewModel extends Cubit<AuthViewModelState>{

  SignupUseCase useCase ;

  @factoryMethod
  AuthViewModel(this.useCase):super(AuthViewModelInitState());
  static AuthViewModel get(BuildContext context)=>BlocProvider.of(context);


  signup(String userName ,String userEmail, String userPassword,String userPhone) async {
    emit(SignupViewModelLoadingState());
    var request = await useCase.callSignup(userName, userEmail, userPassword, userPhone);

    request.fold(
            (response) => emit(SignupViewModelSuccessState(response)),
            (error) => emit(SignupViewModelErrorState(error))
    );
  }


  login(String userEmail, String userPassword) async{
    emit(LoginViewModelLoadingState());
    var request = await useCase.callLogin( userEmail, userPassword);

    request.fold(
            (response) => emit(LoginViewModelSuccessState(response)),
            (error) => emit(LoginViewModelErrorState(error))
    );
  }

}

abstract class AuthViewModelState {}


class AuthViewModelInitState extends AuthViewModelState {}


class SignupViewModelLoadingState extends AuthViewModelState {}
class SignupViewModelErrorState extends AuthViewModelState {
  String ? errorMessage ;
  SignupViewModelErrorState(this.errorMessage);
}
class SignupViewModelSuccessState extends AuthViewModelState {
  UserEntity? userEntity ;
  SignupViewModelSuccessState(this.userEntity);
}

class LoginViewModelLoadingState extends AuthViewModelState {}
class LoginViewModelErrorState extends AuthViewModelState {
  String ? errorMessage ;
  LoginViewModelErrorState(this.errorMessage);
}
class LoginViewModelSuccessState extends AuthViewModelState {
  UserEntity? userEntity ;
  LoginViewModelSuccessState(this.userEntity);
}

