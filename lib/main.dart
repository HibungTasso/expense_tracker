import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.blueAccent);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    fn,
  ) {
    runApp(
      MaterialApp(
        //Working with App theme
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: AppBarThemeData().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: CardThemeData().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorScheme.onSecondaryContainer,
              fontSize: 16,
            ),
          ),
        ),

        //Dark theme
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme: CardThemeData().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
            ),
          ),
          //Input TextField Style
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.white),
            floatingLabelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white70),
          ),
        ),

        //Home Content
        home: Expenses(),
      ),
    );
  });
}
