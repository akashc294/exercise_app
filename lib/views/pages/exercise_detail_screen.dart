import 'package:exercise_app/constants/colors.dart';
import 'package:exercise_app/controllers/detail_controller.dart';
import 'package:exercise_app/views/pages/components/exercise_detail/detail_bottom_view.dart';
import 'package:exercise_app/views/pages/components/exercise_detail/detail_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseDetails extends StatelessWidget {
  ExerciseDetails({Key? key}) : super(key: key);
  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody()
    );
  }

  _buildBody() {
    return GetBuilder<DetailController>(
      assignId: true,
      builder: (logic) {
        return Container(
          height: Get.height,
          width: Get.width,
          decoration:  BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppThemeColors.black.withOpacity(0.9),
                    AppThemeColors.black.withOpacity(0.8),
                  ]
              )
          ),
          child: controller.getLoading() ? Center(
              child: CupertinoActivityIndicator(
                color: AppThemeColors.white,
                radius: 8.0,
              )
          ) :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailImageView(),
              DetailBottomView(),
            ],
          ),
        );
      },
    );
  }
}
