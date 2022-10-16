import 'package:flutter/material.dart';
import '../constants.dart';
import '../debts.dart';
import '../common/dabt_item.dart';

class HomeBottom extends StatelessWidget {
  const HomeBottom({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(20),
          child: Text(
            'This Week',
            style: descNormal,
          ),
        ),
        Container(
          height: size.height,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.separated(
            itemCount: debts.length,
            itemBuilder: ((context, index) {
              return DebtItem(index: index);
            }),
            separatorBuilder: ((context, index) => SizedBox(height: 10)),
          ),
        ),
      ],
    );
  }
}
