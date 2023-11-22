import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/view/reusableWidgets/textfield.dart';
import 'package:finance_tracking/view/reusableWidgets/checkbox.dart';
import 'package:finance_tracking/view/editDetail.dart';

class ViewDetail extends StatelessWidget {
  const ViewDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: (){
                  Get.back();
                }
            ),
            title: Text('Budget Info Details'),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: ()=> Get.to(EditDetail())
              )
            ]
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Enter the title
                    reusableBudgetTextField(null, 'Title', 200, 40, 1),

                    // choose add or remove the budget
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 30),
                      child: Row(
                          children: [
                            InkWell(
                              onTap: (){},
                              child: Container(
                                  color: Colors.greenAccent,
                                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                                  child: Icon(Icons.add)
                              ),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                                  child: Icon(Icons.remove)
                              ),
                            )
                          ]
                      ),
                    ),

                    // If the budget is for future
                    CheckBox(checkboxText: 'Plan for the future'),

                    //Budget Amount
                    reusableBudgetTextField(null, 'Budget Amount', 200, 40, 1),

                    // Reason for adding this budget list
                    reusableBudgetTextField(null,'Reason (Please Describe Detail)', 300, 120, 3),

                    //Add the date
                    reusableBudgetTextField(null,'Date', 200, 40, 1),

                    //notes
                    reusableBudgetTextField(null, 'Notes', 200, 120, 2),
                  ]
              ),
            ),
          ],
        )
    );
  }
}
