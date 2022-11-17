import 'package:yeliz/models/goal.dart';
import 'package:yeliz/models/reward.dart';

abstract class DatabaseProvider {
  Goal createGoal({
    required DateTime day,
    required String studyType, //KONU_ANLATIMI OR SORU_COZUMU
    required int? amount,
    int? subjectID,
    required String lecture,
    required bool isTYT,
  });

  List<Goal> listGoals();
  List<Goal> listDailyGoals();
  List<Goal> listYesterdayGoals();

  void deleteGoal(Goal goal);
  void savePurchasedRewards(List<RewardModel> rewards);
  void achieveGoal(Goal goal, bool value);
  List<RewardModel> listRewards();
  Map<DateTime?, List<RewardModel>> listRewardsWithDates();
}
