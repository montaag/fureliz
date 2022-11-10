import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeliz/blocs/bloc/goal_bloc.dart';
import 'package:yeliz/config/constants.dart';
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
    List dersler = [Lecture.MATEMATIK, Lecture.TURKCE]; //TODO: DELETE THIS

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
                                content: AlertDialogContetns(),
                              );
                            }));
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
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: ((context) {
                                            return AlertDialog(
                                              title: Text("Günlük Hedefim"),
                                              content: AlertDialogContetns(),
                                            );
                                          }));
                                    }),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: state.dailyGoals
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: CustomCheckBoxListTile(goal: e),
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
