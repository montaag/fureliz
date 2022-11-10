// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:yeliz/models/subject.dart';

enum StudyType { KONU_ANLATIMI, SORU_COZUMU }

class Goal extends Equatable {
  final DateTime day;
  StudyType studyType;
  final int? amount;
  final Subject subject;
  bool isAchieved;

  Goal({
    required this.day,
    required this.studyType,
    this.amount,
    required this.subject,
    required this.isAchieved,
  });

  @override
  List<Object?> get props => [day, amount, subject, isAchieved, studyType];
}
