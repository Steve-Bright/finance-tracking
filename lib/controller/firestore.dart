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
  }

  Stream<QuerySnapshot> getNotesStream(){
    final budgetListsStream = budgetLists.orderBy('timestamp', descending: true).snapshots();

    return budgetListsStream;
  }

  Future<void> updateNote(String docID, String newTitle){
    return budgetLists.doc(docID).update({
      'title': newTitle,
      'timestamp': Timestamp.now()
    });
  }

  void clearAllControllers(BudgetDetail budgetDetail){
    budgetDetail.getTitleController().clear();
    budgetDetail.getBudgetController().clear();
    budgetDetail.getReasonController().clear();
    budgetDetail.getDateController().clear();
    budgetDetail.getNotesController().clear();
  }

}