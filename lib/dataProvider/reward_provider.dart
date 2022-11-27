import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeliz/models/reward.dart';

class RewardProvider {
  static List<Reward> getRewards() {
    List<Reward> rewards = [
      Reward(reward: RewardModel(title: "İskender Döner", amount: 2500), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "Kitap", amount: 900), icon: FontAwesomeIcons.book),
      Reward(reward: RewardModel(title: "Nakit\n20 lira", amount: 400), icon: FontAwesomeIcons.moneyBill),
      Reward(reward: RewardModel(title: "Nakit\n50 lira", amount: 1000), icon: FontAwesomeIcons.moneyBill1Wave),
      Reward(reward: RewardModel(title: "Nakit\n100 lira", amount: 2500), icon: FontAwesomeIcons.moneyBillTrendUp),
      Reward(reward: RewardModel(title: "Kahve", amount: 350), icon: FontAwesomeIcons.coffee),
      Reward(reward: RewardModel(title: "İstanbul Bileti x2", amount: 1000000), icon: FontAwesomeIcons.solidPaperPlane),
    ];
    return rewards;
  }

  static resetReward() {
    getRewards().forEach((element) {
      element.isSelected = false;
    });
  }
}
