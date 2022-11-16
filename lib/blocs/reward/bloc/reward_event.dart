part of 'reward_bloc.dart';

abstract class RewardEvent extends Equatable {
  const RewardEvent();

  @override
  List<Object> get props => [];
}

class ListRewards extends RewardEvent {}
