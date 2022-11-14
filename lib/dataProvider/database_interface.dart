import 'package:yeliz/models/goal.dart';

abstract class DatabaseProvider {
  Goal createGoal(
      {required DateTime day,
      required String studyType, //KONU_ANLATIMI OR SORU_COZUMU
      required int? amount,
      int? subjectID,
      required String lecture});

  List<Goal> listGoals();
  List<Goal> listDailyGoals();
  void deleteGoal(int id);
}
