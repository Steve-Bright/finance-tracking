import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BudgetDetail{
  TextEditingController _title = TextEditingController();
  RxBool _budgetStatus = RxBool(true);
  RxBool _planFuture = RxBool(false);
  TextEditingController _budgetAmount = TextEditingController();
  TextEditingController _reason = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _notes = TextEditingController();

  TextEditingController getTitleController(){return _title;}
  bool getBudgetStatus(){return _budgetStatus.value;}
  bool getPlanFuture(){return _planFuture.value;}
  TextEditingController getBudgetController(){return _budgetAmount;}
  TextEditingController getReasonController(){return _reason;}
  TextEditingController getDateController(){return _date;}
  TextEditingController getNotesController(){return _notes;}

  void setBudgetStatus(bool status) => _budgetStatus = RxBool(status);
  void setPlanFuture(bool status) => _planFuture = RxBool(status);
}



