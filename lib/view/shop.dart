// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/widgets/custom_button.dart';
import 'package:yeliz/widgets/shop_item.dart';

class Reward {
  final String title;
  final int amount;
  final IconData icon;
  bool isSelected;
  Reward({
    required this.title,
    required this.amount,
    required this.icon,
    this.isSelected = false,
  });
}

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int araToplam = 0;
  List<Reward> shopItems = [
    Reward(title: "İskender Döner", amount: 10, icon: FontAwesomeIcons.bowlFood),
    Reward(title: "İskender", amount: 10, icon: FontAwesomeIcons.bowlFood),
    Reward(title: "İskender", amount: 10, icon: FontAwesomeIcons.bowlFood),
    Reward(title: "İskender", amount: 10, icon: FontAwesomeIcons.bowlFood),
    Reward(title: "İskender", amount: 10, icon: FontAwesomeIcons.bowlFood),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Icon(
        //         FontAwesomeIcons.solidStar,
        //         color: Colors.amber,
        //       ),
        //       Text(
        //         "Hedeflerini tuttur, yıldızları topla",
        //         style: CustomTheme.subtitle(context),
        //       ),
        //       Icon(
        //         FontAwesomeIcons.solidStar,
        //         color: Colors.amber,
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(height: 10),
        toplamYildiz(context),
        SizedBox(height: 20),
        Expanded(
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
                            araToplam = araToplam + e.amount;
                          });
                          print(araToplam);
                        },
                      ))
                  .toList(),
            ),
          ),
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
                      Text(
                        araToplam.toString(),
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
              SizedBox(
                width: 50,
              ),
              Expanded(
                child: CustomButton(text: "Ödül Topla", customButtonType: CustomButtonType.primary, onPressed: () {}),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding toplamYildiz(BuildContext context) {
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
                    "50",
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
  }
}
