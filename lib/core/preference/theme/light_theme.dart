import 'package:pernikhsi/app/config.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';

class LightTheme {
  LightTheme(this.primaryColor);

  final Color primaryColor;
  static Color disabledTextColor = AppColors.black[100]!;
  static Color secondaryColor = AppColors.green;
  static Color disabledColor = AppColors.black[300]!;
  static Color textSolidColor = AppColors.black;
  static Color errorColor = AppColors.red;
  static Color dividerColor = AppColors.white[100]!;
  static Color inputColor = AppColors.white[300]!;
  static Color scaffoldColor = AppColors.white;
  static Color cardColor = AppColors.white;
  static Color appBarColor = AppColors.white;

  ColorScheme get scheme => ColorScheme.light(
    primary: primaryColor,
    surface: primaryColor,
    secondary: secondaryColor,
  );

  ButtonThemeData get button => ButtonThemeData(
    buttonColor: primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.dp100),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: Dimens.defaultP,
      vertical: Dimens.dp14,
    ),
  );

  OutlinedButtonThemeData get outlineButton => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryColor,
      side: BorderSide(color: primaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp100),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.defaultP,
        vertical: Dimens.dp14,
      ),
      textStyle: text.bodyLarge,
    ),
  );

  ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: scaffoldColor,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp100),
      ),
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.defaultP,
        vertical: Dimens.dp14,
      ),
      textStyle: text.bodyLarge,
    ),
  );

  TextButtonThemeData get textButton => TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp100),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.defaultP,
        vertical: Dimens.dp14,
      ),
      foregroundColor: primaryColor,
      textStyle: text.bodyLarge,
    ),
  );

  CardThemeData get cardTheme => CardThemeData(
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.dp6),
      side: BorderSide(color: dividerColor),
    ),
    color: cardColor,
  );

  AppBarTheme get appBar => AppBarTheme(
    backgroundColor: scaffoldColor,
    centerTitle: true,
    titleTextStyle: text.titleLarge?.copyWith(
      color: textSolidColor,
      fontSize: Dimens.dp18,
    ),
    toolbarTextStyle: text.titleLarge?.copyWith(
      color: primaryColor,
      fontSize: Dimens.dp18,
    ),
    surfaceTintColor: appBarColor,
    elevation: 0,
    scrolledUnderElevation: 0,
    shadowColor: disabledColor.withValues(alpha: .1),
    iconTheme: IconThemeData(color: primaryColor),
    actionsIconTheme: IconThemeData(color: primaryColor),
  );

  InputDecorationTheme get inputDecoration => InputDecorationTheme(
    filled: true,
    fillColor: inputColor,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: Dimens.defaultP,
      vertical: Dimens.dp14,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(Dimens.dp10),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(Dimens.dp10),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(Dimens.dp10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
      borderRadius: BorderRadius.circular(Dimens.dp10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorColor),
      borderRadius: BorderRadius.circular(Dimens.dp10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorColor),
      borderRadius: BorderRadius.circular(Dimens.dp10),
    ),
  );

  BottomNavigationBarThemeData get bottomNav => BottomNavigationBarThemeData(
    backgroundColor: cardColor,
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: disabledColor,
    selectedItemColor: primaryColor,
    selectedLabelStyle: const TextStyle(
      fontSize: Dimens.dp10,
      fontFamily: AppConfig.fontFamily,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: Dimens.dp10,
      fontFamily: AppConfig.fontFamily,
      fontWeight: FontWeight.w500,
    ),
  );

  TabBarThemeData get tabBarTheme => TabBarThemeData(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: primaryColor,
    unselectedLabelColor: disabledTextColor,
    dividerColor: dividerColor,
    tabAlignment: TabAlignment.fill,
    labelStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConfig.fontFamily,
      fontSize: Dimens.dp16,
    ),
    unselectedLabelStyle: const TextStyle(
      fontWeight: FontWeight.normal,
      fontFamily: AppConfig.fontFamily,
      fontSize: Dimens.dp16,
    ),
  );

  TextTheme get text => TextTheme(
    bodyLarge: TextStyle(
      color: textSolidColor,
      fontSize: Dimens.dp16,
      fontWeight: FontWeight.w600,
      fontFamily: AppConfig.fontFamily,
    ),
    // Use for regular text
    bodyMedium: TextStyle(
      color: disabledTextColor,
      fontSize: Dimens.dp14,
      fontFamily: AppConfig.fontFamily,
    ),
    // Use for heading text
    headlineLarge: TextStyle(
      color: textSolidColor,
      fontWeight: FontWeight.w700,
      fontSize: Dimens.dp34,
      fontFamily: AppConfig.fontFamily,
    ),
    headlineMedium: TextStyle(
      color: textSolidColor,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.dp28,
      fontFamily: AppConfig.fontFamily,
    ),
    headlineSmall: TextStyle(
      color: textSolidColor,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.dp26,
      fontFamily: AppConfig.fontFamily,
    ),
    // Use for title text, AppBar
    titleLarge: TextStyle(
      color: textSolidColor,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.dp24,
      fontFamily: AppConfig.fontFamily,
    ),
    // Use for sub title text
    titleMedium: TextStyle(
      color: textSolidColor,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.dp16,
      fontFamily: AppConfig.fontFamily,
    ),
    labelLarge: TextStyle(
      fontSize: Dimens.dp12,
      fontFamily: AppConfig.fontFamily,
      fontWeight: FontWeight.w400,
      color: disabledTextColor,
    ),
    // Use for caption & smaall text
    bodySmall: TextStyle(
      fontSize: Dimens.dp10,
      fontFamily: AppConfig.fontFamily,
      color: disabledTextColor,
    ),
    labelSmall: TextStyle(
      fontSize: Dimens.dp8,
      fontFamily: AppConfig.fontFamily,
      fontWeight: FontWeight.w400,
      color: textSolidColor,
    ),
  );

  FloatingActionButtonThemeData get floatingButton =>
      FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: scaffoldColor,
      );

  BottomSheetThemeData get bottomSheet => BottomSheetThemeData(
    backgroundColor: cardColor,
    surfaceTintColor: scaffoldColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(Dimens.dp24)),
    ),
  );

  DividerThemeData get divider => DividerThemeData(
    color: dividerColor.withValues(alpha: .5),
    thickness: Dimens.dp4,
    space: Dimens.dp8,
  );

  BottomAppBarThemeData get bottomAppBarTheme => BottomAppBarThemeData(
    color: scaffoldColor,
    padding: EdgeInsets.zero,
    shape: const CircularNotchedRectangle(),
  );

  ListTileThemeData get listTileTheme => const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(
      horizontal: Dimens.defaultP,
      vertical: Dimens.dp12,
    ),
  );

  DatePickerThemeData get datePickerTheme => DatePickerThemeData(
    backgroundColor: scaffoldColor,
    surfaceTintColor: scaffoldColor,
    dividerColor: dividerColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.dp12),
    ),
    rangeSelectionBackgroundColor: secondaryColor.withValues(alpha: .5),
    headerForegroundColor: textSolidColor,
    weekdayStyle: text.bodyMedium?.copyWith(color: textSolidColor),
    dayStyle: text.bodyMedium?.copyWith(color: textSolidColor),
  );

  TimePickerThemeData get timePickerTheme => TimePickerThemeData(
    backgroundColor: scaffoldColor,
    dialBackgroundColor: scaffoldColor,
    hourMinuteColor: scaffoldColor,
    hourMinuteTextColor: disabledColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.dp12),
    ),
  );

  CheckboxThemeData get checkboxThemeData {
    return CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp4),
      ),
      side: BorderSide(color: disabledColor, width: Dimens.dp2),
    );
  }

  DialogThemeData get dialogTheme {
    return DialogThemeData(
      backgroundColor: scaffoldColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp6),
      ),
      insetPadding: const EdgeInsets.all(Dimens.defaultP),
    );
  }

  ThemeData get toTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppConfig.fontFamily,
      bottomAppBarTheme: bottomAppBarTheme,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldColor,
      canvasColor: scaffoldColor,
      disabledColor: disabledColor,
      textTheme: text,
      cardTheme: cardTheme,
      appBarTheme: appBar,
      dividerColor: dividerColor,
      unselectedWidgetColor: disabledColor,
      buttonTheme: button,
      inputDecorationTheme: inputDecoration,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      outlinedButtonTheme: outlineButton,
      elevatedButtonTheme: elevatedButton,
      textButtonTheme: textButton,
      listTileTheme: listTileTheme,
      bottomNavigationBarTheme: bottomNav,
      tabBarTheme: tabBarTheme,
      floatingActionButtonTheme: floatingButton,
      bottomSheetTheme: bottomSheet,
      dividerTheme: divider,
      cardColor: cardColor,
      datePickerTheme: datePickerTheme,
      timePickerTheme: timePickerTheme,
      checkboxTheme: checkboxThemeData,
      dialogTheme: dialogTheme,
      drawerTheme: DrawerThemeData(backgroundColor: scaffoldColor),
      colorScheme: scheme.copyWith(error: errorColor),
    );
  }
}
