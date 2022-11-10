import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/models/classes.dart';
import 'package:yeliz/models/goal.dart';
import 'package:yeliz/models/subject.dart';
import 'package:yeliz/widgets/create_goal_Alert.dart';
import 'package:yeliz/widgets/custom_button.dart';
import 'package:yeliz/widgets/custom_card.dart';
import 'package:yeliz/widgets/custom_checkboxListTile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List dersler = [Lecture.MATEMATIK, Lecture.TURKCE];

    List goals = [
      Goal(
          day: DateTime.now(),
          studyType: StudyType.KONU_ANLATIMI,
          subject: Subject(lecture: Lecture.MATEMATIK, examType: ExamType.AYT, name: "konu 1", isStudied: false),
          isAchieved: false,
          amount: 1),
      Goal(
          day: DateTime.now(),
          studyType: StudyType.SORU_COZUMU,
          subject: Subject(lecture: Lecture.TURKCE, examType: ExamType.TYT, name: "konu 2", isStudied: false),
          isAchieved: false,
          amount: 2),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Merhaba, ", style: CustomTheme.headline6(context)),
                  Text(
                    "Yeliz",
                    style: CustomTheme.headline6(context, color: Palette.primaryColor),
                  ),
                ],
              ),
              Text(
                "Bugün ne öğrenmek istersin?",
                style: CustomTheme.subtitle(context),
              ),
              const SizedBox(height: 40),
              Text(
                "TYT Konuları",
                style: CustomTheme.subtitle(context),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 90.h,
                child: GridView.count(
                  shrinkWrap: false,
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                  children: dersler
                      .map(
                        (e) => CustomCard(
                          title: "Matematik",
                          subtitle: "10 konu",
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "AYT Konuları",
                style: CustomTheme.subtitle(context),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 90.h,
                child: GridView.count(
                  shrinkWrap: false,
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                  children: dersler
                      .map(
                        (e) => CustomCard(
                          title: "Matematik",
                          subtitle: "10 konu",
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Günlük Hedeflerim",
                    style: CustomTheme.subtitle(context),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: Text("Günlük Hedefim"),
                                content: AlertDialogContetns(dersler: dersler),
                              );
                            }));
                      },
                      icon: Icon(Icons.add_circle_outline)),
                ],
              ),
              const SizedBox(height: 20),
              goals.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          Text(
                            "Bugünlük hedefini henüz belirlemedin",
                            style: CustomTheme.headline6(context),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: CustomButton(
                                text: "Hadi hedef belirle",
                                customButtonType: CustomButtonType.primary,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) {
                                        return AlertDialog(
                                          title: Text("Günlük Hedefim"),
                                          content: AlertDialogContetns(dersler: dersler),
                                        );
                                      }));
                                }),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: goals
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: CustomCheckBoxListTile(goal: e),
                              ))
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
