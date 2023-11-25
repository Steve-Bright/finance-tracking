import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/view/budgetView/viewPage.dart';
import 'package:finance_tracking/controller/firestore.dart';

class BudgetListDesign extends StatelessWidget {

  //required parameter
  String title;
  bool budgetStatus;
  String budget;
  String documentID;

  BudgetListDesign({
    required this.title,
    required this.budgetStatus,
    required this.budget,
    required this.documentID,
});

  FireStoreServices fireStore = FireStoreServices();
  @override
  Widget build(BuildContext context) {
    String status;
    if(budgetStatus == false){
      status = '-';
    }else{
      status = '+';
    }

    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
          children: [
            InkWell(
              onTap: () => Get.to(ViewPage(documentID: documentID)),
              child: Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(width: 1)
                ),
                child: Row(
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: double.infinity,
                        color: budgetStatus ? Colors.green: Colors.red
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: 250,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(title),
                              Text('${status} ${budget}')
                            ]
                        ),
                      ),
                      IconButton(
                          onPressed: (){
                            fireStore.deleteNote(documentID);
                          },
                          icon: Icon(Icons.delete)
                      )
                    ]
                ),
              ),
            )
          ]
      ),
    );
  }
}
