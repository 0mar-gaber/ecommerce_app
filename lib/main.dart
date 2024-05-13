import 'package:ecommerce_app/core/local_storage/shared_prefrence_helper.dart';
import 'package:flutter/material.dart';
import 'core/DI/di.dart';
import 'core/api/api_manager.dart';
import 'ecommerce_app.dart';

Future<void> main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsHelper.init();
  ApiManager.init();
  runApp(const EcommerceApp());
}


