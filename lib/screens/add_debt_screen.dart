import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/debts.dart';
import '../common/avatar.dart';
import '../common/input_field.dart';
import '../constants.dart';

class AddDebtor extends StatefulWidget {
  static final id = 'add_debtor';
  const AddDebtor({super.key});

  @override
  State<AddDebtor> createState() => _AddDebtorState();
}

class _AddDebtorState extends State<AddDebtor> {
  bool isToMe = true;

  @override
  Widget build(BuildContext context) {
    final debtsData = Provider.of<DebtModel>(context, listen: false);
    var personNameCont = TextEditingController();
    var debtNameCont = TextEditingController();
    var amountCont = TextEditingController();
    var dateCont = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add Debtor"),
        centerTitle: true,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Avatar(
                    size: 100,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: isToMe ? const Text('Owes me') : const Text('I owe'),
                              width: 120,
                            ),
                            Switch(
                                value: isToMe,
                                onChanged: ((val) {
                                  setState(() {
                                    isToMe = val;
                                  });
                                })),
                          ],
                        ),
                        InputField(
                          mainController: amountCont,
                          hintText: 'Amount',
                          type: TextInputType.number,
                        ),
                        InputField(
                          mainController: dateCont,
                          hintText: 'Select date',
                          type: TextInputType.datetime,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    InputField(
                      mainController: personNameCont,
                      hintText: 'Person\'s name',
                      type: TextInputType.name,
                    ),
                    InputField(
                      mainController: debtNameCont,
                      hintText: 'Description',
                      type: TextInputType.text,
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
                    isToMe,
                    dateCont.text,
                  );
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
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
