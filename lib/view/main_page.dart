import 'package:cron/cron.dart' as cron;
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:yeliz/blocs/balance/bloc/balance_bloc.dart';
import 'package:yeliz/blocs/reward/bloc/reward_bloc.dart';
import 'package:yeliz/blocs/shop/bloc/basket_bloc.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/view/dashboard.dart';
import 'package:yeliz/view/reward_history.dart';
import 'package:yeliz/view/shop.dart';
import 'package:yeliz/widgets/floating_nav_bar/floating_navbar.dart';
import 'package:yeliz/widgets/floating_nav_bar/navbar_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    const Dashboard(),
    const Scaffold(body: Center(child: Text("Message"))),
    const Shop(),
    const RewardHistory(),
  ];

  String formatDate(DateTime date) => new DateFormat("d MMMM EEEE", "tr").format(date);

  @override
  Widget build(BuildContext context) {
    final basketBloc = BlocProvider.of<BasketBloc>(context);
    basketBloc.add(ResetBasket());

    final balanceBloc = BlocProvider.of<BalanceBloc>(context);
    balanceBloc.add(GetBalance());

    final rewardBloc = BlocProvider.of<RewardBloc>(context);
    rewardBloc.add(ListRewards());
    initializeDateFormatting();
    DateTime now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.backgroundColor,
        title: Text(
          selectedIndex != 3 ? formatDate(now) : "",
          style: TextStyle(color: Palette.darkGrey),
        ),
        centerTitle: false,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: FloatingNavbar(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        selectedBackgroundColor: Colors.transparent,
        backgroundColor: Palette.bottomNavBarColor,
        selectedItemColor: Palette.darkGrey,
        unselectedItemColor: Palette.lightGrey,
        borderRadius: 10,
        onTap: (int val) => setState(() => selectedIndex = val),
        currentIndex: selectedIndex,
        items: [
          FloatingNavbarItem(
            selectedIcon: FontAwesomeIcons.book,
            unselectedIcon: FontAwesomeIcons.book,
            //title: "Home",
          ),
          FloatingNavbarItem(
            selectedIcon: FontAwesomeIcons.chartLine,
            unselectedIcon: FontAwesomeIcons.chartLine,
            //title: "Chat",
          ),
          FloatingNavbarItem(
            selectedIcon: FontAwesomeIcons.solidStar,
            unselectedIcon: FontAwesomeIcons.star,
            //title: "User",
          ),
          FloatingNavbarItem(
            selectedIcon: FontAwesomeIcons.solidHeart,
            unselectedIcon: FontAwesomeIcons.heart,
            //title: "Other",
          ),
        ],
      ),
    );
  }
}
