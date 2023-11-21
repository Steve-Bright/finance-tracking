import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/view/reusableWidgets/textfield.dart';
import 'package:finance_tracking/view/reusableWidgets/checkbox.dart';

class AddDetail extends StatelessWidget {
  const AddDetail({super.key});

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
        title: Text('Add Budget Info')
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Enter the title
                reusableBudgetTextField('Title', 200, 40, 1),

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
                reusableBudgetTextField('Budget Amount', 200, 40, 1),

                // Reason for adding this budget list
                reusableBudgetTextField('Reason (Please Describe Detail)', 300, 120, 3),

                //Add the date
                reusableBudgetTextField('Date', 200, 40, 1),

                //notes
                reusableBudgetTextField('Notes', 200, 120, 2),

                Center(
                  child: Container(
                    width: 350,
                    child: TextButton(
                      onPressed: (){
                      },
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.only(top: 20, bottom: 20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.purpleAccent),
                        elevation: MaterialStatePropertyAll(40),
                      ),
                      child: const Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ]
            ),
          ),
        ],
      )
    );
  }
}
