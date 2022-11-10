part of 'basket_bloc.dart';

abstract class BasketState extends Equatable {
  final int total;
  const BasketState(this.total);

  @override
  List<Object> get props => [total];
}

class BasketInitial extends BasketState {
  BasketInitial(int total) : super(total);

  @override
  List<Object> get props => [total];
}
