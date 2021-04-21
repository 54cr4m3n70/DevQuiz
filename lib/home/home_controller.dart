import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

import 'home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;

  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzers;

  final repository = HomeRository();

  void getUser() async {
    state = HomeState.loading;

    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;

    quizzers = await repository.getQuizzes();
    state = HomeState.success;
  }
}
