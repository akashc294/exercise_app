import 'package:exercise_app/bindings/store_binding.dart';
import 'package:exercise_app/routes/routes.dart';
import 'package:exercise_app/views/pages/exercise_detail_screen.dart';
import 'package:exercise_app/views/pages/home_screen.dart';
import 'package:exercise_app/views/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Exercise App Using ExerciseDB',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.root,
      initialBinding: StoreBinding(),
      getPages: [
        GetPage(name: AppRoutes.root, page: ()=>const SplashScreen()),
        GetPage(name: AppRoutes.homeScreen, page: ()=> HomeScreen()),
        GetPage(name: AppRoutes.exerciseDetails, page: ()=> ExerciseDetails())
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
