import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humidity_pro/services/dependency_injection.dart';
import 'package:humidity_pro/view/home.dart';


Future<void> main() async{
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(), //
    );
  }
}