import 'package:flutter/material.dart';
import 'package:meme_generator/themes.dart';
import 'package:meme_generator/views/home_view.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Meme Generator',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: MyThemes.lightColorScheme,
          fontFamily: GoogleFonts.dmSans().fontFamily,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: MyThemes.darkColorScheme,
          fontFamily: GoogleFonts.dmSans().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        home: HomeView(),
      ),
    );
  }
}
