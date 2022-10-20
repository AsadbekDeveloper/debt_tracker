import 'package:debt_tracker/provider/debts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'screens/home_screen.dart';
import 'screens/add_debt_screen.dart';
import './screens/profile_screen.dart';
import './screens/debtors_screen.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    create: (context) => DebtModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Debt Tracker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: mainBlue,
        appBarTheme: AppBarTheme(color: mainBlue),
        drawerTheme: DrawerThemeData(backgroundColor: mainBlue),
      ),
      routes: {
        '/': ((context) => HomePage()),
        AddDebtor.id: (context) => AddDebtor(),
        ProfileScreen.id: (context) => ProfileScreen(),
        DebtorsScreen.id: (context) => DebtorsScreen(),
      },
    );
  }
}
