import 'package:flutter/material.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? extra;
  final IconButton? iconButton;
  final Color color;

  const CustomCard({Key? key, required this.title, this.subtitle, this.iconButton, this.extra, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 250,
      decoration: BoxDecoration(
        color: color.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      title,
                      style: CustomTheme.subtitle(context, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      subtitle ?? '',
                      style: CustomTheme.subtitle(context),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: extra ?? iconButton,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
