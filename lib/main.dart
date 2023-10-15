import 'package:exchange_bs/providers/ThemeProvider.dart';
import 'package:exchange_bs/ui/screens/main_wrapper.dart';
import 'package:exchange_bs/ui/widgets//ThemeSwitcher.dart';
import 'package:exchange_bs/ui/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ],
    child: MyMaterialApp(),
  ));
}

class MyMaterialApp extends StatelessWidget {
  MyMaterialApp({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => MaterialApp(
        title: 'ExchangeBS',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('fa'), // Persian
        ],
        debugShowCheckedModeBanner: false,
        themeMode: value.themeMode,
        darkTheme: MyThemes.darkTheme,
        theme: MyThemes.lightTheme,
        home: Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              appBar: AppBar(
                  title: const Text('ExchangeBS'),
                  actions: const [ThemeSwitcher()]),
              body: MainWrapper(
                pageController: pageController,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              extendBody: true,
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                elevation: 0,
                child: const Icon(Icons.compare_arrows_outlined),
              ),
              bottomNavigationBar: BottomNav(
                controller: pageController,
              ),
            )),
      ),
    );
  }
}
