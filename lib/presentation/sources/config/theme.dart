import 'package:flutter/material.dart';
import 'package:life_hope/presentation/resources/resources.dart';
import 'package:life_hope/presentation/utils/constants/constants.dart';

final ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.blueAccent.withOpacity(0.5),
  ),
  colorScheme: ColorScheme.light(
    shadow: Colors.transparent,
    brightness: Brightness.light,
    primary: AppColors.primary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundLight,
    surfaceTintColor: Colors.transparent,
  ),
  primaryColor: AppColors.primary,
  shadowColor: Colors.transparent,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.backgroundLight,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.borderRadiusLg)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColors.primary,
  ),
  cardTheme: CardTheme(
    color: AppColors.primary,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.lg * 4),
      side: BorderSide.none,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      backgroundColor: WidgetStateProperty.all<Color?>(Colors.transparent),
      foregroundColor: WidgetStateProperty.all<Color?>(AppColors.backgroundLight),
      overlayColor: WidgetStateProperty.all<Color?>(Colors.transparent),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateColor.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        } else {
          return AppColors.backgroundLight;
        }
      },
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 11,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      fontSize: 12,
    ),
  ),
);

final ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.blueAccent.withOpacity(0.5),
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary,
  ),
  primaryColor: AppColors.primary,
  bottomSheetTheme: const BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.borderRadiusLg)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColors.primary,
  ),
  cardTheme: CardTheme(
    color: AppColors.primary,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.lg * 4),
      side: BorderSide.none,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
        return const TextStyle(fontFamily: 'Tinos', fontWeight: FontWeight.w400, fontSize: 16);
      }),
      padding: WidgetStateProperty.all<EdgeInsets>(
        const EdgeInsets.fromLTRB(12, 12, 12, 12),
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.primary.withOpacity(0.38);
          }
          return AppColors.primary;
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.white.withOpacity(0.38);
          }
          return Colors.white;
        },
      ),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 11,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Tinos',
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontSize: 12,
    ),
  ),
);

extension CustomStyles on TextTheme {
  get error => (BuildContext context) => TextStyle(
        fontSize: 14.0,
        color: Theme.of(context).colorScheme.error,
        fontWeight: FontWeight.normal,
      );

  get placeHolder => (BuildContext context) => TextStyle(
        fontSize: 12.0,
        fontFamily: "Tinos",
        color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white : AppColors.textColor,
        fontWeight: FontWeight.normal,
      );
}
