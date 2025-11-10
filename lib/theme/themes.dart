import 'package:flutter/material.dart';
import 'package:mina_store/theme/colors.dart';
import 'package:mina_store/ui/cut_corners_border.dart';

final ThemeData appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: colorPrimary,
      onPrimary: colorOnPrimary,
      secondary: colorAccent,
      error: colorErrorRed,
    ),
    textTheme: _buildAppTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: colorAccent,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: colorBrown900,
        ),
      ),
      border: CutCornersBorder(),
    ),
  );
}

TextTheme _buildAppTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineSmall: base.headlineSmall!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        titleLarge: base.titleLarge!.copyWith(
          fontSize: 15.0,
        ),
        bodySmall: base.bodySmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyLarge: base.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'RobotoMono',
        displayColor: colorBrown900,
        bodyColor: colorBrown900,
      );
}
