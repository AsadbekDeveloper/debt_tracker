import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../provider/debts.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    final debtsData = Provider.of<DebtModel>(context);
    final sum = debtsData.findSum();
    return Container(
      height: size.height / 2,
      width: size.width,
      padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
      decoration: const BoxDecoration(
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
                '\$ ${sum}',
                style: const TextStyle(
                  fontSize: 24,
                  color: mainRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Text(
              'Dude, you\'re not a cash machine!',
              style: bigTitle,
            ),
          ),
        ],
      ),
    );
  }
}
