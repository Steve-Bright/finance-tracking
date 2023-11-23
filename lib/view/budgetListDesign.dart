import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/view/viewDetail.dart';

class BudgetListDesign extends StatelessWidget {

  //required parameter
  String title;
  bool budgetStatus;
  bool planFuture;
  String budget;

  BudgetListDesign({
    required this.title,
    required this.budgetStatus,
    required this.planFuture,
    required this.budget
});

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
              onTap: () => Get.to(ViewDetail()),
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
                        color: budgetStatus ? Colors.green : Colors.red,
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
                          onPressed: (){},
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
