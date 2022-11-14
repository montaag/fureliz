import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeliz/models/reward.dart';

class RewardProvider {
  static List<Reward> getRewards() {
    List<Reward> rewards = [
      Reward(reward: RewardModel(title: "İskender Döner", amount: 10), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "İskender Döner", amount: 10), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "İskender Döner", amount: 10), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "İskender Döner", amount: 10), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "İskender Döner", amount: 10), icon: FontAwesomeIcons.bowlFood),
      Reward(reward: RewardModel(title: "İskender Döner", amount: 10), icon: FontAwesomeIcons.bowlFood),
    ];
    return rewards;
  }

  static resetReward() {
    getRewards().forEach((element) {
      element.isSelected = false;
    });
  }
}
