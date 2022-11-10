import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/view/dashboard.dart';
import 'package:yeliz/view/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale("tr"),
          title: 'FÜRELİZ',
          theme: CustomTheme.lightTheme,
          home: MainScreen(),
        );
      },
    );
  }
}
