import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/controller/fireStore.dart';
import 'package:finance_tracking/view/reusableWidgets/textfield.dart';
import 'package:finance_tracking/view/budgetView/editPage.dart';
import 'package:finance_tracking/model/budgetDetailModel.dart';
import 'package:finance_tracking/model/viewDetail.dart';

class ViewPage extends StatelessWidget {
  String documentID;
  ViewPage({super.key, required this.documentID});
  final BudgetDetailModel budgetDetail = BudgetDetailModel();
  FireStoreServices fireStore = FireStoreServices();

  @override
  Widget build(BuildContext context) {

    // Map<String, dynamic> documentData = fireStore.getDocumentData(documentID) as Map<String, dynamic>;
    return FutureBuilder<Map<String, dynamic>?>(
      future: fireStore.getDocumentData(documentID),
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
          ViewBudgetDetail viewDetail = ViewBudgetDetail(
            title: documentData['title'],
              budgetStatus: documentData['budgetStatus'],
              budgetAmount: documentData['budget'],
          reason: documentData['reason'],
          date: documentData['date'],
          notes: documentData['notes']
          );


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
                        onPressed: ()=> Get.to(EditPage(documentID: documentID, viewDetail: viewDetail,))
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
                          reusableBudgetTextField(viewDetail.getTitleController(), 'Title', 200, 40, 1, editable: false),

                          // choose add or remove the budget
                          Container(
                            margin: EdgeInsets.only(top: 30, bottom: 30),
                            child: Row(
                                children: [
                                  InkWell(
                                    onTap: (){},
                                    child: Container(
                                        color:  viewDetail.getBudgetStatus() ? Colors.greenAccent : null,
                                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                                        child: Icon(Icons.add)
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Container(
                                        color:  viewDetail.getBudgetStatus() ? null : Colors.greenAccent,
                                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                                        child: Icon(Icons.remove)
                                    ),
                                  )
                                ]
                            ),
                          ),

                          //Budget Amount
                          reusableBudgetTextField(viewDetail.getBudgetController(), 'Budget Amount', 200, 40, 1, editable: false),

                          // Reason for adding this budget list
                          reusableBudgetTextField(viewDetail.getReasonController(),'Reason (Please Describe Detail)', 300, 120, 3, editable: false),

                          //Add the date
                          reusableBudgetTextField(viewDetail.getDateController(),'Date', 200, 40, 1, editable: false),

                          //notes
                          reusableBudgetTextField(viewDetail.getNotesController(), 'Notes', 200, 120, 2, editable: false),
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
