import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_tracking/model/viewDetail.dart';
import 'package:finance_tracking/controller/firestore.dart';

class EditBudgetDetail implements BudgetControllerHolder{
  ViewBudgetDetail viewDetail;

  TextEditingController _title = TextEditingController();
  RxBool _budgetStatus = RxBool(true);
  TextEditingController _budgetAmount = TextEditingController();
  TextEditingController _reason = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _notes = TextEditingController();

  EditBudgetDetail({required this.viewDetail}){
    _title = viewDetail.getTitleController();
    _budgetStatus = RxBool(viewDetail.getBudgetStatus());
    _budgetAmount = viewDetail.getBudgetController();
    _reason = viewDetail.getReasonController();
    _date = viewDetail.getDateController();
    _notes = viewDetail.getNotesController();
  }

  TextEditingController getTitleController(){return _title;}
  bool getBudgetStatus(){return _budgetStatus.value;}
  TextEditingController getBudgetController(){return _budgetAmount;}
  TextEditingController getReasonController(){return _reason;}
  TextEditingController getDateController(){return _date;}
  TextEditingController getNotesController(){return _notes;}

  void setBudgetStatus(bool status) => _budgetStatus = RxBool(status);

  @override
  void clearControllers() {
    getTitleController().clear();
    getBudgetController().clear();
    getReasonController().clear();
    getDateController().clear();
    getNotesController().clear();
  }

}