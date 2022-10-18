import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../debts.dart';
import '../common/debt_item.dart';

class HomeBottom extends StatelessWidget {
  const HomeBottom({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final debtsData = Provider.of<DebtModel>(context);
    final debts = debtsData.debts;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Text(
            'Recent Debts',
            style: descNormal,
          ),
        ),
        debts.isEmpty
            ? Container(
                child: Image.asset('assets/images/NoItem.png'),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: debts.length,
                  itemBuilder: ((context, index) {
                    return DebtItem(index: index);
                  }),
                  separatorBuilder: ((context, index) => SizedBox(height: 20)),
                ),
              ),
      ],
    );
  }
}
