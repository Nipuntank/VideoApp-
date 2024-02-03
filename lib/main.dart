// import 'package:flutter/gestures.dart';  // unused import
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
// import 'home_page/home_page_widget.dart';
// import '/futures/futures_widget.dart';
// import 'index.dart';                    // unused import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await FlutterFlowTheme.initialize();

  // Initialize the AppStateNotifier
  AppStateNotifier _appStateNotifier = AppStateNotifier.instance;

  // Create the router without zipFilePath and enteredText
  GoRouter _router = createRouter(_appStateNotifier);

  runApp(MyApp(router: _router));
}

class MyApp extends StatefulWidget {
  final GoRouter router;

  const MyApp({Key? key, required this.router}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'project',
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      themeMode: _themeMode,
      routerDelegate: widget.router.routerDelegate,
      routeInformationParser: widget.router.routeInformationParser,
      routeInformationProvider: widget.router.routeInformationProvider,
    );
  }
}
