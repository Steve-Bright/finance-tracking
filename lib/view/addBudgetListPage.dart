import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/view/addDetail.dart';
import 'package:finance_tracking/view/viewDetail.dart';

class AddBudgetPage extends StatelessWidget {
  const AddBudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1)
                ),
                child: const ExpansionTile(
                  title: Text('Budget Detail', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  subtitle: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Total Budget - ', style: TextStyle(fontSize: 18)),
                  ),
                  children: <Widget>[
                    ListTile(title: Text('Expense Used -')),
                    ListTile(title: Text('Budget Received -')),
                    ListTile(title: Text('Future Expense -')),
                  ],
                ),
              ),

              Container(
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
                                color: Colors.green,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                width: 250,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Title'),
                                    Text('+5000')
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
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(AddDetail());
        },
        backgroundColor: Colors.blueAccent,
      )
    );
  }
}
