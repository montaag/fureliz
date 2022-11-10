// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';

class CustomBottomSheet extends StatefulWidget {
  Widget widget;
  String text;
  double? height;

  CustomBottomSheet({
    Key? key,
    required this.widget,
    required this.text,
    this.height,
  }) : super(key: key);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {});
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return Container(
                  height: widget.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(child: widget.widget),
                    ),
                  ),
                );
              });
        },
        child: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      widget.text,
                      style: CustomTheme.subtitle(context, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  child: Icon(Icons.keyboard_arrow_down),
                  margin: EdgeInsets.only(right: 20),
                )
              ],
            ),
          ),
          height: 54,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Palette.grayColor),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}
