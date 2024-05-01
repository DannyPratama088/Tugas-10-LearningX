import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tugas_10/app/data/database.dart';

import 'package:tugas_10/app/modules/splash/bindings/splash_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDb();
  runApp(
    
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
    ),
  );
}

void initDb() async{
    await DbHelper().initDb();

}
