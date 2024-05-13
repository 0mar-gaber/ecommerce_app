import 'package:ecommerce_app/core/DI/di.dart';
import 'package:ecommerce_app/presentation/screens/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/constant.dart';
import '../../../core/local_storage/shared_prefrence_helper.dart';
import '../../../core/reusable_components/text_filed.dart';
import '../home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String route = "register screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController fullName = TextEditingController();
  GlobalKey<FormState> formKay = GlobalKey();
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<AuthViewModel>(),
        child: ListView(children: [
          Container(
            margin: REdgeInsets.only(
              right: 16,
              left: 16,
            ),
            child: Form(
              key: formKay,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SvgPicture.asset(
                    "assets/svg/logo_svg.svg",
                    width: 237.w,
                    height: 71.1.h,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Full Name",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  EditText(
                    controller: fullName,
                    keyboardType: TextInputType.name,
                    lapel: "Please Enter Your Name",
                    obscureText: false,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Name should\'t be empty ';
                      }
                      return null;
                    },
                    formKay: formKay,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  EditText(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    lapel: "Please Enter Your Email",
                    obscureText: false,
                    validate: (value) {
                      if (!RegExp(Constant.emailRegex).hasMatch(value!)) {
                        return "Enter valid email";
                      }
                      if (value.isEmpty) {
                        return 'Email should\'t be empty ';
                      }
                      return null;
                    },
                    formKay: formKay,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    "Phone",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  EditText(
                    controller: phoneNumber,
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    lapel: "Please Enter Your phone number",
                    obscureText: false,
                    formKay: formKay,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  EditText(
                    iconButton: visible
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            icon: Container(
                                padding: REdgeInsets.all(10),
                                child: const Icon(Icons.visibility)),
                            color: Theme.of(context).colorScheme.onBackground)
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            icon: Container(
                                padding: REdgeInsets.all(10),
                                child: const Icon(Icons.visibility_off)),
                            color: Theme.of(context).colorScheme.onBackground),
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    lapel: "Please Enter Your Password ",
                    obscureText: !visible,
                    validate: (value) {
                      if (value!.length < 8) {
                        return 'Password should\'t be less than 8 characters ';
                      }
                      return null;
                    },
                    formKay: formKay,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Forgot password",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  BlocConsumer<AuthViewModel, AuthViewModelState>(
                      listener: (context, state) {
                    if (state is SignupViewModelErrorState) {
                      Fluttertoast.showToast(
                          toastLength: Toast.LENGTH_SHORT,
                          msg: state.errorMessage ?? "sign up error",
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0.sp);
                    }
                    if (state is SignupViewModelSuccessState) {
                      Fluttertoast.showToast(
                          msg: "User created successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0.sp);
                      PrefsHelper.setToken(state.userEntity!.token!);
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeScreen.route, (route) => false);
                    }
                  }, builder: (context, state) {
                    if (state is SignupViewModelLoadingState) {
                      return OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size(double.infinity, 45.h),
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                        ),
                        child: Center(
                          child: Transform.scale(
                            scale: .5.sp,
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      );
                    }
                    return OutlinedButton(
                      onPressed: () {
                        if (formKay.currentState!.validate()) {
                          AuthViewModel.get(context).signup(
                              fullName.text,
                              emailController.text,
                              passwordController.text,
                              phoneNumber.text);
                        } else {
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(double.infinity, 45.h),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                      ),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

}
