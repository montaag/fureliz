import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yeliz/dataProvider/database_interface.dart';
import 'package:yeliz/models/reward.dart';

part 'reward_event.dart';
part 'reward_state.dart';

class RewardBloc extends Bloc<RewardEvent, RewardState> {
  DatabaseProvider databaseProvider;
  RewardBloc(this.databaseProvider) : super(RewardInitial(databaseProvider.listRewards())) {
    on<ListRewards>((event, emit) {
      List<RewardModel> list = databaseProvider.listRewards();
      list.sort((a, b) => b.date!.compareTo(a.date!));

      emit(RewardInitial(list));
    });
  }
}
