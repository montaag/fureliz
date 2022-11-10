import 'package:yeliz/models/classes.dart';
import 'package:yeliz/models/subject.dart';

abstract class AbstractSubjectProvider {
  Subject? getSubject(int? id);
}

class SubjectProvider extends AbstractSubjectProvider {
  static Set MATH_SUBJECTS = {
    Subject(id: 1, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "trigo", isStudied: false),
  };

  static Set TURKISH_SUBJECTS = {
    Subject(id: 2, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "çatı", isStudied: false),
  };
  static Set BIO_SUBJECTS = {
    Subject(id: 3, lecture: Lecture.BIYOLOJI, examType: ExamType.TYT, name: "hücre", isStudied: false),
  };
  static Set CHEM_SUBJECTS = {
    Subject(id: 4, lecture: Lecture.KIMYA, examType: ExamType.TYT, name: "gaz", isStudied: false),
  };
  static Set PHYS_SUBJECTS = {
    Subject(id: 5, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "hareket", isStudied: false),
  };
  static Set HISTORY_SUBJECTS = {
    Subject(id: 6, lecture: Lecture.SOSYAL, examType: ExamType.TYT, name: "osmanlı", isStudied: false),
  };

  static Set getAllSubjects() {
    Set all = {};
    all.addAll(MATH_SUBJECTS);
    all.addAll(TURKISH_SUBJECTS);
    return all;
  }

  static Set getSubjectsbyLecture(Lecture lecture) {
    switch (lecture) {
      case Lecture.MATEMATIK:
        return MATH_SUBJECTS;
      case Lecture.TURKCE:
        return TURKISH_SUBJECTS;
      case Lecture.BIYOLOJI:
        return BIO_SUBJECTS;
      case Lecture.KIMYA:
        return CHEM_SUBJECTS;

      case Lecture.FIZIK:
        return PHYS_SUBJECTS;
      case Lecture.SOSYAL:
        return HISTORY_SUBJECTS;
      default:
        return {};
    }
  }

  @override
  Subject? getSubject(int? id) {
    if (id == null) return null;
    Set all = getAllSubjects();
    for (Subject element in all) {
      if (element.id == id) {
        return element;
      }
    }
  }
}
