import 'package:ecommerce_app/core/utils/assets_manger.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/categorise_tab/categorise_tab.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/home_tab/home_tab.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/profile_tab.dart';
import 'package:ecommerce_app/presentation/screens/home/tabs/wishlist_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'home_screen_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "home screen";



    HomeScreen({super.key});

  List<Widget> tabs = [
     HomeTab(),
     CategoryTab(),
    const WishlistTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeScreenProvider = Provider.of<HomeScreenProvider>(context);

    return Scaffold(

      body: tabs[homeScreenProvider.currentBottomNavBarItem],


      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        items:  <BottomNavigationBarItem>[
          bottomNavigationBarItem(AssetsManger.homeIcon, "", context, 0,AssetsManger.homeIconSelected),
          bottomNavigationBarItem(AssetsManger.categoriesIcon, "", context, 1,AssetsManger.categoriesIconSelected),
          bottomNavigationBarItem(AssetsManger.wishlistIcon, "", context, 2,AssetsManger.wishlistIconSelected),
          bottomNavigationBarItem(AssetsManger.profileIcon, "", context, 3,AssetsManger.profileIconSelected),
        ],
        onTap: (index) {
          homeScreenProvider.changeSelectedItem(index);
        },
        currentIndex: homeScreenProvider.currentBottomNavBarItem,
      ),
    );
  }

  bottomNavigationBarItem(String svgUrl,String lapel,BuildContext context,int index ,String selectedSvgUrl){
    HomeScreenProvider homeScreenProvider = Provider.of<HomeScreenProvider>(context,listen: false);

    BottomNavigationBarItem bottomNavigationBarItem = BottomNavigationBarItem(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        icon: SvgPicture.asset(
          homeScreenProvider.currentBottomNavBarItem== index? selectedSvgUrl:svgUrl,
          width:40.w,
          height: 40.h,
        ),
        label: lapel);
    return bottomNavigationBarItem;
  }
}
