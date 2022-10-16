import 'package:flutter/material.dart';
import '../constants.dart';
import '../debts.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  double findSum() {
    double sum = 0;
    for (Debt debt in debts) {
      sum += debt.amount;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 2,
      width: size.width,
      padding: EdgeInsets.only(top: 80, left: 20, right: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/moneyBG.jpg'),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                '\$ ${findSum().toString()}',
                style: TextStyle(
                  fontSize: 24,
                  color: mainRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                'Dude, you\'re not cash machine',
                style: bigTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}