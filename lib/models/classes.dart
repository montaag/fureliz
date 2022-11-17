import 'package:yeliz/models/subject.dart';

enum Lecture { MATEMATIK, TURKCE, FIZIK, KIMYA, BIYOLOJI, SOSYAL }

class LectureProvider {
  static List<Lecture> getLectures(ExamType examType) {
    return examType == ExamType.AYT ? [Lecture.MATEMATIK, Lecture.FIZIK, Lecture.BIYOLOJI, Lecture.KIMYA] : Lecture.values;
  }
}
