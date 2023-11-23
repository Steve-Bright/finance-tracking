import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Container reusableBudgetTextField(TextEditingController? controller, String title, double areaWidth, double areaHeight, int numOfLines, {bool editable = true, bool numberType = false}){
  return Container(
    margin: EdgeInsets.only(top: 15),
    width: areaWidth,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: areaHeight,
            child: TextField(
              enabled: editable,
              // keyboardType: numberType ? TextInputType.number : TextInputType.text,
                inputFormatters: numberType ? <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ] : null,
              controller: controller,
                maxLines: numOfLines,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(5),
                    )
                )
            ),
          )
        ]
    ),
  );
}