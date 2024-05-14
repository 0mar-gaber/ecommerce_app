import 'package:ecommerce_app/core/DI/di.dart';
import 'package:ecommerce_app/core/local_storage/shared_prefrence_helper.dart';
import 'package:ecommerce_app/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/profile_tab/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../../core/reusable_components/dialog.dart';
import '../../../../../core/reusable_components/text_filed.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});


  @override
  Widget build(BuildContext context) {
    var userId =  getDataFromToken();
    return BlocProvider(
      create: (context) => getIt<ProfileViewModel>()..getUserData(userId),
      child: BlocBuilder<ProfileViewModel,ProfileState>(
        builder: (context, state) {
          if(state is ProfileSuccessState){
            return Container(
              margin: REdgeInsets.only(left: 16,right: 16,top: 25),
              child: ListView(
                  children:[ Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/svg/logo_svg.svg",width: 88.w,height: 44.h,),
                          Column(children: [
                            IconButton(
                              onPressed: (){
                                DialogUtil.showMessageDialog(
                                  context: context,
                                  message: "sure you want to log out ??",
                                  onOkPressed: () {
                                    PrefsHelper.clearToken();
                                    Navigator.pushNamed(context, LoginScreen.route);
                                  },
                                );

                              },
                              icon: Icon(Icons.logout_outlined,size: 30.sp,color: Theme.of(context).colorScheme.primary,),
                            ),
                          ],)
                        ],
                      ),
                      SizedBox(height: 24.h,),

                      Text(
                        "Welcome, ${state.userData!.name}",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary

                        ),
                      ),
                      SizedBox(height: 8.h,),
                      Text(
                        state.userData!.email!,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.6)

                        ),
                      ),
                      SizedBox(height: 20.h,),





                      Text(
                        "Your full name",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary

                        ),
                      ),
                      SizedBox(height: 20.h,),
                      EditText(
                        lapel: "  name",
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        formKay: GlobalKey(),
                        controller: TextEditingController(text: state.userData!.name),
                        iconButton:IconButton(onPressed: (){}, icon: Padding(
                          padding: REdgeInsets.all(19.5),
                          child:  Icon(Icons.edit,size: 24.h,),
                        )),

                      ),
                      SizedBox(height: 30.h,),


                      Text(
                        "Your E-mail",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary

                        ),
                      ),
                      SizedBox(height: 20.h,),
                      EditText(
                        lapel: "  name",
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        formKay: GlobalKey(),
                        controller: TextEditingController(text: state.userData!.email),
                        iconButton:IconButton(onPressed: (){}, icon: Padding(
                          padding: REdgeInsets.all(19.5),
                          child:  Icon(Icons.edit,size: 24.h,),
                        )),

                      ),
                      SizedBox(height: 30.h,),



                      Text(
                        "Your password",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary

                        ),
                      ),
                      SizedBox(height: 20.h,),
                      EditText(
                        lapel: "  password",
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        formKay: GlobalKey(),
                        controller: TextEditingController(text: "password"),
                        iconButton:IconButton(onPressed: (){}, icon: Padding(
                          padding: REdgeInsets.all(19.5),
                          child:  Icon(Icons.edit,size: 24.h,),
                        )),

                      ),
                      SizedBox(height: 30.h,),

                      Text(
                        "Your mobile number",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary

                        ),
                      ),
                      SizedBox(height: 20.h,),
                      EditText(
                        lapel: "  name",
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        formKay: GlobalKey(),
                        maxLength: 11,
                        controller: TextEditingController(text: state.userData!.phone),
                        iconButton:IconButton(onPressed: (){}, icon: Padding(
                          padding: REdgeInsets.all(19.5),
                          child:  Icon(Icons.edit,size: 24.h,),
                        )),

                      )

                    ],
                  ),
                  ]),
            );
          }
          if(state is ProfileErrorState){
            return Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.refresh,
                    color: Theme.of(context).colorScheme.primary,
                    size: 100.sp,
                  )),
            );

          }
          return  const Center(
            child: CircularProgressIndicator(),
          );

        },
      ),
    );
  }

  getDataFromToken(){
    Map<String, dynamic> decodedToken = JwtDecoder.decode(PrefsHelper.getToken());
    return decodedToken["id"] ;
  }
}
