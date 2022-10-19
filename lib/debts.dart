import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';

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
}
