import 'package:exercise_app/models/exercises.dart';
import 'package:exercise_app/repositories/exercise_repo.dart';
import 'package:get/get.dart';

class DetailController extends GetxController{
  bool _isLoading = true;
  late Exercises exerciseDetail;

  bool getLoading() => _isLoading;

  setLoading(bool status){
    _isLoading = status;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if(_isLoading){
      dynamic data = Get.arguments;
      getExerciseData(data['id']);
    }
    super.onInit();
  }

  getExerciseData(String id)async{
    exerciseDetail = await ExerciseRepo().getExerciseById(id);
    setLoading(false);
    update();
  }
}