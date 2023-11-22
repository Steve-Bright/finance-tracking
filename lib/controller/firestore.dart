import 'package:finance_tracking/model/budgetDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices{
  final CollectionReference budgetLists = FirebaseFirestore.instance.collection('Budget Lists');
  //Create - add new budget
  Future<void> addBudgetList(BudgetDetail budgetDetail){
    return budgetLists.add({
      'title': budgetDetail.getTitleController().text,
      'budgetStatus': budgetDetail.getBudgetStatus(),
      'Plan For Future': budgetDetail.getPlanFuture(),
      'budget': budgetDetail.getBudgetController().text,
      'reason': budgetDetail.getReasonController().text,
      'date': budgetDetail.getDateController().text,
      'notes': budgetDetail.getNotesController().text,
      'timestamp': Timestamp.now(),

    }
    );
    // return notes.add({
    //   'title': _titleController.text,
    //   'budget': _budgetController.text,
    //   'reason': _reasonController.text,
    //   'date': _dateController.text,
    //   'notes': _notesController.text,
    //   'timestamp': Timestamp.now(),
    // });
  }

  void clearAllControllers(BudgetDetail budgetDetail){
    budgetDetail.getTitleController().clear();
    budgetDetail.getBudgetController().clear();
    budgetDetail.getReasonController().clear();
    budgetDetail.getDateController().clear();
    budgetDetail.getNotesController().clear();
  }

  // TextEditingController getTitleController(){return _titleController;}
  // bool getBudgetStatus(){return _budgetStatus;}
  // bool getPlanFuture(){return _planFuture;}
  // TextEditingController getBudgetController(){return _budgetController;}
  // TextEditingController getReasonController(){return _reasonController;}
  // TextEditingController getDateController(){return _dateController;}
  // TextEditingController getNotesController(){return _notesController;}
}