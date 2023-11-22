import 'package:flutter/material.dart';
import 'package:finance_tracking/model/budgetDetail.dart';

class CheckBox extends StatefulWidget {
  String checkboxText = '';
  bool status;
  CheckBox({super.key, required this.checkboxText, required this.status});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStatePropertyAll(Colors.blue),
            value: widget.status,
            onChanged: (bool? value) {
              setState(() {
                final BudgetDetail budgetDetails = BudgetDetail();
                widget.status = value!;
                budgetDetails.setPlanFuture(widget.status);
              });
            },
          ),

          Text(widget.checkboxText, style: TextStyle(fontSize: 19))
        ]
    )
    ;
  }
}
