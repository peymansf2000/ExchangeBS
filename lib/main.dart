import 'package:exchange_bs/providers/ThemeProvider.dart';
import 'package:exchange_bs/ui_helper/ThemeSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ThemeProvider(),)]
    , child: const MyMaterialApp(),));
}


class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, child) =>
        MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode:value.themeMode,
          darkTheme: MyThemes.darkTheme,
          theme: MyThemes.lightTheme,
          home: Directionality(textDirection: TextDirection.ltr,
              child: Scaffold(appBar: AppBar(
                  title: const Text('ExchangeBS'), actions: const [ThemeSwitcher()]),)),
        ),

    );
  }
}
