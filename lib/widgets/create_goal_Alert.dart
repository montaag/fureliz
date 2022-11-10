import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/models/classes.dart';
import 'package:yeliz/models/goal.dart';
import 'package:yeliz/models/subject.dart';
import 'package:yeliz/widgets/custom_buttom_sheet.dart';
import 'package:yeliz/widgets/custom_button.dart';
import 'package:yeliz/widgets/custom_snack_bar.dart';
import 'package:yeliz/widgets/custom_textt_field.dart';

class AlertDialogContetns extends StatefulWidget {
  final List dersler;
  const AlertDialogContetns({Key? key, required this.dersler}) : super(key: key);

  @override
  State<AlertDialogContetns> createState() => _AlertDialogContetnsState();
}

class _AlertDialogContetnsState extends State<AlertDialogContetns> {
  Lecture? selectedLecture;

  ExamType selectedExamType = ExamType.TYT;
  StudyType selectedStudyType = StudyType.KONU_ANLATIMI;
  Subject? selectedSubject;
  int? amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedToggleSwitch<ExamType>.size(
              innerColor: Colors.white,
              current: selectedExamType,
              values: const [ExamType.AYT, ExamType.TYT],
              iconOpacity: 0.2,
              indicatorSize: const Size.fromWidth(150),
              iconAnimationType: AnimationType.onHover,
              indicatorAnimationType: AnimationType.onHover,
              iconBuilder: (value, size) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      value.toString().split(".").last,
                      style: CustomTheme.subtitle(context, color: Colors.black),
                    ),
                  ),
                );
              },
              borderWidth: 0.0,
              borderColor: Colors.transparent,
              colorBuilder: (i) => i == ExamType.AYT ? Palette.purple.withOpacity(0.3) : Palette.blue.withOpacity(0.3),
              onChanged: (ExamType i) {
                setState(() {
                  selectedExamType = i;
                });
              }),
          SizedBox(height: 10),
          AnimatedToggleSwitch<StudyType>.size(
              innerColor: Colors.white,
              current: selectedStudyType,
              values: const [StudyType.KONU_ANLATIMI, StudyType.SORU_COZUMU],
              iconOpacity: 0.2,
              indicatorSize: const Size.fromWidth(150),
              iconAnimationType: AnimationType.onHover,
              indicatorAnimationType: AnimationType.onHover,
              iconBuilder: (value, size) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      value.toString().split(".").last.split("_").first,
                      style: CustomTheme.subtitle(context, color: Colors.black),
                    ),
                  ),
                );
              },
              borderWidth: 0.0,
              borderColor: Colors.transparent,
              colorBuilder: (i) => i == StudyType.SORU_COZUMU ? Palette.orangeColor.withOpacity(0.4) : Palette.pinkColor.withOpacity(0.4),
              onChanged: (StudyType i) {
                setState(() {
                  selectedStudyType = i;
                });
              }),
          SizedBox(height: 10),
          CustomBottomSheet(
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.dersler
                    .map((e) => ListTile(
                        title: Center(
                            child: Text(
                          e.toString().split(".").last,
                          style: CustomTheme.subtitle(context, color: Colors.black),
                        )),
                        onTap: () {
                          Navigator.pop(context);

                          setState(() {
                            selectedLecture = e;
                          });
                        }))
                    .toList(),
              ),
              text: selectedLecture == null ? "Ders" : selectedLecture!.name.split(".").last),
          CustomBottomSheet(
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.dersler
                    .map((e) => ListTile(
                        title: Center(
                            child: Text(
                          e.toString().split(".").last,
                          style: CustomTheme.subtitle(context, color: Colors.black),
                        )),
                        onTap: () {
                          Navigator.pop(context);

                          setState(() {
                            selectedSubject = e;
                          });
                        }))
                    .toList(),
              ),
              text: selectedSubject.toString() == "null" ? "Konu" : selectedSubject!.name),
          SizedBox(height: 10),
          CustomTextField(
            keyboardType: TextInputType.number,
            hintText: "sayfa sayısı / soru sayısı",
            onChanged: (value) {
              setState(() {
                amount = int.parse(value);
              });
            },
          ),
          CustomButton(
              text: "Oluştur",
              customButtonType: CustomButtonType.primary,
              onPressed: () {
                Goal goal;
                if (selectedLecture == null) {
                  showCustomSnackBar(context, "Ders seç tatlım");
                } else if (amount == null) {
                  showCustomSnackBar(context, "Sayfa/soru gir cnm");
                } else if (selectedSubject == null) {
                  Subject subject = Subject(lecture: selectedLecture!, examType: selectedExamType, name: "", isStudied: false);
                  goal = Goal(day: DateTime.now(), isAchieved: false, studyType: selectedStudyType, subject: subject);
                  Navigator.pop(context);
                } else {
                  goal = Goal(day: DateTime.now(), isAchieved: false, studyType: selectedStudyType, subject: selectedSubject!);
                  Navigator.pop(context);
                }

                //TODO: IMPLEMENT CREATE GOAL
              })
        ],
      ),
    );
  }
}
