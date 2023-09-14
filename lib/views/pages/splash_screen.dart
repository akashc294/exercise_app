import 'dart:async';
import 'package:exercise_app/routes/routes.dart';
import 'package:exercise_app/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/assets.dart';
import '../../constants/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Get.offAllNamed(AppRoutes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Image.asset(
                Assets.splash,
                fit:BoxFit.cover,
                height: double.infinity,
                width: double.infinity,),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:50),
                    child: CustomText.text(
                        Strings.fitness,
                        fontSize: 54,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:120),
                    child: CustomText.text(
                        Strings.reloaded,
                        fontSize: 54,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 46,
                left: 20,
                right: 20,
                child: Center(
                  child: CustomText.text(
                      Strings.splashDescription,
                    fontSize: 16
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
