import 'package:debt_tracker/debts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import './home_page/home_top.dart';
import './home_page/home_bottom.dart';
import './add_debtor.dart';

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
      ),
      routes: {
        '/': ((context) => HomePage()),
        '/addDebtor': (context) => AddDebtor(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Debtors'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/addDebtor');
            },
            icon: Icon(Icons.add_circle_outline),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeTop(size: size),
            HomeBottom(size: size),
          ],
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: Text('Hello'),
        ),
      ),
    );
  }
}
