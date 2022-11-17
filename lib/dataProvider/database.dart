import 'package:collection/collection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yeliz/dataProvider/database_interface.dart';
import 'package:yeliz/models/balance.dart';
import 'package:yeliz/models/reward.dart';
import 'package:yeliz/objectbox.g.dart';

import 'package:yeliz/models/goal.dart';
import 'package:path/path.dart' as p;

class Database extends DatabaseProvider {
  late final Store store;
  Database._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  static Future<Database> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "database"));

    return Database._create(store);
  }

  @override
  Goal createGoal({
    required DateTime day,
    required String studyType,
    int? amount,
    int? subjectID,
    required String lecture,
    required bool isTYT,
  }) {
    Goal goal = Goal(day: day, studyType: studyType, isAchieved: false, amount: amount, subjectID: subjectID, lecture: lecture, isTYT: isTYT);
    store.box<Goal>().put(goal);
    return goal;
  }

  @override
  List<Goal> listGoals() {
    return store.box<Goal>().getAll();
  }

  @override
  void deleteGoal(int id) {
    store.box<Goal>().remove(id);
  }

  @override
  List<Goal> listDailyGoals() {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    List<Goal> goals = store.box<Goal>().query(Goal_.day.equals(today.millisecondsSinceEpoch)).build().find();
    return goals;
  }

  @override
  void savePurchasedRewards(List<RewardModel> rewards) {
    DateTime now = DateTime.now();
    for (var element in rewards) {
      element.date = DateTime(now.year, now.month, now.day);
    }
    store.box<RewardModel>().putMany(rewards);
  }

  @override
  void achieveGoal(Goal goal) {
    goal.isAchieved = !goal.isAchieved;
    print(goal.isAchieved);
    store.box<Goal>().put(goal);

    print(store.box<Goal>().get(goal.id)!.isAchieved);
  }

  @override
  List<RewardModel> listRewards() {
    return store.box<RewardModel>().getAll();
  }

  @override
  Map<DateTime?, List<RewardModel>> listRewardsWithDates() {
    final groups = groupBy(listRewards(), (RewardModel e) {
      return e.date;
    });
    return groups;
  }
}
