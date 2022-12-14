part of 'balance_bloc.dart';

abstract class BalanceEvent extends Equatable {
  const BalanceEvent();

  @override
  List<Object> get props => [];
}

class EarnBalance extends BalanceEvent {
  final Goal goal;

  EarnBalance(this.goal);
  @override
  List<Object> get props => [goal];
}

class SpendBalance extends BalanceEvent {
  final List<RewardModel> rewards;

  SpendBalance(this.rewards);
  @override
  List<Object> get props => [rewards];
}

class GetBalance extends BalanceEvent {}

class SetBalance extends BalanceEvent {
  final double amount;

  SetBalance(this.amount);
}

class DeleteBalance extends BalanceEvent {
  final Goal goal;

  DeleteBalance(this.goal);
  @override
  List<Object> get props => [goal];
}
