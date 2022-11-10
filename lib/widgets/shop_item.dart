import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';
import 'package:yeliz/models/reward.dart';
import 'package:yeliz/view/shop.dart';

class ShopItem extends StatefulWidget {
  final Reward reward;
  void Function()? onTap;

  ShopItem({
    Key? key,
    required this.reward,
    this.onTap,
  }) : super(key: key);

  @override
  State<ShopItem> createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 12,
                          ),
                          SizedBox(width: 3),
                          Text(
                            widget.reward.amount.toString(),
                            style: TextStyle(fontSize: 12, color: Palette.lightGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Center(
                    child: Icon(
                  widget.reward.icon,
                  color: Palette.orangeColor,
                )),
                SizedBox(height: 4),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      widget.reward.title,
                      style: CustomTheme.body(context, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 2),
              ],
            ),
          ),
          Positioned(
            top: -15,
            right: -15,
            child: Transform.scale(
              scale: 2,
              child: Checkbox(
                checkColor: Palette.successColor,
                fillColor: MaterialStateProperty.all(Colors.transparent),
                value: widget.reward.isSelected,
                shape: CircleBorder(),
                onChanged: (bool? value) {
                  setState(() {
                    widget.reward.isSelected = value!;
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
