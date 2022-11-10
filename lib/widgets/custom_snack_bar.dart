import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yeliz/config/palette.dart';
import 'package:yeliz/config/theme.dart';

void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 0,
    content: SizedBox(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.close, color: Colors.white, size: 20),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: CustomTheme.subtitle(context, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
    backgroundColor: Palette.dangerColor,
    duration: Duration(seconds: 2),
  ));
}
