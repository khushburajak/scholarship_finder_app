import 'package:flutter/material.dart';
import 'package:scholarshuip_finder_app/app/constants/theme_constant.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme({required bool isDarkMode}) {
    return ThemeData(
      // change the theme according to the user preference
      colorScheme: isDarkMode
          ? const ColorScheme.dark(
              primary: const Color.fromARGB(255, 60, 139, 224),
            )
          : const ColorScheme.light(
              primary: Color.fromARGB(255, 10, 75, 144),
            ),
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      fontFamily: 'Montserrat',
      useMaterial3: true,

      // Change app bar color
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 120, 66, 227),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),

      // Change elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 153, 76, 175),
          textStyle: const TextStyle(
            fontSize: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      // Change text field theme
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 20,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 160, 76, 175),
          ),
        ),
      ),
      // Circular progress bar theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color.fromARGB(255, 158, 76, 175),
      ),
      //Bottom navigation bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 167, 74, 195),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
