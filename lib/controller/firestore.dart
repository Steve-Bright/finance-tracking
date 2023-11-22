import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices{

  final _titleController = TextEditingController();
  final _budgetStatusController = TextEditingController();
  final _planFutureController = TextEditingController();
  final _budgetController = TextEditingController();
  final _reasonController = TextEditingController();
  final _dateController = TextEditingController();
  final _notesController = TextEditingController();
  //get collection of notes
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //Create - add new budget
  Future<void> addBudgetList(
      // TextEditingController titleController,
      // TextEditingController budgetStatusController,
      // TextEditingController planFutureController,
      // TextEditingController budgetController,
      // TextEditingController reasonController,
      // TextEditingController dateController,
      // TextEditingController notesController,
      ){
    return notes.add({

      'title': _titleController.text,
      // 'budgetStatus': _budgetStatusController.value,
      // 'planForFuture': _planFutureController.value,
      'budget': _budgetController.text,
      'reason': _reasonController.text,
      'date': _dateController.text,
      'notes': _notesController.text,
      'timestamp': Timestamp.now(),
    });
  }

  void clearAllControllers(){
    _titleController.clear();
    _budgetStatusController.clear();
    _planFutureController.clear();
    _budgetController.clear();
    _reasonController.clear();
    _dateController.clear();
    _notesController.clear();
  }

  TextEditingController getTitleController(){return _titleController;}
  TextEditingController getBudgetStatusController(){return _budgetStatusController;}
  TextEditingController getPlanFutureController(){return _planFutureController;}
  TextEditingController getBudgetController(){return _budgetController;}
  TextEditingController getReasonController(){return _reasonController;}
  TextEditingController getDateController(){return _dateController;}
  TextEditingController getNotesController(){return _notesController;}
}