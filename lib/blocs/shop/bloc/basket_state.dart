part of 'basket_bloc.dart';

abstract class BasketState extends Equatable {
  final double total;
  const BasketState(this.total);

  @override
  List<Object> get props => [total];
}

class BasketInitial extends BasketState {
  BasketInitial(double total) : super(total);

  @override
  List<Object> get props => [total];
}
