import 'package:app_find_home/app/core/utils/dependency_injection.dart';
import 'package:app_find_home/app/modules/splash/splash_binding.dart';
import 'package:app_find_home/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  DependencyInjection.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
