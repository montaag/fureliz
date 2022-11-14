part of 'balance_bloc.dart';

abstract class BalanceEvent extends Equatable {
  const BalanceEvent();

  @override
  List<Object> get props => [];
}

class EarnBalance extends BalanceEvent {
  final Goal goal;

  EarnBalance(this.goal);
}

class SpendBalance extends BalanceEvent {
  final double spendAmount;

  SpendBalance(this.spendAmount);
}

class GetBalance extends BalanceEvent {}

class SetBalance extends BalanceEvent {
  final double amount;

  SetBalance(this.amount);
}
