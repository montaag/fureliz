import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeliz/models/reward.dart';

class RewardProvider {
  static List<Reward> getRewards() {
    List<Reward> rewards = [
      Reward(reward: RewardModel(title: "İskender Döner", amount: 500), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "Kitap", amount: 150), icon: FontAwesomeIcons.book),
      Reward(reward: RewardModel(title: "Nakit\n20 lira", amount: 70), icon: FontAwesomeIcons.moneyBill),
      Reward(reward: RewardModel(title: "Nakit\n50 lira", amount: 300), icon: FontAwesomeIcons.moneyBill1Wave),
      Reward(reward: RewardModel(title: "Nakit\n100 lira", amount: 550), icon: FontAwesomeIcons.moneyBillTrendUp),
      Reward(reward: RewardModel(title: "Kahve", amount: 60), icon: FontAwesomeIcons.coffee),
      Reward(reward: RewardModel(title: "İstanbul Bileti x2", amount: 10000), icon: FontAwesomeIcons.solidPaperPlane),
    ];
    return rewards;
  }

  static resetReward() {
    getRewards().forEach((element) {
      element.isSelected = false;
    });
  }
}
