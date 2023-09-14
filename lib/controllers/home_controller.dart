import 'package:exercise_app/models/categories.dart';
import 'package:exercise_app/models/exercises.dart';
import 'package:exercise_app/repositories/exercise_repo.dart';
import 'package:exercise_app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class HomeController extends GetxController{
  bool _isLoading = true;
  List<Exercises> exercises = [];
  List<Categories> categories = [];
  String selectedCategory = "All";
  String searchValue = "";

  bool getLoading() => _isLoading;

  setLoading(bool status){
    _isLoading = status;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    categories.add(Categories(name: "All",isSelected: true));

    if(_isLoading){
      getExercisesData();
    }
    super.onInit();
  }


  getExercisesData()async{
    var data = await ExerciseRepo().getExercisesLocally();
    exercises = data;
    exercises.sort((a, b) => a.name!.compareTo(b.name!));
    Map groupedItems = groupItemsByCategory(exercises);
    groupedItems.forEach((key, value) {
      categories.add(Categories(name: key,isSelected: false));
    });
    categories.sort((a, b) => a.name!.compareTo(b.name!));
    setLoading(false);
    update();
  }

  Map groupItemsByCategory(List items) {
    return groupBy(items, (item) => item.bodyPart);
  }


  navigateToDetailScreen(){
    Get.toNamed(AppRoutes.exerciseDetails,arguments: {""});
  }

  changeCategory(Categories category){
    categories.forEach((element) {
      element.isSelected = false;
      if(category.name==element.name) {
        element.isSelected = true;
        selectedCategory = category.name!;
      }
    });
    update();
  }

  onSearch(String value){
    searchValue = value;
    update();
  }

}