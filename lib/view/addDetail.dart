import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/controller/firestore.dart';
import 'package:finance_tracking/controller/budgetStatusController.dart';
import 'package:finance_tracking/view/reusableWidgets/textfield.dart';
import 'package:finance_tracking/view/reusableWidgets/checkbox.dart';
import 'package:finance_tracking/model/budgetDetail.dart';

class AddDetail extends StatefulWidget {
  AddDetail({super.key});

  @override
  State<AddDetail> createState() => _AddDetailState();
}

class _AddDetailState extends State<AddDetail> {
  final FireStoreServices fireStore = FireStoreServices();

  final BudgetDetail budgetDetail = BudgetDetail();

  final BudgetStatus budgetStatus = BudgetStatus();

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
                reusableBudgetTextField(budgetDetail.getTitleController(),'Title', 200, 40, 1),

                // choose add or remove the budget
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 30),
                  child: Row(
                    children: [
                      InkWell(
                        child: Container(
                            color: budgetDetail.getBudgetStatus() ? Colors.greenAccent : null,
                            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                            child: Icon(Icons.add)
                        ),
                        onTap: (){
                          setState(() {
                            if(budgetDetail.getBudgetStatus() == false){
                              bool status = budgetStatus.changeBudgetStatus(budgetDetail.getBudgetStatus());
                              budgetDetail.setBudgetStatus(status);
                            }
                          });
                        },
                      ),
                      InkWell(
                        child: Container(
                            color: budgetDetail.getBudgetStatus() ? null : Colors.greenAccent,
                            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                            child: Icon(Icons.remove)
                        ),
                        onTap: (){
                          setState(() {
                            if(budgetDetail.getBudgetStatus() == true){
                              bool status = budgetStatus.changeBudgetStatus(budgetDetail.getBudgetStatus());
                              budgetDetail.setBudgetStatus(status);
                            }
                          });
                        },
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
