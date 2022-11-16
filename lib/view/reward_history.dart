import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:yeliz/blocs/balance/bloc/balance_bloc.dart';
import 'package:yeliz/blocs/reward/bloc/reward_bloc.dart';
import 'package:yeliz/blocs/share/bloc/share_bloc.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/models/reward.dart';
import 'package:yeliz/services/share_service.dart';

class RewardHistory extends StatefulWidget {
  const RewardHistory({Key? key}) : super(key: key);

  @override
  State<RewardHistory> createState() => _RewardHistoryState();
}

class _RewardHistoryState extends State<RewardHistory> {
  String formatDate(DateTime date) => new DateFormat("d MMMM EEEE", "tr").format(date);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return BlocProvider(
      create: (context) => ShareBloc(ShareService()),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<RewardBloc, RewardState>(
            builder: (context, state) {
              final bloc = BlocProvider.of<ShareBloc>(context);
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state is RewardInitial
                      ? listRewardsWithDates(state.rewards)
                          .map((e) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        formatDate(e.key!),
                                        style: CustomTheme.headline6(context),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            bloc.add(Share(rewards: e.value));
                                          },
                                          icon: Icon(
                                            FontAwesomeIcons.paperPlane,
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  CheckoutListView(list: e.value),
                                ],
                              ))
                          .toList()
                      : []);
            },
          ),
        ),
      ),
    );
  }

  String listToDate(List<RewardModel> list) {
    return list.first.date.toString();
  }

  List<MapEntry<DateTime?, List<RewardModel>>> listRewardsWithDates(List<RewardModel> list) {
    final Map<DateTime?, List<RewardModel>> groups = groupBy(list, (RewardModel e) {
      return e.date;
    });
    return groups.entries.toList();
  }
}

class CheckoutListView extends StatelessWidget {
  final List<RewardModel> list;
  const CheckoutListView({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: list.map((e) => CheckoutItem(rewardModel: e)).toList());
  }
}

class CheckoutItem extends StatelessWidget {
  final RewardModel rewardModel;
  const CheckoutItem({
    Key? key,
    required this.rewardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Palette.lightGrey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(rewardModel.title, style: CustomTheme.subtitle(context)),
            subtitle: Row(
              children: [
                Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 10,
                ),
                SizedBox(width: 5),
                Text(rewardModel.amount.toString(), style: CustomTheme.body(context)),
              ],
            ),
            // trailing: IconButton(
            //     onPressed: () {},
            //     icon: Icon(
            //       FontAwesomeIcons.paperPlane,
            //       color: Colors.white,
            //     )),
          )),
    );
  }
}
