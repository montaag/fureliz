// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'goal_bloc.dart';

@immutable
abstract class GoalState extends Equatable {}

class GoalInitial extends GoalState {
  final List<Goal> dailyGoals;
  GoalInitial({
    required this.dailyGoals,
  });

  @override
  List<Object?> get props => [dailyGoals];
}
