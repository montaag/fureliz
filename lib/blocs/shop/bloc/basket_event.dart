// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class AddToBasket extends BasketEvent {
  Reward reward;
  AddToBasket({
    required this.reward,
  });
}

class RemoveFromBasket extends BasketEvent {
  Reward reward;
  RemoveFromBasket({
    required this.reward,
  });
}

class ResetBasket extends BasketEvent {}
