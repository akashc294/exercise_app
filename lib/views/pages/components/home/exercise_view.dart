import 'package:exercise_app/controllers/home_controller.dart';
import 'package:exercise_app/views/widgets/exercise_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseView extends StatelessWidget {
  ExerciseView({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GetBuilder<HomeController>(builder: (logic) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: controller.exercises.length,
            itemBuilder: (BuildContext context, int index) {
              return Visibility(
                visible: ((controller.exercises[index].bodyPart!.toLowerCase() ==
                    controller.selectedCategory.toLowerCase())||
                    (controller.selectedCategory.toLowerCase()=="all"))&&
                    (controller.exercises[index].name!.toLowerCase().contains(controller.searchValue.toLowerCase()) ||
                        controller.searchValue == ""
                    ),
                child: ExerciseCard(
                  controller.exercises[index],
                  navigateToDetails: () => controller.navigateToDetailScreen(),
                ),
              );
            },
          );
        })
    );
  }
}
