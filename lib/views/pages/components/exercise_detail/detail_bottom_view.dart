import 'package:exercise_app/controllers/detail_controller.dart';
import 'package:exercise_app/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';

class DetailBottomView extends StatelessWidget {
  DetailBottomView({Key? key}) : super(key: key);
  final DetailController controller = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppThemeColors.grey
      ),
      padding: const EdgeInsets.all(16.0),
      child: controller.exerciseDetail.name == null?
      Center(
        child: CustomText.richText(
            Strings.errorMessage,
            Icon(Icons.error,color: AppThemeColors.error,size: 21,),
            margin: const EdgeInsets.only(right: 16),
            fontSize: 16,
            colors: AppThemeColors.white,
            fontWeight: FontWeight.bold
        ),
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.text(
              controller.exerciseDetail.name!.capitalize!,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
           ListTile(
            title: CustomText.text(
                "Body Part",
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
             subtitle: CustomText.text(
                 controller.exerciseDetail.bodyPart!.capitalize!,
                 fontSize: 12
             ),
             leading:Image(image: AssetImage(Assets.body),height: 24,),
          ),
          ListTile(
            title: CustomText.text(
                "Target",
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
            subtitle: CustomText.text(
                controller.exerciseDetail.target!.capitalize!,
                fontSize: 12
            ),
            leading:Image(image: AssetImage(Assets.target),height: 24,),
          ),
          ListTile(
            title: CustomText.text(
                "Equipment to be used",
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
            subtitle: CustomText.text(
                controller.exerciseDetail.equipment!.capitalize!,
                fontSize: 12
            ),
            leading:Image(image: AssetImage(Assets.equipment),height: 24,),
          ),
        ],
      ),
    );
  }
}
