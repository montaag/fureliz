import 'package:flutter/material.dart';

mixin Palette {
  //? COLORS

  static const MaterialColor primaryColor = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFe8f4e4),
      100: Color(0xFFd8ecd2),
      200: Color(0xFFc9e5c0),
      300: Color(0xFFb9ddae),
      400: Color(0xFFaad69c),
      500: Color(_primaryValue),
      600: Color(0xFF8ac678),
      700: Color(0xFF7bbf66),
      800: Color(0xFF6bb754),
      900: Color(0xFF5fab47),
    },
  );
  static const int _primaryValue = 0xFF9ACE8A;
  static Color greyTextColor = Colors.grey;

  static Color greenColor = const Color(0xFFE1FFB1);
  static Color turquoise = const Color(0xFF92f6e6);
  static Color blue = const Color(0xFF91dbf7);
  static Color purple = const Color(0xFFb570f4);
  static Color pinkColor = const Color(0xFFFC4C61);

  static Color orangeColor = const Color(0xFFFF932C);
  static Color secondaryColor = Colors.white.withOpacity(0.65);

  static const MaterialColor dangerColor = MaterialColor(
    _dangerValue,
    <int, Color>{
      50: Color(0xFFFFEEEB),
      100: Color(0xFFFEDDD6),
      200: Color(0xFFFDBBAD),
      300: Color(0xFFFC9A84),
      400: Color(0xFFFB785B),
      500: Color(_dangerValue),
      600: Color(0xFFC84528),
      700: Color(0xFF96341E),
      800: Color(0xFF642214),
      900: Color(0xFF32110A),
    },
  );
  static const int _dangerValue = 0xFFFA5632;

  static const MaterialColor warningColor = MaterialColor(
    _warningValue,
    <int, Color>{
      50: Color(0xFFFFF8E9),
      100: Color(0xFFFFF1D2),
      200: Color(0xFFFFE4A5),
      300: Color(0xFFFFD678),
      400: Color(0xFFFFC94B),
      500: Color(_warningValue),
      600: Color(0xFFCC9618),
      700: Color(0xFF997012),
      800: Color(0xFF664B0C),
      900: Color(0xFF332506),
    },
  );
  static const int _warningValue = 0xFFFFBB1E;

  static const MaterialColor successColor = MaterialColor(
    _successValue,
    <int, Color>{
      50: Color(0xFFE6F9EE),
      200: Color(0xFFCDF3DD),
      100: Color(0xFF9CE7BC),
      300: Color(0xFF6ADB9A),
      400: Color(0xFF39CF79),
      500: Color(_successValue),
      600: Color(0xFF069C46),
      700: Color(0xFF05893D),
      800: Color(0xFF04622C),
      900: Color(0xFF023A1A),
    },
  );
  static const int _successValue = 0xFF07C357;

  static const MaterialColor grayColor = MaterialColor(
    _grayValue,
    <int, Color>{
      50: Color(0xFFF7F9FA),
      100: Color(0xFFEFF2F5),
      200: Color(0xFFDFE5EB),
      300: Color(0xFFCED8E1),
      400: Color(0xFFBECBD7),
      500: Color(_grayValue),
      600: Color(0xFF8B98A4),
      700: Color(0xFF68727B),
      800: Color(0xFF464C52),
      900: Color(0xFF232629),
    },
  );
  static const int _grayValue = 0xFFAEBECD;

  static Color primaryTextColor = darkGrey;
  static Color secondaryTextColor = primaryColor;
  static Color bodyTextColor = Colors.black;
  static Color hintTextColor = grayColor.shade600;
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color backgroundColorDARK = Color(0xFF373737);
  static Color bottomNavBarColor = const Color(0xFFFAFAFA);
  static Color lightGrey = const Color(0xFFB8BDBF);
  static Color darkGrey = const Color(0xFF353535);
  static LinearGradient linearGradient = LinearGradient(
    colors: [
      pinkColor,
      orangeColor,
    ],
  );

  static List<Color> colors = [Palette.purple, Palette.blue, Palette.greenColor, Palette.orangeColor, Palette.pinkColor];
  static Color getColors(int index) {
    return colors[index % colors.length];
  }

  static Color getReverseColor(int index) {
    return colors.reversed.toList()[index % colors.length];
  }
}
