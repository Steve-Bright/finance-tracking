import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/view/reusableWidgets/textfield.dart';
import 'package:finance_tracking/view/reusableWidgets/checkbox.dart';
import 'package:finance_tracking/controller/firestore.dart';
import 'package:finance_tracking/model/budgetDetail.dart';

class EditDetail extends StatelessWidget {
  EditDetail({super.key});

  final BudgetDetail budgetDetail = BudgetDetail();

  final FireStoreServices fireStore = FireStoreServices();
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
            title: Text('Edit Budget Info')
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Enter the title
                    reusableBudgetTextField(budgetDetail.getTitleController(),'Title', 200, 40, 1),

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
                    CheckBox(status: budgetDetail.getPlanFuture(), checkboxText: 'Plan for the future'),

                    //Budget Amount
                    reusableBudgetTextField(budgetDetail.getBudgetController(), 'Budget', 200, 40, 1),

                    // Reason for adding this budget list
                    reusableBudgetTextField(budgetDetail.getReasonController(),'Reason (Please Describe Detail)', 300, 120, 3),

                    //Add the date
                    reusableBudgetTextField(budgetDetail.getDateController(),'Date', 200, 40, 1),

                    //notes
                    reusableBudgetTextField(budgetDetail.getNotesController(),'Notes', 200, 120, 2),

                    Center(
                      child: Container(
                        width: 350,
                        child: TextButton(
                          onPressed: (){
                            fireStore.addBudgetList(budgetDetail);
                            fireStore.clearAllControllers(budgetDetail);
                            Get.back();
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
