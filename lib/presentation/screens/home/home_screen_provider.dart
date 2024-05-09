
import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class HomeScreenProvider extends ChangeNotifier{
  int currentBottomNavBarItem = 0 ;
  bool isBottomNavBarItemSelected =false ;
  Color bottomNavBarItemColor = Colors.white;
  changeSelectedItem(int newNavBarItem){
    currentBottomNavBarItem = newNavBarItem ;
    notifyListeners();
  }
  changeSelectedItemColor(int index){
    if(currentBottomNavBarItem==index){
      bottomNavBarItemColor = AppColors.primaryColor;
      notifyListeners();
    }
  }

  String id = "6439d5b90049ad0b52b90048" ;
  int index = 0;
  bool isFoundItems = true ;

  changeCategory(int newIndex , String newId){
    id = newId ;
    notifyListeners();
  }



}
