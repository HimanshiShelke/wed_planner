import 'package:flutter/material.dart';


ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Color(0xffF7DBD3),
    //scaffoldBackgroundColor: Colors.pink.shade50,
    fontFamily: 'Baskerville',
    primarySwatch: Colors.brown,
    inputDecorationTheme: inputDecorationTheme(),
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextStyle textStyle(){
  return TextStyle(
    fontSize: 20,
    color: Colors.black54
  );
}

IconThemeData iconThemeData(){
  return IconThemeData(
    size: 16
  );
}
ListTileThemeData listTileThemeData(){
return ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    iconColor: Colors.red[900],
    textColor: Colors.black54,
    tileColor: Colors.white54,
    style: ListTileStyle.list,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    //dense: true,
  );
}

CardTheme cardTheme(){
  return CardTheme(
    elevation: 5.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  );
}

InputDecorationTheme inputDecorationTheme(){
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal:10, vertical: 20),
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.pink.shade900,),
      //gapPadding: 9,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.red.shade900,),
      //gapPadding: 9,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.red.shade900,),
      //gapPadding: 9,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color:Colors.pink.shade900,),
      //gapPadding: 5,
    ),
  );
}


AppBarTheme appBarTheme(){
  return AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black45,),
    titleTextStyle: TextStyle(color: Colors.pink[900],fontSize:28, fontWeight: FontWeight.w600, fontFamily: 'Baskerville',),
  );
}