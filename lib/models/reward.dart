import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Reward extends Equatable {
  final String title;
  final int amount;
  final IconData icon;
  bool isSelected;
  Reward({
    required this.title,
    required this.amount,
    required this.icon,
    this.isSelected = false,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title, amount, isSelected];
}
