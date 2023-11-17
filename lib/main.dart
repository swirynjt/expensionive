import 'package:flutter/material.dart';
import 'expensionive.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent);

void main() {
  runApp(
    MaterialApp(
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
      home: const Expensionive(),
    ),
  );
}
