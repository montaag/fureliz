part of 'goal_bloc.dart';

@immutable
abstract class GoalEvent {}

class CreateGoal extends GoalEvent {}

class ResetGoal extends GoalEvent {}

class DeleteGoal extends GoalEvent {}

class EditGoal extends GoalEvent {}
