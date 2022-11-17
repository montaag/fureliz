// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';
import 'package:yeliz/models/classes.dart';

import 'package:yeliz/models/subject.dart';

@Entity()
class Goal extends Equatable {
  late int id;
  final DateTime day;
  final String studyType; //KONU_ANLATIMI OR SORU_COZUMU
  final int? amount;
  final bool isTYT;
  final int? subjectID;
  final String lecture;

  bool isAchieved;

  Goal({
    this.id = 0,
    required this.day,
    required this.studyType,
    this.amount,
    this.subjectID,
    required this.isAchieved,
    required this.lecture,
    required this.isTYT,
  });

  @override
  List<Object?> get props => [day, amount, subjectID, studyType, isAchieved];
}
