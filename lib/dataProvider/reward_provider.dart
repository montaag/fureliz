import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeliz/models/reward.dart';

class RewardProvider {
  static List<Reward> getRewards() {
    List<Reward> rewards = [
      Reward(reward: RewardModel(title: "İskender Döner", amount: 10), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "Kitap", amount: 10), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "Nakit\n20 lira", amount: 10), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "Nakit\n50 lira", amount: 10), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "Nakit\n100 lira", amount: 10), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "Kahve", amount: 10), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "İstanbul Bileti x2", amount: 10), icon: FontAwesomeIcons.bowlFood),
    ];
    return rewards;
  }

  static resetReward() {
    getRewards().forEach((element) {
      element.isSelected = false;
    });
  }
}
