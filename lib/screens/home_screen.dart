import 'package:flutter/material.dart';
import '../home_page/drawer.dart';
import '../home_page/home_bottom.dart';
import '/home_page/home_top.dart';
import 'add_debt_screen.dart';

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
              Navigator.of(context).pushNamed(AddDebtor.id);
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
      drawer: MainDrawer(),
    );
  }
}
