import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yeliz/config/constants.dart';
import 'package:yeliz/config/settingsProvider.dart';
import 'package:yeliz/dataProvider/subject_provider.dart';
import 'package:yeliz/models/goal.dart';
import 'package:yeliz/models/subject.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  final SettingsProvider settingsProvider;
  BalanceBloc(this.settingsProvider) : super(BalanceInitial(balance: 0)) {
    on<EarnBalance>((event, emit) async {
      double earnedStar = goalToStar(event.goal);
      double oldBalance = settingsProvider.getBalance();

      await settingsProvider.setBalance(earnedStar + oldBalance);
      emit(BalanceInitial(balance: oldBalance + earnedStar));
    });
    on<SpendBalance>((event, emit) async {
      double oldBalance = settingsProvider.getBalance();
      if (event.spendAmount > oldBalance) {
        emit(PurchaseFailed("Bakiyen yetersiz"));
      } else {
        await settingsProvider.setBalance(oldBalance - event.spendAmount);
        emit(BalanceInitial(balance: settingsProvider.getBalance()));
      }
    });
  }

  double goalToStar(Goal goal) {
    // Subject subject = SubjectProvider().getSubject(goal.subjectID)!;
    String type = goal.studyType;
    double star = 0;
    if (type == Constants.KONU_ANLATIMI) {
      if (goal.amount! <= 3.0)
        star = 5;
      else if (goal.amount!.isBetween(4, 6)) {
        star = 8;
      } else if (goal.amount!.isBetween(6, 10)) {
        star = 15;
      } else if (goal.amount!.isBetween(10, 15)) {
        star = 20;
      } else if (goal.amount!.isBetween(15, 20)) {
        star = 25;
      } else if (goal.amount!.isBetween(20, 50)) {
        star = 50;
      }
    } else {
      if (goal.amount! <= 3.0)
        star = 3;
      else if (goal.amount!.isBetween(4, 10)) {
        star = 5;
      } else if (goal.amount!.isBetween(10, 20)) {
        star = 10;
      } else if (goal.amount!.isBetween(20, 30)) {
        star = 20;
      } else if (goal.amount!.isBetween(30, 40)) {
        star = 28;
      } else if (goal.amount!.isBetween(40, 50)) {
        star = 50;
      } else if (goal.amount!.isBetween(50, 60)) {
        star = 70;
      } else if (goal.amount!.isBetween(60, 70)) {
        star = 85;
      } else if (goal.amount!.isBetween(70, 90)) {
        star = 100;
      } else if (goal.amount!.isBetween(90, 110)) {
        star = 150;
      } else if (goal.amount!.isBetween(110, 150)) {
        star = 200;
      } else if (goal.amount!.isBetween(150, 180)) {
        star = 300;
      } else if (goal.amount!.isBetween(180, 200)) {
        star = 400;
      }
    }
    return star;
  }
}

extension Range on num {
  bool isBetween(num from, num to) {
    return from <= this && this < to;
  }
}
