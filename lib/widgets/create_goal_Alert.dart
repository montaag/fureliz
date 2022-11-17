import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeliz/blocs/bloc/goal_bloc.dart';
import 'package:yeliz/config/constants.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/dataProvider/subject_provider.dart';
import 'package:yeliz/models/classes.dart';
import 'package:yeliz/models/subject.dart';
import 'package:yeliz/widgets/custom_buttom_sheet.dart';
import 'package:yeliz/widgets/custom_button.dart';
import 'package:yeliz/widgets/custom_snack_bar.dart';
import 'package:yeliz/widgets/custom_textt_field.dart';

class AlertDialogContetns extends StatefulWidget {
  const AlertDialogContetns({Key? key}) : super(key: key);

  @override
  State<AlertDialogContetns> createState() => _AlertDialogContetnsState();
}

class _AlertDialogContetnsState extends State<AlertDialogContetns> {
  Lecture? selectedLecture;

  ExamType selectedExamType = ExamType.TYT;
  String selectedStudyType = Constants.KONU_ANLATIMI;
  Subject? selectedSubject;

  int? amount;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalBloc, GoalState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
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
              AnimatedToggleSwitch<String>.size(
                  innerColor: Colors.white,
                  current: selectedStudyType,
                  values: [Constants.KONU_ANLATIMI, Constants.SORU_COZUMU],
                  iconOpacity: 0.2,
                  indicatorSize: const Size.fromWidth(150),
                  iconAnimationType: AnimationType.onHover,
                  indicatorAnimationType: AnimationType.onHover,
                  iconBuilder: (value, size) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          value.split(" ").first,
                          style: CustomTheme.subtitle(context, color: Colors.black),
                        ),
                      ),
                    );
                  },
                  borderWidth: 0.0,
                  borderColor: Colors.transparent,
                  colorBuilder: (i) => i == Constants.SORU_COZUMU ? Palette.orangeColor.withOpacity(0.4) : Palette.pinkColor.withOpacity(0.4),
                  onChanged: (String i) {
                    setState(() {
                      selectedStudyType = i;
                    });
                  }),
              SizedBox(height: 10),
              CustomBottomSheet(
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: LectureProvider.getLectures(selectedExamType)
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
                                selectedSubject = null;
                              });
                            }))
                        .toList(),
                  ),
                  text: selectedLecture == null ? "Ders" : selectedLecture!.name.split(".").last),
              CustomBottomSheet(
                  height: 400.h,
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: selectedLecture == null
                        ? []
                        : SubjectProvider.getSubjectsbyLecture(selectedLecture!, selectedExamType)
                            .map((e) => ListTile(
                                title: Center(
                                    child: Text(
                                  e.name,
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
                    if (selectedLecture == null) {
                      showCustomSnackBar(context, "Ders seç tatlım");
                    } else if (amount == null) {
                      showCustomSnackBar(context, "Sayfa/soru gir cnm");
                    } else {
                      BlocProvider.of<GoalBloc>(context).add(CreateGoal(
                          day: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
                          studyType: selectedStudyType,
                          amount: amount,
                          lecture: selectedLecture!,
                          subjectID: selectedSubject?.id ?? null,
                          examType: selectedExamType));

                      Navigator.pop(context);
                    }
                  })
            ],
          ),
        );
      },
    );
  }
}
