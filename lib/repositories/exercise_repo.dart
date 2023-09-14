import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:exercise_app/constants/apis.dart';
import 'package:exercise_app/errors/error_message.dart';
import 'package:exercise_app/services/api_service.dart';
import 'package:flutter/services.dart';

import '../constants/strings.dart';
import '../models/exercises.dart';

class ExerciseRepo{
  APIService apiService = APIService();

  //--------- Getting List of Exercises  --------
  Future<List<Exercises>> getExercises()async{
    List<Exercises> exercises = [];

    try{
      Response response = await apiService.dio.get(
          APIS.getAllExercises,
          options: Options(
              headers:{
                "X-RapidAPI-Key":Strings.apiKey,
                "X-RapidAPI-Host":Strings.apiHost,
              }
          )
      );
      List<dynamic> values = response.data;
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            exercises.add( Exercises.fromJson(map));
          }
        }
      }
    }on DioException catch (exception){
      errorMessage(exception);
    }
    return exercises;
  }

  //--------- Getting Exercise Detail --------

  Future<Exercises> getExerciseById(String id)async{
    Exercises exercise = Exercises();

    try{
      Response response = await apiService.dio.get(
          APIS.getExerciseDetails+id,
          options: Options(
              headers:{
                "X-RapidAPI-Key":Strings.apiKey,
                "X-RapidAPI-Host":Strings.apiHost,
              }
          )
      );
      exercise = Exercises.fromJson(response.data);
    }on DioException catch (exception){
      errorMessage(exception);
    }
    return exercise;
  }

  //--------- Getting Exercise list from Sample Json File to reduce API Hits for development --------
  Future<List<Exercises>> getExercisesLocally()async{
    List<Exercises> exercises = [];
    try {
      final String response = await rootBundle.loadString('assets/data/sample.json');
      List<dynamic>? values = jsonDecode(response);
      if (values!.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            exercises.add( Exercises.fromJson(map));
          }
        }
      }
    } on DioException catch (exception){
      errorMessage(exception);
    }
    return exercises;
  }
}