import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../debts.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    final sum = Provider.of<DebtModel>(context).findSum();
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
                '\$ ${sum}',
                style: TextStyle(
                  fontSize: 24,
                  color: mainRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
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
