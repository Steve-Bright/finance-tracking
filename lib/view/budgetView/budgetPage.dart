import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_tracking/view/reusableWidgets/budgetListDesign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/view/budgetView/addPage.dart';
import 'package:finance_tracking/view/budgetView/viewPage.dart';
import 'package:finance_tracking/controller/firestore.dart';

class BudgetPage extends StatelessWidget {
  BudgetPage({super.key});

  final FireStoreServices fireStore = FireStoreServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child:
              StreamBuilder<QuerySnapshot>(
                stream: fireStore.getNotesStream(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    List notesList = snapshot.data!.docs;

                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: 300,
                            child: ListView.builder(
                                itemCount: notesList.length,
                                  itemBuilder: (context, index){

                                    DocumentSnapshot document = notesList[index];
                                    String docID = document.id;


                                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                                    String title = data['title'];
                                    bool budgetStatus = data['budgetStatus'];
                                     String budget = data['budget'];

                                    //display as a list tile
                                    return BudgetListDesign(title: title, budgetStatus: budgetStatus,  budget: budget, documentID: docID);
                                  }
                              ),
                          ),
                        ),
                      ],
                    );
                  }
                  else{
                    return Text('Loading');
                  }
                }
              )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('budgetAddButton'),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: (){
          Get.to(AddPage());
        },
        backgroundColor: Colors.black,
      )
    );
  }
}
