// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yeliz/models/classes.dart';

enum ExamType { TYT, AYT }

class Subject {
  final Lecture lecture;
  final ExamType examType;
  final String name;
  bool isStudied = false;
  Subject({
    required this.lecture,
    required this.examType,
    required this.name,
    required this.isStudied,
  });
}
