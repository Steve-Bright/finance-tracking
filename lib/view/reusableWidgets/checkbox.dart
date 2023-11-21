import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  String checkboxText = '';
  CheckBox({super.key, required this.checkboxText});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStatePropertyAll(Colors.blue),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),

          Text(widget.checkboxText, style: TextStyle(fontSize: 19))
        ]
    )
    ;
  }
}
