import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yeliz/dataProvider/database_interface.dart';
import 'package:yeliz/models/classes.dart';
import 'package:yeliz/models/goal.dart';
import 'package:yeliz/models/subject.dart';

part 'goal_event.dart';
part 'goal_state.dart';

class GoalBloc extends Bloc<GoalEvent, GoalState> {
  final DatabaseProvider databaseProvider;
  GoalBloc(this.databaseProvider)
      : super(GoalInitial(
          dailyGoals: databaseProvider.listDailyGoals(),
        )) {
    on<CreateGoal>((event, emit) {
      print(databaseProvider.listGoals().length);
      bool isTyt = event.examType == ExamType.TYT ? true : false;
      databaseProvider.createGoal(
          day: event.day,
          studyType: event.studyType,
          amount: event.amount,
          subjectID: event.subjectID,
          lecture: event.lecture.toString().split(".").last,
          isTYT: isTyt);
      emit(GoalInitial(dailyGoals: databaseProvider.listDailyGoals()));
    });
    on<AchieveGoal>((event, emit) {
      //hem databaseden düzelt hem de tık tık

      databaseProvider.achieveGoal(event.goal);

      emit(GoalInitial(dailyGoals: databaseProvider.listDailyGoals()));
    });
  }
}
