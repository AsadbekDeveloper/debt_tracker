import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './debts.dart';
import 'common/avatar.dart';
import 'dart:math';
import './common/input_field.dart';
import './constants.dart';

class AddDebtor extends StatefulWidget {
  const AddDebtor({super.key});

  @override
  State<AddDebtor> createState() => _AddDebtorState();
}

class _AddDebtorState extends State<AddDebtor> {
  @override
  Widget build(BuildContext context) {
    final debtsData = Provider.of<DebtModel>(context, listen: false);
    var personNameCont = TextEditingController();
    var debtNameCont = TextEditingController();
    var amountCont = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add Debtor"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Avatar(
                index: Random().nextInt(100),
                size: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    InputField(
                      mainController: personNameCont,
                      hintText: 'Debter\'s name',
                      type: TextInputType.name,
                    ),
                    InputField(
                      mainController: debtNameCont,
                      hintText: 'Debt\'s name',
                      type: TextInputType.text,
                    ),
                    InputField(
                      mainController: amountCont,
                      hintText: 'Debt amount',
                      type: TextInputType.number,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  debtsData.addDebt(
                    personNameCont.text,
                    debtNameCont.text,
                    double.parse(amountCont.text),
                  );
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Add Debt',
                      style: headerNormal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
