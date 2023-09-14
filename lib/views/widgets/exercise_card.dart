import 'package:exercise_app/constants/colors.dart';
import 'package:exercise_app/models/exercises.dart';
import 'package:exercise_app/views/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseCard extends StatelessWidget {
  Exercises exercise;
  Function()navigateToDetails;
  ExerciseCard(this.exercise,{required this.navigateToDetails,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateToDetails();
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 150,
            decoration: BoxDecoration(
                color: AppThemeColors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 4),
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                SizedBox(
                  width: Get.width*0.3,
                  child: Image.network(
                      exercise.gifUrl!,
                      loadingBuilder:(context,child,loadingProgress){
                        if (loadingProgress == null) return child;
                        return const Center(child: CupertinoActivityIndicator());
                      },
                      errorBuilder:(context,object,_){
                        return const Icon(Icons.error_outlined,size: 40,);
                      },
                      color: AppThemeColors.blueShade,
                      colorBlendMode:BlendMode.softLight,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
            padding: const EdgeInsets.all(16.0),
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppThemeColors.white.withOpacity(0.4),
                      AppThemeColors.blueShade.withOpacity(1),
                      //AppThemeColors.white,
                    ]
                ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: Get.width*0.5
                      ),
                      child: CustomText.text(
                          exercise.name!.capitalize!,
                          color: AppThemeColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          maxLines: 3
                      ),
                    ),
                    Row(
                      children: [
                         SizedBox(
                          height: 15,
                            child:  VerticalDivider(thickness: 3,color: AppThemeColors.purple)),
                        CustomText.text(
                            exercise.bodyPart!.capitalize!,
                            color: AppThemeColors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ],
                    ),
                    CustomText.richText(
                        exercise.target!.capitalize!,
                        Icon(Icons.accessibility,color: AppThemeColors.grey,size: 12,),
                        colors: AppThemeColors.grey,
                        margin: const EdgeInsets.only(right: 4),
                        fontSize: 10
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
