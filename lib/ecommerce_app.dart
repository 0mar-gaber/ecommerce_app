import 'package:ecommerce_app/core/local_storage/shared_prefrence_helper.dart';
import 'package:ecommerce_app/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce_app/presentation/screens/auth/register_screen.dart';
import 'package:ecommerce_app/presentation/screens/home/home_screen.dart';
import 'package:ecommerce_app/presentation/screens/home/home_screen_provider.dart';
import 'package:ecommerce_app/presentation/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'config/theme.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
    ));
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.route: (context) => ChangeNotifierProvider(
            create: (context) => HomeScreenProvider(),
              child:   HomeScreen()),
          LoginScreen.route: (context) => const LoginScreen(),
          RegisterScreen.route: (context) => const RegisterScreen(),
          ProductsScreen.route:(context)=>const ProductsScreen()
        },
        initialRoute: PrefsHelper.getToken().isNotEmpty
            ? LoginScreen.route
            : HomeScreen.route
        ,
        // initialRoute: HomeScreen.route,
        theme: AppTheme.theme,

      ),
    );
  }
}
