import 'package:debt_tracker/provider/debts.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import './avatar.dart';

class DebtItem extends StatelessWidget {
  final index;
  const DebtItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final debt = Provider.of<DebtModel>(context, listen: false).getDebt(index);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: debtDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Avatar(
            size: 40,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  debt.debtName,
                  style: headerSmall,
                ),
                Text(
                  debt.person,
                  style: descSmall,
                ),
              ],
            ),
          ),
          Text(
            '\$ ${debt.amount}',
            style:
                headerSmall.copyWith(color: debt.isToMe ? mainLime : mainRed),
          ),
        ],
      ),
    );
  }
}
