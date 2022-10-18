import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './debts.dart';
import 'common/dabt_item.dart';
import 'dart:math';

class AddDebtor extends StatefulWidget {
  const AddDebtor({super.key});

  @override
  State<AddDebtor> createState() => _AddDebtorState();
}

class _AddDebtorState extends State<AddDebtor> {
  @override
  Widget build(BuildContext context) {
    final debtsData = Provider.of<DebtModel>(context);
    var personNameCont = TextEditingController();
    var debtNameCont = TextEditingController();
    var amountCont = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Debtor"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Avatar(index: Random().nextInt(100)),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 300,
                    child: TextField(
                      controller: personNameCont,
                      decoration: InputDecoration(
                          hintText: 'Person\'s Name',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color.fromARGB(255, 35, 34, 60)),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 60,
                    child: TextField(
                      controller: debtNameCont,
                      decoration: InputDecoration(
                        hintText: 'Debt Name',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color.fromARGB(255, 35, 34, 60),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 300,
            height: 80,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: amountCont,
              decoration: InputDecoration(
                  hintText: 'Person\'s Name',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color.fromARGB(255, 35, 34, 60)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              debtsData.addDebt(
                personNameCont.text,
                debtNameCont.text,
                double.parse(amountCont.text),
              );
            },
            child: Container(
              child: Text('Add Debt'),
            ),
          ),
        ],
      ),
    );
  }
}
