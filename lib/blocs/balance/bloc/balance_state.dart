// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'balance_bloc.dart';

abstract class BalanceState extends Equatable {
  const BalanceState();

  @override
  List<Object> get props => [];
}

class BalanceInitial extends BalanceState {
  final double balance;
  BalanceInitial({
    required this.balance,
  });
  @override
  List<Object> get props => [balance];
}

class PurchaseFailed extends BalanceState {
  final String errorMessage;

  PurchaseFailed(this.errorMessage);
}