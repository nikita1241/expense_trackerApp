import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //to lock device orientation

import 'package:expense_tracker/widgets/expenses.dart';
import "dart:io"; //to use Platform.isIOS to run diff code for diff platform/device
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([ //setpref.. is future
  //   DeviceOrientation.portraitUp, //prevent app to adjust to orientation other than this
  // ]).then((fn) { //app starts only when orientation is locked in
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
        ),
        theme: ThemeData().copyWith(
        
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
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
        // themeMode: ThemeMode.system, // default
        home: const Expenses(),
      ),
    );
  }
//   );
// }

/*import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

// k prefix for global var-good prac 
var kColorScheme = ColorScheme.fromSeed( //one base color se color scheme throughout app
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark, //opt for dark mode
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp( 
      //dark theming if phone has dark mode on
      darkTheme: ThemeData.dark().copyWith( 
        // useMaterial3: true, //no need as it is by def
        colorScheme: kDarkColorScheme,
        //card
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        //button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),

//general theming
      theme: ThemeData().copyWith(//copywith-to use defaults and not customise each n evrything, override few styles

        //to apply color on many pages      
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          //for all appbars
          backgroundColor: kColorScheme.onPrimaryContainer, //bg color fr appbar
          //based on seed color
          foregroundColor: kColorScheme.primaryContainer,
        ),
        //we used card for expense items, override its theme
        cardTheme: const CardTheme().copyWith( //for all cards
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        //for button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        //for text
        textTheme: ThemeData().textTheme.copyWith(
          //for main title
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),

      // themeMode: ThemeMode.system, // default-accd to system
      home: const Expenses(),
    ),
  );
}
//we can override general theming in individual widgets too
*/