import 'package:flutter/material.dart';
import 'package:finance_tracking/controller/firestore.dart';

class ViewBudgetDetail implements BudgetControllerHolder{
  String title;
  bool budgetStatus;
  String budgetAmount;
  String reason;
  String date;
  String notes;

  ViewBudgetDetail({
    required this.title,
    required this.budgetStatus,
    required this.budgetAmount,
    required this.reason,
    required this.date,
    required this.notes
});


  TextEditingController getTitleController(){
    TextEditingController controller = TextEditingController(text: title);
    return controller;
  }
  bool getBudgetStatus(){return budgetStatus;}

  TextEditingController getBudgetController(){
    TextEditingController controller = TextEditingController(text: budgetAmount);
    return controller;
  }
  TextEditingController getReasonController(){
    TextEditingController controller = TextEditingController(text: reason);
    return controller;
  }
  TextEditingController getDateController(){
    TextEditingController controller = TextEditingController(text: date);
    return controller;
  }
  TextEditingController getNotesController(){
    TextEditingController controller = TextEditingController(text: notes);
    return controller;
  }

  @override
  void clearControllers() {
    getTitleController().clear();
    getBudgetController().clear();
    getReasonController().clear();
    getDateController().clear();
    getNotesController().clear();
  }
}