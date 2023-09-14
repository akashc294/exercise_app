import 'package:exercise_app/constants/colors.dart';
import 'package:exercise_app/controllers/home_controller.dart';
import 'package:exercise_app/views/pages/components/home/category_view.dart';
import 'package:exercise_app/views/pages/components/home/exercise_view.dart';
import 'package:exercise_app/views/pages/components/home/search_view.dart';
import 'package:exercise_app/views/widgets/custom_text.dart';
import 'package:exercise_app/views/widgets/dashboard_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/assets.dart';
import '../../constants/strings.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      key: _drawerKey,
      drawer: const DashboardDrawer(),
    );
  }

  _buildBody() {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topView(),
          middleView(),
          SearchView((value)=>controller.onSearch(value)),
          const SizedBox(height: 8,),
          CategoryView(),
          ExerciseView(),
        ],
      ),
    );
  }

  topView() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 8, right: 16),
      padding: const EdgeInsets.all(8.0),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {
            _drawerKey.currentState?.openDrawer();
          }, icon: Icon(Icons.menu,color: AppThemeColors.white,)),
          CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(Assets.splash)
          )

        ],
      ),
    );
  }

  middleView() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.text(Strings.hello,
              fontSize: 30,
              fontWeight: FontWeight.bold),
          CustomText.text(
            Strings.dashboardGreet, fontSize: 18,),
        ],
      ),
    );
  }
}
