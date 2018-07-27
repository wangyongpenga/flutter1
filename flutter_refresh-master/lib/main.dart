import 'dart:async' show Future, Timer;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_refresh/widget/home_page.dart';
import 'package:flutter_refresh/widget/network_page.dart';


void main() {
  runApp(new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // StudyLocalizationsDelegate.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => new HomePage(),
        '/NetworkPage': (BuildContext context) => new NetworkPage(),
      },

      home: new HomePage()
  ));
}









