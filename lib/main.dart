import 'package:debt_tracker/provider/debts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'screens/home_screen.dart';
import 'screens/add_debt_screen.dart';
import './screens/profile_screen.dart';
import './screens/debtors_screen.dart';
import './screens/login_screen.dart';
import './screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool isSigned = false;
final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (auth.currentUser != null) {
    isSigned = !isSigned;
  }
  runApp(ChangeNotifierProvider(
    create: (context) => DebtModel(),
    child: MyApp(),
  ));
}

void getFromFire(DebtModel debtsData) async {
  try {
    var debt = await firestore.collection('debts').snapshots().map((snapshot) =>
        snapshot.docs.map((debt) => debtsData.fromFirestore(debt.data())));
  } catch (e) {
    print('fail');
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var debtsData = Provider.of<DebtModel>(context);
    getFromFire(debtsData);
    return MaterialApp(
      title: "Debt Tracker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: mainBlue,
        appBarTheme: const AppBarTheme(color: mainBlue),
        drawerTheme: const DrawerThemeData(backgroundColor: mainBlue),
      ),
      initialRoute: isSigned ? '/' : MyRegister.id,
      routes: {
        '/': ((context) => const HomePage()),
        AddDebtor.id: (context) => const AddDebtor(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        DebtorsScreen.id: (context) => const DebtorsScreen(),
        MyRegister.id: (context) => const MyRegister(),
        MyLogin.id: (context) => const MyLogin(),
      },
    );
  }
}
