import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/models/goal.dart';
import 'package:yeliz/models/subject.dart';

class CustomCheckBoxListTile extends StatefulWidget {
  final Goal goal;
  const CustomCheckBoxListTile({
    Key? key,
    required this.goal,
  }) : super(key: key);

  @override
  State<CustomCheckBoxListTile> createState() => _CustomCheckBoxListTileState();
}

class _CustomCheckBoxListTileState extends State<CustomCheckBoxListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        // color: Palette.primaryColor.withOpacity(0.08),
        color: widget.goal.subject.examType == ExamType.TYT ? Palette.blue.withOpacity(0.3) : Palette.purple.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                widget.goal.subject.name,
                style: CustomTheme.headline6(context),
              ),
              subtitle: Text(
                widget.goal.amount.toString() + (widget.goal.studyType == StudyType.KONU_ANLATIMI ? " sayfa" : "soru"),
                style: CustomTheme.subtitle(context, color: Palette.grayColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Transform.scale(
              scale: 1.8,
              child: Checkbox(
                checkColor: Palette.successColor,
                fillColor: MaterialStateProperty.all(Colors.white),
                value: widget.goal.isAchieved,
                shape: CircleBorder(),
                onChanged: (bool? value) {
                  setState(() {
                    widget.goal.isAchieved = value!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// CheckboxListTile(
//       selectedTileColor: Palette.successColor.shade300,
//       activeColor: Palette.successColor,
//       checkboxShape: CircleBorder(),
//       value: widget.goal.isAchieved,
//       onChanged: (value) {
//         setState(() {
//           widget.goal.isAchieved = value!;
//         });
//       },
//       title: Text(
//         widget.goal.subject.lecture.toString().split(".").last,
//         style: CustomTheme.headline6(context),
//       ),
//       subtitle: Text(
//         widget.goal.subject.name,
//         style: CustomTheme.subtitle(context, color: Palette.grayColor),
//       ),
//     );