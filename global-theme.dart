import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext context) {
  return FlexThemeData.light(
    scheme: FlexScheme.blue,
    scaffoldBackground: Color(0xffEDF1F4),
    primary: Color(0xff428AFF),
    secondary: Color(0xffFF5D21),
    onPrimary: Colors.white,
    appBarElevation: 0,
    appBarStyle: FlexAppBarStyle.primary,
    textTheme: GoogleFonts.aBeeZeeTextTheme(),
    bottomAppBarElevation: 0,
    applyElevationOverlayColor: false,
  ).copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff428AFF),
        foregroundColor: Colors.white,
        maximumSize: Size(MediaQuery.of(context).size.width - 40, 50),
        minimumSize: Size(MediaQuery.of(context).size.width - 40, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        textStyle: GoogleFonts.aBeeZee(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xff428AFF),
        textStyle: GoogleFonts.aBeeZee(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Color(0xff428AFF),
        side: BorderSide(color: Color(0xff428AFF), width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: GoogleFonts.aBeeZee(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xff428AFF), width: 2),
      ),
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff428AFF),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.aBeeZee(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    listTileTheme: ListTileThemeData(
      minTileHeight: 50,
      iconColor: Color(0xff428AFF), // Leading and trailing icon color
      textColor: Colors.black, // Title and subtitle text color
      tileColor: Colors.white, // Background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // BottomNavigationBar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white, // Background color
      selectedItemColor: Color(0xff428AFF), // Selected item color
      unselectedItemColor: Colors.grey, // Unselected item color
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
    ),

    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor:
          Color(0xff428AFF).lighten().brighten().brighten(), // Background color
      deleteIconColor: Colors.grey, // Delete icon color
      labelStyle: TextStyle(color: Color(0xff428AFF)), // Label text color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    ),
    iconTheme: IconThemeData(color: Color(0xff428AFF)),
  );
}

ThemeData darkTheme(BuildContext context) {
  return FlexThemeData.dark(
    scheme: FlexScheme.deepOrangeM3,
    primary: Color(0xffFF5D21),
    secondary: Color(0xff428AFF),
    onPrimary: Colors.white,
    appBarElevation: 0,
    appBarStyle: FlexAppBarStyle.primary,
    textTheme: GoogleFonts.aBeeZeeTextTheme(),
    bottomAppBarElevation: 0,
    applyElevationOverlayColor: false,
  ).copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffFF5D21),
        foregroundColor: Colors.white,
        maximumSize: Size(MediaQuery.of(context).size.width - 40, 50),
        minimumSize: Size(MediaQuery.of(context).size.width - 40, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        textStyle: GoogleFonts.aBeeZee(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xffFF5D21),
        textStyle: GoogleFonts.aBeeZee(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Color(0xffFF5D21),
        side: BorderSide(color: Color(0xffFF5D21), width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: GoogleFonts.aBeeZee(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white24,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xffFF5D21), width: 2),
      ),
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white24,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffFF5D21),
      foregroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      titleTextStyle: GoogleFonts.aBeeZee(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),

    listTileTheme: ListTileThemeData(
      minTileHeight: 50,
      iconColor: Color(0xffFF5D21), // Leading and trailing icon color
      textColor: Colors.white, // Title and subtitle text color
      tileColor: Colors.white24, // Background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // BottomNavigationBar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black, // Background color
      selectedItemColor: Color(0xffFF5D21), // Selected item color
      unselectedItemColor: Colors.grey, // Unselected item color
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
    ),
    chipTheme: ChipThemeData(
      backgroundColor:
          Color(0xffFF5D21).lighten().brighten(), // Background color
      deleteIconColor: Color(0xffFF5D21), // Delete icon color
      labelStyle: TextStyle(color: Color(0xffFF5D21)), // Label text color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    ),
  );
}
