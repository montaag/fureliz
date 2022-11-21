import 'dart:math';

import 'package:yeliz/models/classes.dart';
import 'package:yeliz/models/subject.dart';

abstract class AbstractSubjectProvider {
  Subject? getSubject(int? id);
  List<Lecture> getTYTLectures();
  List<Lecture> getAYTLectures();
}

class SubjectProvider extends AbstractSubjectProvider {
  static Set MATH_SUBJECTS = {
    Subject(id: 1, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Temel Kavramlar", isStudied: false),
    Subject(id: 2, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Sayı Basamakları", isStudied: false),
    Subject(id: 3, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Bölme ve Bölünebilme", isStudied: false),
    Subject(id: 4, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "EBOB – EKOK", isStudied: false),
    Subject(id: 5, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Rasyonel Sayılar", isStudied: false),
    Subject(id: 6, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Basit Eşitsizlikler", isStudied: false),
    Subject(id: 7, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Mutlak Değer", isStudied: false),
    Subject(id: 8, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Üslü Sayılar", isStudied: false),
    Subject(id: 9, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Köklü Sayılar", isStudied: false),
    Subject(id: 10, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Çarpanlara Ayırma", isStudied: false),
    Subject(id: 11, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Oran Orantı", isStudied: false),
    Subject(id: 12, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Denklem Çözme", isStudied: false),
    Subject(id: 13, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Problemler", isStudied: false),
    Subject(id: 14, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Kümeler", isStudied: false),
    Subject(id: 15, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Mantık", isStudied: false),
    Subject(id: 16, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Fonskiyonlar", isStudied: false),
    Subject(id: 17, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Polinomlar", isStudied: false),
    Subject(id: 18, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "2.Dereceden Denklemler", isStudied: false),
    Subject(id: 19, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Permütasyon ve Kombinasyon", isStudied: false),
    Subject(id: 20, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Olasılık", isStudied: false),
    Subject(id: 21, lecture: Lecture.MATEMATIK, examType: ExamType.TYT, name: "Veri – İstatistik", isStudied: false),
    Subject(id: 22, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Temel Kavramlar", isStudied: false),
    Subject(id: 23, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Sayı Basamakları", isStudied: false),
    Subject(id: 24, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Bölme ve Bölünebilme", isStudied: false),
    Subject(id: 25, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "EBOB – EKOK", isStudied: false),
    Subject(id: 26, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Rasyonel Sayılar", isStudied: false),
    Subject(id: 27, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Basit Eşitsizlikler", isStudied: false),
    Subject(id: 28, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Mutlak Değer", isStudied: false),
    Subject(id: 29, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Üslü Sayılar", isStudied: false),
    Subject(id: 30, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Köklü Sayılar", isStudied: false),
    Subject(id: 31, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Çarpanlara Ayırma", isStudied: false),
    Subject(id: 32, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Oran Orantı", isStudied: false),
    Subject(id: 33, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Denklem Çözme", isStudied: false),
    Subject(id: 34, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Problemler", isStudied: false),
    Subject(id: 35, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Kümeler", isStudied: false),
    Subject(id: 36, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Mantık", isStudied: false),
    Subject(id: 37, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Fonskiyonlar", isStudied: false),
    Subject(id: 38, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Polinomlar", isStudied: false),
    Subject(id: 39, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "2.Dereceden Denklemler", isStudied: false),
    Subject(id: 40, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Permütasyon ve Kombinasyon", isStudied: false),
    Subject(id: 41, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Olasılık", isStudied: false),
    Subject(id: 42, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Veri – İstatistik", isStudied: false),
    Subject(id: 43, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Veri – İstatistik", isStudied: false),
    Subject(id: 44, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Karmaşık Sayılar", isStudied: false),
    Subject(id: 45, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "2.Dereceden Eşitsizlikler", isStudied: false),
    Subject(id: 46, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Parabol", isStudied: false),
    Subject(id: 47, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Trigonometri", isStudied: false),
    Subject(id: 48, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Logaritma", isStudied: false),
    Subject(id: 49, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Diziler", isStudied: false),
    Subject(id: 50, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Limit", isStudied: false),
    Subject(id: 51, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "Türev", isStudied: false),
    Subject(id: 52, lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "İntegral", isStudied: false),
  };

  static Set TURKISH_SUBJECTS = {
    Subject(id: 53, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Sözcükte Anlam", isStudied: false),
    Subject(id: 54, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Cümlede Anlam", isStudied: false),
    Subject(id: 55, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Paragraf", isStudied: false),
    Subject(id: 56, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Ses Bilgisi", isStudied: false),
    Subject(id: 57, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Yazım Kuralları", isStudied: false),
    Subject(id: 58, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Noktalama İşaretleri", isStudied: false),
    Subject(id: 59, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Sözcükte Yapı", isStudied: false),
    Subject(id: 60, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Sözcük Türleri", isStudied: false),
    Subject(id: 61, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Paragraf", isStudied: false),
    Subject(id: 62, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Fiiller", isStudied: false),
    Subject(id: 63, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Cümlenin Ögeleri", isStudied: false),
    Subject(id: 64, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Cümle Türleri", isStudied: false),
    Subject(id: 65, lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "Anlatım Bozukluğu", isStudied: false),
  };

  static Set PHYS_SUBJECTS = {
    Subject(id: 66, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "Fizik Bilimine Giriş", isStudied: false),
    Subject(id: 67, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "Madde ve Özellikleri", isStudied: false),
    Subject(id: 68, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "Hareket ve Kuvvet", isStudied: false),
    Subject(id: 69, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "İş, Güç ve Enerji", isStudied: false),
    Subject(id: 70, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "Isı, Sıcaklık ve Genleşme", isStudied: false),
    Subject(id: 71, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "Basınç", isStudied: false),
    Subject(id: 72, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "Kaldırma Kuvveti", isStudied: false),
    Subject(id: 73, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "Elektrostatik", isStudied: false),
    Subject(id: 74, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "Elektrik ve Manyetizma", isStudied: false),
    Subject(id: 75, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "Dalgalar", isStudied: false),
    Subject(id: 76, lecture: Lecture.FIZIK, examType: ExamType.TYT, name: "Optik", isStudied: false),
    Subject(id: 77, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Vektörler", isStudied: false),
    Subject(id: 155, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Kuvvet, Tork ve Denge", isStudied: false),
    Subject(id: 78, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Kütle Merkezi", isStudied: false),
    Subject(id: 79, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Basit Makineler", isStudied: false),
    Subject(id: 80, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Hareket", isStudied: false),
    Subject(id: 81, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Newton’un Hareket Yasaları", isStudied: false),
    Subject(id: 82, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "İş, Güç ve Enerji II", isStudied: false),
    Subject(id: 83, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Atışlar", isStudied: false),
    Subject(id: 84, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "İtme ve Momentum", isStudied: false),
    Subject(id: 85, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Elektrik Alan ve Potansiyel", isStudied: false),
    Subject(id: 86, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Paralel Levhalar ve Sığa", isStudied: false),
    Subject(id: 87, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Manyetik Alan ve Manyetik Kuvvet", isStudied: false),
    Subject(id: 88, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "İndüksiyon, Alternatif Akım ve Transformatörler", isStudied: false),
    Subject(id: 89, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Çembersel Hareket", isStudied: false),
    Subject(id: 90, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Dönme, Yuvarlanma ve Açısal Momentum", isStudied: false),
    Subject(id: 91, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Kütle Çekim ve Kepler Yasaları", isStudied: false),
    Subject(id: 92, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Basit Harmonik Hareket", isStudied: false),
    Subject(id: 93, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Dalga Mekaniği", isStudied: false),
    Subject(id: 94, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Atom Fiziğine Giriş ve Radyoaktivite", isStudied: false),
    Subject(id: 95, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Modern Fizik", isStudied: false),
    Subject(id: 96, lecture: Lecture.FIZIK, examType: ExamType.AYT, name: "Modern Fiziğin Teknolojideki Uygulamaları", isStudied: false),
  };

  static Set CHEM_SUBJECTS = {
    Subject(id: 97, lecture: Lecture.KIMYA, examType: ExamType.TYT, name: "Kimya Bilimi", isStudied: false),
    Subject(id: 98, lecture: Lecture.KIMYA, examType: ExamType.TYT, name: "Atom ve Periyodik Sistem", isStudied: false),
    Subject(id: 99, lecture: Lecture.KIMYA, examType: ExamType.TYT, name: "Kimyasal Türler Arası Etkileşimler", isStudied: false),
    Subject(id: 100, lecture: Lecture.KIMYA, examType: ExamType.TYT, name: "Maddenin Halleri", isStudied: false),
    Subject(id: 101, lecture: Lecture.KIMYA, examType: ExamType.TYT, name: "Doğa ve Kimya", isStudied: false),
    Subject(id: 102, lecture: Lecture.KIMYA, examType: ExamType.TYT, name: "Kimyanın Temel Kanunları", isStudied: false),
    Subject(id: 103, lecture: Lecture.KIMYA, examType: ExamType.TYT, name: "Kimyasal Hesaplamalar", isStudied: false),
    Subject(id: 104, lecture: Lecture.KIMYA, examType: ExamType.TYT, name: "Karışımlar", isStudied: false),
    Subject(id: 105, lecture: Lecture.KIMYA, examType: ExamType.TYT, name: "Asit, Baz ve Tuz", isStudied: false),
    Subject(id: 106, lecture: Lecture.KIMYA, examType: ExamType.TYT, name: "Kimya Her Yerde", isStudied: false),
    Subject(id: 107, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Kimya Bilimi", isStudied: false),
    Subject(id: 108, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Atom ve Periyodik Sistem", isStudied: false),
    Subject(id: 109, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Kimyasal Türler Arası Etkileşimler", isStudied: false),
    Subject(id: 110, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Maddenin Halleri", isStudied: false),
    Subject(id: 111, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Doğa ve Kimya", isStudied: false),
    Subject(id: 112, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Kimyanın Temel Kanunları", isStudied: false),
    Subject(id: 113, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Kimyasal Hesaplamalar", isStudied: false),
    Subject(id: 114, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Karışımlar", isStudied: false),
    Subject(id: 115, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Asit, Baz ve Tuz", isStudied: false),
    Subject(id: 116, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Kimya Her Yerde", isStudied: false),
    Subject(id: 117, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Modern Atom Teorisi", isStudied: false),
    Subject(id: 118, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Gazlar", isStudied: false),
    Subject(id: 119, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Sıvı Çözeltiler ve Çözünürlük", isStudied: false),
    Subject(id: 120, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Kimyasal Tepkimelerde Enerj", isStudied: false),
    Subject(id: 121, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Kimyasal Tepkimelerde Hız", isStudied: false),
    Subject(id: 122, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Kimyasal Tepkimelerde Denge", isStudied: false),
    Subject(id: 123, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Asit-Baz Dengesi", isStudied: false),
    Subject(id: 124, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Çözünürlük Dengesi", isStudied: false),
    Subject(id: 125, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Kimya ve Elektrik", isStudied: false),
    Subject(id: 126, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Karbon Kimyasına Giriş", isStudied: false),
    Subject(id: 127, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Organik Kimya", isStudied: false),
    Subject(id: 128, lecture: Lecture.KIMYA, examType: ExamType.AYT, name: "Enerji Kaynakları ve Bilimsel Gelişmeler", isStudied: false),
  };
  static Set BIO_SUBJECTS = {
    Subject(id: 129, lecture: Lecture.BIYOLOJI, examType: ExamType.TYT, name: "Canlıların Ortak Özellikleri", isStudied: false),
    Subject(id: 130, lecture: Lecture.BIYOLOJI, examType: ExamType.TYT, name: "Canlıların Temel Bileşenleri", isStudied: false),
    Subject(id: 131, lecture: Lecture.BIYOLOJI, examType: ExamType.TYT, name: "Hücre ve Organelleri", isStudied: false),
    Subject(id: 132, lecture: Lecture.BIYOLOJI, examType: ExamType.TYT, name: "Hücre Zarından Madde Geçişi", isStudied: false),
    Subject(id: 133, lecture: Lecture.BIYOLOJI, examType: ExamType.TYT, name: "Canlıların Sınıflandırılması", isStudied: false),
    Subject(id: 134, lecture: Lecture.BIYOLOJI, examType: ExamType.TYT, name: "Mitoz ve Eşeysiz Üreme", isStudied: false),
    Subject(id: 135, lecture: Lecture.BIYOLOJI, examType: ExamType.TYT, name: "Mayoz ve Eşeyli Üreme", isStudied: false),
    Subject(id: 136, lecture: Lecture.BIYOLOJI, examType: ExamType.TYT, name: "Kalıtım", isStudied: false),
    Subject(id: 137, lecture: Lecture.BIYOLOJI, examType: ExamType.TYT, name: "Ekosistem Ekolojisi", isStudied: false),
    Subject(id: 138, lecture: Lecture.BIYOLOJI, examType: ExamType.TYT, name: "Güncel Çevre Sorunları", isStudied: false),
    Subject(id: 139, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Sinir Sistemi", isStudied: false),
    Subject(id: 140, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Endokrin Sistem", isStudied: false),
    Subject(id: 141, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Duyu Organları", isStudied: false),
    Subject(id: 142, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Destek ve Hareket Sistemi", isStudied: false),
    Subject(id: 143, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Sindirim Sistemi", isStudied: false),
    Subject(id: 144, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Dolaşım ve Bağışıklık Sistemi", isStudied: false),
    Subject(id: 145, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Solunum Sistemi", isStudied: false),
    Subject(id: 146, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Üriner Sistem (Boşaltım Sistemi)", isStudied: false),
    Subject(id: 147, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Üreme Sistemi ve Embriyonik Gelişim", isStudied: false),
    Subject(id: 148, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Komünite Ekolojisi", isStudied: false),
    Subject(id: 149, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Popülasyon Ekolojisi", isStudied: false),
    Subject(id: 150, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Genden Proteine", isStudied: false),
    Subject(id: 151, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Canlılarda Enerji Dönüşümleri", isStudied: false),
    Subject(id: 152, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Bitki Biyolojisi", isStudied: false),
    Subject(id: 153, lecture: Lecture.BIYOLOJI, examType: ExamType.AYT, name: "Canlılar ve Çevre", isStudied: false),
  };

  static Set HISTORY_SUBJECTS = {
    Subject(id: 154, lecture: Lecture.SOSYAL, examType: ExamType.TYT, name: "Sosyal", isStudied: false),
  };

  static Set getAllSubjects() {
    Set all = {};
    all.addAll(MATH_SUBJECTS);
    all.addAll(TURKISH_SUBJECTS);
    all.addAll(BIO_SUBJECTS);
    all.addAll(CHEM_SUBJECTS);

    all.addAll(PHYS_SUBJECTS);

    all.addAll(HISTORY_SUBJECTS);

    return all;
  }

  static Set getSubjectsbyLecture(Lecture lecture, ExamType examType) {
    Set list = {};
    switch (lecture) {
      case Lecture.MATEMATIK:
        list = MATH_SUBJECTS;
        break;
      case Lecture.TURKCE:
        list = TURKISH_SUBJECTS;
        break;
      case Lecture.BIYOLOJI:
        list = BIO_SUBJECTS;
        break;
      case Lecture.KIMYA:
        list = CHEM_SUBJECTS;
        break;
      case Lecture.FIZIK:
        list = PHYS_SUBJECTS;
        break;
      case Lecture.SOSYAL:
        list = HISTORY_SUBJECTS;
        break;
    }
    return list.where((element) => element.examType == examType).toSet();
  }

  Subject? getSubject(int? id) {
    if (id == null) return null;
    Set all = getAllSubjects();
    for (Subject element in all) {
      if (element.id == id) {
        return element;
      }
    }
  }

  @override
  List<Lecture> getTYTLectures() {
    return [
      Lecture.MATEMATIK,
      Lecture.TURKCE,
      Lecture.BIYOLOJI,
      Lecture.FIZIK,
      Lecture.KIMYA,
      Lecture.SOSYAL,
    ];
  }

  @override
  List<Lecture> getAYTLectures() {
    return [
      Lecture.MATEMATIK,
      Lecture.BIYOLOJI,
      Lecture.FIZIK,
      Lecture.KIMYA,
    ];
  }

  static int getSubjectCount(Lecture lecture, ExamType examType) {
    switch (lecture) {
      case Lecture.MATEMATIK:
        return MATH_SUBJECTS.where((element) => element.examType == examType).length;
      case Lecture.TURKCE:
        return TURKISH_SUBJECTS.where((element) => element.examType == examType).length;
      case Lecture.FIZIK:
        return PHYS_SUBJECTS.where((element) => element.examType == examType).length;
      case Lecture.KIMYA:
        return CHEM_SUBJECTS.where((element) => element.examType == examType).length;
      case Lecture.BIYOLOJI:
        return BIO_SUBJECTS.where((element) => element.examType == examType).length;
      case Lecture.SOSYAL:
        return HISTORY_SUBJECTS.where((element) => element.examType == examType).length;
      default:
        return 0;
    }
  }
}
