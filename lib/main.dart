import 'package:aali_history/data/is_large.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

void main() {
  runApp(const AaliApp());
}

class AaliApp extends StatelessWidget {
  const AaliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aali History',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        dividerColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepOrange,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemStatusBarContrastEnforced: false,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarContrastEnforced: false,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      locale: const Locale("ar", "AE"),
      scrollBehavior: const CupertinoScrollBehavior(),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: IsLarge(
          isLarge: MediaQuery.sizeOf(context).shortestSide > 600,
          child: const AaliHome(),
        ),
      ),
    );
  }
}
