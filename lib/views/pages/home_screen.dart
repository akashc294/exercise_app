import 'package:exercise_app/constants/colors.dart';
import 'package:exercise_app/controllers/home_controller.dart';
import 'package:exercise_app/views/pages/components/home/category_view.dart';
import 'package:exercise_app/views/pages/components/home/exercise_view.dart';
import 'package:exercise_app/views/pages/components/home/search_view.dart';
import 'package:exercise_app/views/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../constants/assets.dart';
import 'package:collection/collection.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final TextEditingController _searchController = TextEditingController();
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      backgroundColor: AppThemeColors.white,
      key: _drawerKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: _drawerKey.currentState?.closeDrawer,
            )
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return Container(
      decoration:  BoxDecoration(
        /*image: DecorationImage(
          image: AssetImage(
            Assets.abstract2,
          ),
          fit: BoxFit.fill,
        ),*/
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
          CustomText.text("Hello",
              fontSize: 30,
              fontWeight: FontWeight.bold),
          CustomText.text(
            "Welcome to Fitness Reloaded", fontSize: 18,),
        ],
      ),
    );
  }
}
