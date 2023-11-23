import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/view/homepage.dart';
import 'package:finance_tracking/view/reusableWidgets/textfield.dart';
import 'package:finance_tracking/controller/firestore.dart';
import 'package:finance_tracking/controller/budgetStatusController.dart';
import 'package:finance_tracking/model/budgetDetail.dart';
import 'package:finance_tracking/model/viewDetail.dart';
import 'package:finance_tracking/model/editModel.dart';


class EditDetail extends StatefulWidget {
  String documentID;
  ViewBudgetDetail viewDetail;
  EditDetail({super.key, required this.documentID, required this.viewDetail});

  @override
  State<EditDetail> createState() => _EditDetailState();
}

class _EditDetailState extends State<EditDetail> {
  FireStoreServices fireStore = FireStoreServices();
  final BudgetStatus budgetStatus = BudgetStatus();
  late EditBudgetDetail editBudget;

  @override
  void initState() {
    super.initState();
    editBudget = EditBudgetDetail(viewDetail: widget.viewDetail);
  }

  @override
  Widget build(BuildContext context) {

    // Map<String, dynamic> documentData = fireStore.getDocumentData(documentID) as Map<String, dynamic>;
    return FutureBuilder<Map<String, dynamic>?>(
      future: fireStore.getDocumentData(widget.documentID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator while waiting for the data.
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle errors.
          return Text('Error: ${snapshot.error}');
        } else {
          // The data is available, use it in your UI.

          Map<String, dynamic> documentData = snapshot.data!;


          return Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new),
                      onPressed: (){
                        Get.back();
                      }
                  ),
                  title: Text('Edit Budget Info'),
              ),
              body: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Enter the title
                          reusableBudgetTextField(editBudget.getTitleController(), 'Title', 200, 40, 1),

                          // choose add or remove the budget
                          Container(
                            margin: EdgeInsets.only(top: 30, bottom: 30),
                            child: Row(
                                children: [
                                  InkWell(
                                    child: Container(
                                        color: editBudget.getBudgetStatus() ? Colors.greenAccent : null,
                                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                                        child: Icon(Icons.add)
                                    ),
                                    onTap: (){
                                      setState(() {
                                        if(editBudget.getBudgetStatus() == false){
                                          bool status = budgetStatus.changeBudgetStatus(editBudget.getBudgetStatus());
                                          editBudget.setBudgetStatus(status);
                                        }
                                      });
                                    },
                                  ),
                                  InkWell(
                                    child: Container(
                                        color: editBudget.getBudgetStatus() ? null : Colors.greenAccent,
                                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                                        child: Icon(Icons.remove)
                                    ),
                                    onTap: (){
                                      setState(() {
                                        if(editBudget.getBudgetStatus() == true){
                                          bool status = budgetStatus.changeBudgetStatus(editBudget.getBudgetStatus());
                                          editBudget.setBudgetStatus(status);
                                        }
                                      });
                                    },
                                  )
                                ]
                            ),
                          ),

                          //Budget Amount
                          reusableBudgetTextField(editBudget.getBudgetController(), 'Budget Amount', 200, 40, 1, numberType: true),

                          // Reason for adding this budget list
                          reusableBudgetTextField(editBudget.getReasonController(),'Reason (Please Describe Detail)', 300, 120, 3),

                          //Add the date
                          reusableBudgetTextField(editBudget.getDateController(),'Date', 200, 40, 1),

                          //notes
                          reusableBudgetTextField(editBudget.getNotesController(), 'Notes', 200, 120, 2),

                          Center(
                            child: Container(
                              width: 350,
                              child: TextButton(
                                onPressed: (){
                                  fireStore.updateNote(widget.documentID, editBudget);
                                  fireStore.clearAllControllers(editBudget);
                                  Get.offAll(const HomePage());
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
      },
    );
  }
}
