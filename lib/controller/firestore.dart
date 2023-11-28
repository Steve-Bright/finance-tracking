import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:finance_tracking/model/budgetDetailModel.dart';
import 'package:finance_tracking/model/editModel.dart';

abstract class BudgetControllerHolder {
  void clearControllers();
}

class FireStoreServices{

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final CollectionReference budgetLists = FirebaseFirestore.instance.collection('Budget Lists');
  //Create - add new budget
  Future<void> addBudgetList(BudgetDetailModel budgetDetail){
    // if (budgetDetail.getBudgetStatus() == false){
    //   calculationControl.calculateExpenseUsed(budgetDetail);
    // }

    return budgetLists.add({
      'title': budgetDetail.getTitleController().text,
      'budgetStatus': budgetDetail.getBudgetStatus(),
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

  Future<Map<String, dynamic>?> getDocumentData(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot =
      await _fireStore.collection('Budget Lists').doc(documentId).get();

      if (documentSnapshot.exists) {
        // Document exists, return its data
        return documentSnapshot.data() as Map<String, dynamic>;
      } else {
        // Document does not exist
        return null;
      }
    } catch (e) {
      print('Error retrieving document: $e');
      return null;
    }
  }

  Future<void> updateNote(String docID, EditBudgetDetail editDetail){
    return budgetLists.doc(docID).update({
      'title': editDetail.getTitleController().text,
      'budgetStatus': editDetail.getBudgetStatus(),
      'budget': editDetail.getBudgetController().text,
      'reason': editDetail.getReasonController().text,
      'date': editDetail.getDateController().text,
      'notes': editDetail.getNotesController().text,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteNote(String docID){
    return budgetLists.doc(docID).delete();
  }

  void clearAllControllers(BudgetControllerHolder controllerHolder){
    controllerHolder.clearControllers();
  }

}

