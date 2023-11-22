import 'package:flutter/material.dart';

Container reusableBudgetTextField(TextEditingController? controller, String title, double areaWidth, double areaHeight, int numOfLines){
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
              controller: controller,
                maxLines: numOfLines,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(5),
                    )
                )
            ),
          )
        ]
    ),
  );
}