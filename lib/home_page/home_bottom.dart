import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../provider/debts.dart';
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
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: const Text(
            'Recent Debts',
            style: descNormal,
          ),
        ),
        debts.isEmpty
            ? Image.asset('assets/images/NoItem.png')
            : Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: debts.length,
                  itemBuilder: ((context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(color: Colors.red),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete,
                            size: 30,
                          ),
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        debtsData.removeDebt(index);
                      },
                      confirmDismiss: (direction) {
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Confirmation'),
                                content: const Text(
                                    'Do you want to remove this debt?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text('No'),
                                  )
                                ],
                              );
                            });
                      },
                      child: DebtItem(index: index),
                    );
                  }),
                  separatorBuilder: ((context, index) => const SizedBox(height: 10)),
                ),
              ),
      ],
    );
  }
}
