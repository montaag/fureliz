import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future showCustomModalSheet(Widget widget, BuildContext context) async {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: 500.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              height: 500.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(child: widget),
              ),
            ),
          ),
        );
      });
}
