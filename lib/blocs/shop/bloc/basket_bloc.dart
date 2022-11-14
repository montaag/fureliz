import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yeliz/models/reward.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial(0)) {
    double amount = 0;
    on<AddToBasket>((event, emit) {
      amount = state.total + event.reward.reward.amount;
      emit(BasketInitial(amount));
    });
    on<RemoveFromBasket>((event, emit) {
      emit(BasketInitial(state.total - event.reward.reward.amount));
    });
    on<ResetBasket>((event, emit) {
      emit(BasketInitial(0));
    });
  }
}
