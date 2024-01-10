// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:med_app/screems/screems.dart';
import 'package:med_app/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsService())
      ],
      child: const LoginApp(),
    );
  }
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'home_screem',
      routes: <String, WidgetBuilder>{
        'login_screem': (BuildContext context) => const LoginScreem(),
        'home_screem': (BuildContext context) => const HomeScreem(),
        'product': (BuildContext context) => const ProductScreem(),
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade300,
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.indigo,
            elevation: 0,
          )),
    );
  }
}
