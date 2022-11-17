// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'goal_bloc.dart';

@immutable
abstract class GoalEvent {}

class CreateGoal extends GoalEvent {
  final DateTime day;
  final String studyType; //KONU_ANLATIMI OR SORU_COZUMU
  final int? amount;
  final int? subjectID;
  Lecture lecture;
  ExamType examType;
  CreateGoal({
    required this.day,
    required this.studyType,
    required this.amount,
    this.subjectID,
    required this.lecture,
    required this.examType,
  });
}

class ResetGoal extends GoalEvent {}

class DeleteGoal extends GoalEvent {}

class AchieveGoal extends GoalEvent {
  final Goal goal;
  AchieveGoal({
    required this.goal,
  });
}

class ListGoals extends GoalEvent {}
