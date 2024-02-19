import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semic/routes/routes.dart';
import 'package:semic/routes/routes_name.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.homeView,
      getPages: AppRoutes.appRoutes(),
    );
  }
}


