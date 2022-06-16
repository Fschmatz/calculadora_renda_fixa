import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFFFFFF),
    colorScheme: ColorScheme.light(
      primary: Colors.green.shade700,
      onPrimary: const Color(0xFFFFFFFF),
      onSecondary: Colors.green.shade700,
      secondary: Colors.green.shade700,
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFFFFFFFF),
      color: Color(0xFFFFFFFF),
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    cardTheme: const CardTheme(
      color: Color(0xFFE9EBEA),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFFFFFFFF),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green.shade700,
    ),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFFAFBFA),
        focusColor: Colors.green.shade700,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green.shade700,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF9CA296),
            ),
            borderRadius: BorderRadius.circular(8.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF9CA296),
            ),
            borderRadius: BorderRadius.circular(8.0))),
    bottomAppBarColor: const Color(0xFFE0E0E0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Colors.green.shade700,
      ),
      selectedLabelStyle: TextStyle(
        color: Colors.green.shade700,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: const Color(0xFFFFFFFF),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFFFFFFF),
        indicatorColor: Colors.green.shade700,
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFF050505),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFF050505), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFFFFFFFF)));

ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF202022),
    scaffoldBackgroundColor: const Color(0xFF202022),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF8cd97d),
      onPrimary: Color(0xFF003A00),
      onSecondary: Color(0xFF8cd97d),
      secondary: Color(0xFF8cd97d),
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF202022),
      color: Color(0xFF202022),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF303136),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF303032),
    ),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF272729),
        focusColor: const Color(0xFF8cd97d),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF8cd97d),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF5F645C),
            ),
            borderRadius: BorderRadius.circular(8.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF5F645C),
            ),
            borderRadius: BorderRadius.circular(8.0))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Color(0xFF8cd97d)),
      selectedLabelStyle: TextStyle(color: Color(0xFF8cd97d)),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFF202022),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF80DA8A), //353537
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF202022),
        indicatorColor: const Color(0xFF8cd97d),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFFEAEAEA),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFEAEAEA), fontWeight: FontWeight.w500))),
    bottomAppBarColor: const Color(0xFF202022),
    bottomSheetTheme:
        const BottomSheetThemeData(modalBackgroundColor: Color(0xFF202022)));
