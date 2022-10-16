import 'package:flutter/material.dart';
import '../constants.dart';
import '../debts.dart';

class DebtItem extends StatelessWidget {
  final index;
  const DebtItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundImage:
                NetworkImage('https://i.pravatar.cc/150?img=$index'),
            backgroundColor: Colors.transparent,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                debts[index].debtName,
                style: headerSmall,
              ),
              Text(
                debts[index].person,
                style: descSmall,
              ),
            ],
          ),
        ),
        Text(
          '\$ ${debts[index].amount}',
          style: headerSmall.copyWith(color: mainLime),
        ),
      ],
    );
  }
}
