import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/debts.dart';
import '../constants.dart';

class DebtorsScreen extends StatelessWidget {
  static final id = 'debtors_screen';
  const DebtorsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final debtsData = Provider.of<DebtModel>(context);
    final List debtors = debtsData.getDebtors();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debtors'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.topCenter,
        child: DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  'Id',
                  style: headerNormal,
                ),
              ),
              DataColumn(
                label: Text(
                  'Debtors',
                  style: headerNormal,
                ),
              ),
              DataColumn(
                label: Text(
                  'Amount',
                  style: headerNormal,
                ),
              ),
            ],
            rows: debtors
                .map((person) => DataRow(
                        color: MaterialStateProperty.all(
                            debtors.indexOf(person).isOdd
                                ? mainBlue
                                : mainGrey),
                        cells: [
                          DataCell(Text('${debtors.indexOf(person) + 1}')),
                          DataCell(Text(person)),
                          DataCell(
                            Text('${debtsData.getSum(person)}'),
                          ),
                        ]))
                .toList()),
      ),
    );
  }
}
