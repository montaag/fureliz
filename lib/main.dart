import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeliz/blocs/bloc/goal_bloc.dart';
import 'package:yeliz/blocs/shop/bloc/basket_bloc.dart';
import 'package:yeliz/blocs/simple_bloc_observer.dart';
import 'package:yeliz/config/settingsProvider.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/dataProvider/database.dart';
import 'package:yeliz/dataProvider/database_interface.dart';
import 'package:yeliz/view/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SettingsProvider settings = await SharedPrefsSettingsProvider.load();
  Bloc.observer = SimpleBlocObserver();
  final Database data = await Database.create();

  runApp(MyApp(
    data: data,
    settings: settings,
  ));
}

class MyApp extends StatelessWidget {
  final SettingsProvider settings;
  final DatabaseProvider data;

  const MyApp({Key? key, required this.settings, required this.data}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BasketBloc>(
          create: (_) => BasketBloc(),
        ),
        BlocProvider<GoalBloc>(
          create: (_) => GoalBloc(data),
        ),
      ],
      child: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: Locale("tr"),
            title: 'FÜRELİZ',
            theme: CustomTheme.lightTheme,
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
