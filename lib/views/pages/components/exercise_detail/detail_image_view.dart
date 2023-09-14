import 'package:exercise_app/constants/colors.dart';
import 'package:exercise_app/controllers/detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailImageView extends StatelessWidget {
  DetailImageView({Key? key}) : super(key: key);

  var controller = Get.find<DetailController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 24.0),
          width: Get.width,
          height: 300,
          decoration: BoxDecoration(
              color: AppThemeColors.white,
              borderRadius: BorderRadius.circular(8.0),
          ),
          child: Image.network(
            controller.exerciseDetail.gifUrl??"",
            loadingBuilder:(context,child,loadingProgress){
              if (loadingProgress == null) return child;
              return const Center(child: CupertinoActivityIndicator());
            },
            errorBuilder:(context,object,_){
              return const Icon(Icons.error_outlined,size: 40,);
            },
            fit: BoxFit.fill,
            color: AppThemeColors.blueShade,
            colorBlendMode:BlendMode.softLight,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 24.0),
          width: Get.width,
          height: 300,
          decoration: BoxDecoration(
              color: AppThemeColors.white,
            borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                  colors: [
                    AppThemeColors.blueShade.withOpacity(0.1),
                    AppThemeColors.blueShade.withOpacity(0.3),
                  ]
              )
          ),
        ),
      ],
    );
  }
}
