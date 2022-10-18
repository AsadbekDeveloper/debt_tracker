import 'package:debt_tracker/debts.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:provider/provider.dart';

class DebtItem extends StatelessWidget {
  final index;
  const DebtItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final debt = Provider.of<DebtModel>(context, listen: false).getDebt(index);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Avatar(index: index),
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
          style: headerSmall.copyWith(color: mainLime),
        ),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=$index'),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
