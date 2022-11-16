part of 'reward_bloc.dart';

abstract class RewardState extends Equatable {
  const RewardState();

  @override
  List<Object> get props => [];
}

class RewardInitial extends RewardState {
  final List<RewardModel> rewards;

  RewardInitial(this.rewards);
  @override
  List<Object> get props => [rewards];
}
