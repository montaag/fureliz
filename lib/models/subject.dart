// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';
import 'package:yeliz/models/classes.dart';

enum ExamType { TYT, AYT }

class Subject {
  int? id;
  final Lecture lecture;
  final ExamType examType;
  final String name;
  bool isStudied = false;

  Subject({
    this.id,
    required this.lecture,
    required this.examType,
    required this.name,
    required this.isStudied,
  });
}
