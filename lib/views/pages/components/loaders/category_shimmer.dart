import 'package:exercise_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
      height: 40,
      width: Get.width,
      child: ListView(
        scrollDirection : Axis.horizontal,
        children: [
          _dummyCard(),
          const SizedBox(height: 8,),
          _dummyCard(),
          const SizedBox(height: 8,),
          _dummyCard(),
          const SizedBox(height: 8,),
          _dummyCard(),
        ],
      ),
    );
  }

  _dummyCard(){
    return SizedBox(
      width: 120,
      height: 40,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.withOpacity(0.5),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
              color: AppThemeColors.white,
              borderRadius: BorderRadius.circular(8.0)
          ),
        ),
      ),
    );
  }
}
