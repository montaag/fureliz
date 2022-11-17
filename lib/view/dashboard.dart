import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yeliz/blocs/bloc/goal_bloc.dart';
import 'package:yeliz/config/constants.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/dataProvider/subject_provider.dart';
import 'package:yeliz/models/classes.dart';
import 'package:yeliz/models/goal.dart';
import 'package:yeliz/models/subject.dart';
import 'package:yeliz/widgets/create_goal_Alert.dart';
import 'package:yeliz/widgets/custom_alert_dialog.dart';
import 'package:yeliz/widgets/custom_bottom_sheet.dart';
import 'package:yeliz/widgets/custom_button.dart';
import 'package:yeliz/widgets/custom_card.dart';
import 'package:yeliz/widgets/custom_checkboxListTile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  children: SubjectProvider()
                      .getTYTLectures()
                      .map(
                        (e) => CustomCard(
                          title: e.name,
                          subtitle: SubjectProvider.getSubjectCount(e, ExamType.TYT).toString() + " Konu",
                          color: Palette.getColors(SubjectProvider().getTYTLectures().indexOf(e)),
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
                  children: SubjectProvider()
                      .getAYTLectures()
                      .map(
                        (e) => CustomCard(
                          title: e.name,
                          subtitle: SubjectProvider.getSubjectCount(e, ExamType.AYT).toString() + " Konu",
                          color: Palette.getReverseColor(SubjectProvider().getAYTLectures().indexOf(e)),
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
                      onPressed: () async {
                        await showCustomModalSheet(AlertDialogContetns(), context);
                      },
                      icon: Icon(Icons.add_circle_outline)),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<GoalBloc, GoalState>(builder: (context, state) {
                if (state is GoalInitial) {
                  return state.dailyGoals.isEmpty
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
                                    onPressed: () async {
                                      await showCustomModalSheet(AlertDialogContetns(), context);
                                    }),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: state.dailyGoals
                              .map((e) => Slidable(
                                    key: ValueKey(state.dailyGoals.indexOf(e)),
                                    endActionPane: ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          flex: 2,
                                          onPressed: (context) {
                                            BlocProvider.of<GoalBloc>(context).add(DeleteGoal(goal: e));
                                          },
                                          backgroundColor: Palette.dangerColor,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Sil',
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: CustomCheckBoxListTile(goal: e),
                                    ),
                                  ))
                              .toList(),
                        );
                }

                return SizedBox();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
