// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeliz/blocs/balance/bloc/balance_bloc.dart';
import 'package:yeliz/blocs/shop/bloc/basket_bloc.dart';

import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/dataProvider/reward_provider.dart';
import 'package:yeliz/models/reward.dart';
import 'package:yeliz/view/main_page.dart';
import 'package:yeliz/widgets/custom_alert_dialog.dart';
import 'package:yeliz/widgets/custom_button.dart';
import 'package:yeliz/widgets/custom_snack_bar.dart';
import 'package:yeliz/widgets/shop_item.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  double araToplam = 0;
  List<Reward> shopItems = RewardProvider.getRewards();
  List<RewardModel> selectedItems = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final balanceBloc = BlocProvider.of<BalanceBloc>(context);
    final basketBloc = BlocProvider.of<BasketBloc>(context);

    return BlocListener<BalanceBloc, BalanceState>(
      listener: (context, state) {
        if (state is PurchaseFailed) {
          showCustomSnackBar(context, state.error.message);
        }
      },
      child: Column(
        children: [
          SizedBox(height: 10),
          toplamYildiz(context),
          SizedBox(height: 20),
          BlocBuilder<BasketBloc, BasketState>(
            builder: (context, state) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    shrinkWrap: false,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: shopItems
                        .map((e) => ShopItem(
                              reward: e,
                              onTap: () {
                                setState(() {
                                  e.isSelected = !e.isSelected;
                                  e.isSelected
                                      ? BlocProvider.of<BasketBloc>(context).add(AddToBasket(reward: e))
                                      : BlocProvider.of<BasketBloc>(context).add(RemoveFromBasket(reward: e));
                                });
                                if (e.isSelected) {
                                  selectedItems.add(e.reward);
                                } else {
                                  selectedItems.remove(e.reward);
                                }
                              },
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Ara Toplam",
                      style: CustomTheme.subtitle(context),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        BlocBuilder<BasketBloc, BasketState>(
                          builder: (context, state) {
                            return Text(
                              removeDecimalZeroFormat(state.total),
                              style: CustomTheme.headline6(context),
                            );
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.solidStar,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: CustomButton(
                      text: "Ödül Topla",
                      customButtonType: CustomButtonType.primary,
                      onPressed: () {
                        double amount = BlocProvider.of<BasketBloc>(context).state.total;
                        if (amount == 0.0) {
                          showCustomSnackBar(context, "Ara toplam 0");
                        } else {
                          balanceBloc.add(SpendBalance(selectedItems));
                          showCustomDialog(
                              context,
                              true,
                              CustomAlert(
                                description: "Ödül toplama başarılı",
                                type: CustomAlertType.success,
                                onPressed: () {
                                  basketBloc.add(ResetBasket());
                                  Navigator.pop(context);
                                  for (var element in shopItems) {
                                    setState(() {
                                      element.isSelected = false;
                                    });
                                  }
                                },
                              ));
                        }
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget toplamYildiz(BuildContext context) {
    return BlocBuilder<BalanceBloc, BalanceState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Toplanılan Yıldız",
                    style: CustomTheme.subtitle(context),
                  ),
                  Row(
                    children: [
                      Text(
                        removeDecimalZeroFormat(state.balance),
                        style: CustomTheme.headline6(context),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.solidStar,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "ablan sana gurban olsun",
                style: CustomTheme.body(context, color: Palette.primaryColor),
              ),
            ],
          ),
        );
      },
    );
  }
}
