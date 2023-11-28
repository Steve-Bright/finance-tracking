import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:finance_tracking/controller/firestore.dart';

class BudgetDetailModel implements BudgetControllerHolder{

  @override
  void clearControllers() {
    getTitleController().clear();
    getBudgetController().clear();
    getReasonController().clear();
    getDateController().clear();
    getNotesController().clear();
  }

  TextEditingController _title = TextEditingController();
  RxBool _budgetStatus = RxBool(true);
  TextEditingController _budgetAmount = TextEditingController();
  TextEditingController _reason = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _notes = TextEditingController();

  TextEditingController getTitleController(){return _title;}
  bool getBudgetStatus(){return _budgetStatus.value;}
  TextEditingController getBudgetController(){return _budgetAmount;}
  TextEditingController getReasonController(){return _reason;}
  TextEditingController getDateController(){return _date;}
  TextEditingController getNotesController(){return _notes;}

  void setBudgetStatus(bool status) => _budgetStatus = RxBool(status);
}



