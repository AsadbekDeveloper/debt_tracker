import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class Debt {
  final id;
  final person;
  final debtName;
  final amount;
  final isToMe;
  final date;

  Debt(
      {required this.isToMe,
      required this.date,
      required this.id,
      required this.person,
      required this.debtName,
      required this.amount});

  factory Debt.fromJson(Map<String, dynamic> json) {
    return Debt(
        id: json['id'],
        person: json['person'],
        debtName: json['debtName'],
        amount: json['amount'],
        isToMe: json['isToMe'],
        date: json['date']);
  }
}

class DebtModel extends ChangeNotifier {
  List<Debt> _debts = [];
  List<Debt> get debts => _debts;
  void addDebt(
      String person, String debtName, double amount, bool isToMe, String date) {
    _debts.add(Debt(
        id: _debts.length,
        amount: amount,
        debtName: debtName,
        person: person,
        isToMe: isToMe,
        date: date));
    // this.addFire(person, debtName, amount, isToMe, date);

    notifyListeners();
  }

  Debt getDebt(int index) {
    return _debts[index];
  }

  double findSum() {
    double sum = 0;
    for (Debt debt in _debts) {
      debt.isToMe ? sum += debt.amount : sum -= debt.amount;
    }
    return sum;
  }

  void removeDebt(id) {
    _debts.removeAt(id);
    print(id);
    notifyListeners();
  }

  List getDebtors() {
    List<String> debtors = [];
    _debts.forEach((debt) {
      if (debtors.contains(debt.person) == false) debtors.add(debt.person);
    });
    return debtors;
  }

  double getSum(person) {
    double sum = 0;
    _debts.forEach((debt) {
      if (debt.person == person) sum += debt.amount;
    });
    return sum;
  }

  void fromFirestore(Map<String, dynamic> fireMap) {
    _debts.add(Debt(
        id: _debts.length,
        amount: fireMap['amount'],
        debtName: fireMap['debtName'],
        person: fireMap['person'],
        isToMe: fireMap['isToMe'],
        date: fireMap['date']));
    print(fireMap['amount']);
    notifyListeners();
  }

  void addFire(person, debtName, amount, isToMe, date) {
    final auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection('debts')
        .add({
          'amount': amount,
          'debtName': debtName,
          'person': person,
          'isToMe': isToMe,
          'date': date
        })
        .then((value) => print('Done'))
        .catchError((e) => print('error'));
  }
}
