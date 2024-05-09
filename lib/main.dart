import 'package:flutter/material.dart';
import 'core/DI/di.dart';
import 'core/api/api_manager.dart';
import 'ecommerce_app.dart';

void main(){
  configureDependencies();
  ApiManager.init();
  runApp(const EcommerceApp());
}


