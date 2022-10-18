import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';

class Debt {
  final id;
  final person;
  final debtName;
  final amount;

  Debt(
      {required this.id,
      required this.person,
      required this.debtName,
      required this.amount});
}

class DebtModel extends ChangeNotifier {
  List<Debt> _debts = [];
  //  List<Debt>.generate(
  //   2,
  //   (index) => Debt(
  //     id: index,
  //     amount: Random().nextInt(100),
  //     debtName: generateWordPairs().take(3).toList().join(' '),
  //     person: generateWordPairs().take(2).toList().join(' ').toUpperCase(),
  //   ),
  // );
  List<Debt> get debts => _debts;
  void addDebt(String person, String debtName, double amount) {
    _debts.add(Debt(
        id: _debts.length, amount: amount, debtName: debtName, person: person));
  }

  Debt getDebt(int index) {
    return _debts[index];
  }

  double findSum() {
    double sum = 0;
    for (Debt debt in _debts) {
      sum += debt.amount;
    }
    return sum;
  }
}
