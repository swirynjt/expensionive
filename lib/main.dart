import 'package:flutter/material.dart';
import 'expensionive.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent);
var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 26, 24, 24));

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
         appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onBackground,
          foregroundColor: kDarkColorScheme.background,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              displayMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'fred',
                fontSize: 20,
                color: kColorScheme.onSurface,
              ),
            ),
        iconTheme: ThemeData().iconTheme.copyWith(color: kDarkColorScheme.error),
        bottomSheetTheme: ThemeData().bottomSheetTheme.copyWith(backgroundColor: kDarkColorScheme.inverseSurface)
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.inverseSurface,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            displayMedium: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: 'newrocker',
              fontSize: 17,
              color: kColorScheme.onBackground,
            )),
      ),
      themeMode: ThemeMode.system,
      home: const Expensionive(),
    ),
  );
}
