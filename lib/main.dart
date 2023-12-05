import 'package:budget_planner/pages/home_page.dart';
import 'package:budget_planner/pages/splash_page.dart';
import 'package:budget_planner/theme.dart';
import 'package:budget_planner/theme_notifier.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:budget_planner/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  //preferences.clear();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(ChangeNotifierProvider(
      create: (context) => DarkMode(), child: const MyApp()));
  // runApp(DevicePreview(
  //   builder: (context) => ChangeNotifierProvider(
  //       create: (context) => DarkMode(), child: const MyApp()), // Wrap your app
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///accessing the variable of provider class
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dark Mode',
          theme: Provider.of<ThemeProvider>(context).currentTheme,
          home: const SplachScreen(),
        );
      }),
    );
  }
}

class DarkMode with ChangeNotifier {
  bool darkMode = true;

  ///by default it is true
  ///made a method which will execute while switching
  changemode() {
    darkMode = !darkMode;
    notifyListeners();

    ///notify the value or update the widget value
  }
}
