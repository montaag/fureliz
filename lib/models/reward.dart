// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

import 'package:yeliz/objectbox.g.dart';

class Reward extends Equatable {
  final RewardModel reward;
  final IconData icon;
  bool isSelected;
  Reward({
    required this.reward,
    required this.icon,
    this.isSelected = false,
  });

  @override
  List<Object?> get props => [isSelected];
}

@Entity()
class RewardModel extends Equatable {
  int id;
  final String title;
  final int amount;
  RewardModel({
    this.id = 0,
    required this.title,
    required this.amount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title, amount, id];
}
