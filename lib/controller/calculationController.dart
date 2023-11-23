// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'package:finance_tracking/model/budgetDetail.dart';
// import 'package:finance_tracking/model/calculationModel.dart';
//
// class CalculationController{
//   final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
//   CalculationModel calculationModel = CalculationModel();
//   final CollectionReference budgetLists = FirebaseFirestore.instance.collection('Budget Lists');
//
//   void calculateTotal(BudgetDetail budgetDetail){
//
//   }
//
//   Future<void> calculateExpenseUsed(BudgetDetail budgetDetail){
//     calculationModel.setExpenseUsed(calculationModel.getExpenseUsed() + int.parse(budgetDetail.getBudgetController().text));
//
//     return budgetLists.add({
//       'Expenses Used': calculationModel.getExpenseUsed(),
//     });
//   }
//
//   void calculateBudgetReceived(){
//
//   }
//
//   void calculateFutureExpense(){
//
//   }
// }